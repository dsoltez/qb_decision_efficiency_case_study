# ==== Drake's QB Decision Efficiency Capstone Setup ====
message("🏈 Loading QB Decision Efficiency Capstone environment...")

# 1) Ensure folder structure exists ----------------------------------------
dirs <- c("data/raw", "data/processed", "data/cache", "reports", "figs")
invisible(lapply(dirs, dir.create, showWarnings = FALSE, recursive = TRUE))

# 2) Make sure utils is available (for install.packages) --------------------
if (!"utils" %in% loadedNamespaces()) {
  base::requireNamespace("utils", quietly = TRUE)
}
# Touch the function so the namespace is definitely loaded
utils::install.packages

# 3) Required packages ------------------------------------------------------
qb_packages <- c(
  # Core tidy workflow
  "tidyverse", "janitor", "lubridate", "skimr", "stringr", "forcats", "here", "glue", "scales",
  # NFL analytics stack
  "nflreadr", "nflfastR", "nflplotR", "nflverse", 
  # Viz & reporting
  "ggplot2", "patchwork", "gt", "gtExtras", "rmarkdown", "knitr", "ggrepel", "ggimage", "ggridges",
  "ggtext", "ggfx", "geomtextpath", "cropcircles", "magick", "tinytex", "pandoc",
  # Conflict handling
  "conflicted"
)

install_if_missing <- function(pkgs) {
  ip <- rownames(utils::installed.packages())
  to_install <- setdiff(pkgs, ip)
  if (length(to_install)) {
    message("📦 Installing missing packages: ", paste(to_install, collapse = ", "))
    utils::install.packages(to_install, dependencies = TRUE)
  } else {
    message("✅ All packages already installed.")
  }
}

quiet_library <- function(pkgs) {
  invisible(lapply(pkgs, function(p)
    suppressPackageStartupMessages(library(p, character.only = TRUE))
  ))
}

install_if_missing(qb_packages)
quiet_library(qb_packages)

# 4) Global options ---------------------------------------------------------
options(
  tidyverse.quiet       = TRUE,
  dplyr.summarise.inform = FALSE,
  readr.show_progress   = FALSE,
  nflreadr.cache_dir    = "data/cache",
  nflreadr.verbose      = FALSE
)


if ("ggplot2" %in% loadedNamespaces()) {
  ggplot2::theme_set(ggplot2::theme_minimal())
}

# 5) Conflicted prefs -------------------------------------------------------
suppressPackageStartupMessages(library(conflicted))
conflicts_prefer(
  dplyr::filter,
  dplyr::lag,
  stringr::fixed
)

# 6) Helper functions -------------------------------------------------------
SEASONS <- 2021:2024
assign("SEASONS", SEASONS, envir = .GlobalEnv)


# --- Auto-load NFL Next Gen Stats (passing) ---
try({
  if (!exists("ngs_passing")) {
    message("📊 Loading NFL Next Gen Stats (passing)...")
    ngs_passing <- nflreadr::load_nextgen_stats(
      seasons = 2021:2024,
      stat_type = "passing"
    )
    assign("ngs_passing", ngs_passing, envir = .GlobalEnv)
    message("✅ Next Gen Stats loaded successfully.")
  } else {
    message("✅ Next Gen Stats already loaded.")
  }
}, silent = TRUE)


# Load play-by-play for seasons
load_pbp_seasons <- function(seasons = SEASONS) {
  purrr::map_dfr(seasons, nflfastR::load_pbp)
}

# Prep QB-only plays (dropbacks, no spikes/kneels)
prep_qb_pbp <- function(pbp) {
  pbp |>
    dplyr::filter(
      qb_dropback == 1,
      !is.na(passer_player_name),
      !qb_kneel,
      !qb_spike
    )
}

# Add decision_effective flag (0/1)
add_decision_effective <- function(pbp_qb) {
  pbp_qb |>
    dplyr::mutate(
      decision_effective = dplyr::case_when(
        interception == 1 ~ 0,
        sack == 1 & epa < 0 ~ 0,
        down %in% c(3, 4) & first_down == 1 ~ 1,
        down %in% c(3, 4) & first_down == 0 ~ 0,
        down %in% c(1, 2) & epa >= 0 ~ 1,
        down %in% c(1, 2) & epa < 0 ~ 0,
        TRUE ~ NA_real_
      )
    )
}

# Summarise by QB & season (play-level decision metrics)
summarise_qb_season <- function(pbp_qb_decisions) {
  pbp_qb_decisions |>
    dplyr::group_by(season, qb = passer_player_name) |>
    dplyr::summarise(
      dropbacks          = dplyr::n(),
      effective          = sum(decision_effective, na.rm = TRUE),
      decision_rate      = effective / dropbacks,
      mean_epa           = mean(epa, na.rm = TRUE),
      
      # sacks
      sacks              = sum(sack == 1, na.rm = TRUE),
      
      # turnovers: INTs + fumbles lost
      interceptions      = sum(interception == 1, na.rm = TRUE),
      fumbles_lost       = sum(fumble_lost == 1, na.rm = TRUE),
      turnovers          = sum(interception == 1 | fumble_lost == 1, na.rm = TRUE),
      turnover_rate      = sum(interception == 1 | fumble_lost == 1, na.rm = TRUE) / dropbacks,
      
      .groups            = "drop"
    ) |>
    dplyr::arrange(season, dplyr::desc(decision_rate))
}

message("✅ QB Decision Efficiency environment ready for seasons: ",

        paste(SEASONS, collapse = ", "))

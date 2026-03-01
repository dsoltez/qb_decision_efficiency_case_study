#Combine all seasons with a minimum of 300 dropbacks
qb_total_five_seasons <- dplyr::bind_rows(
  qb_2021_season,
  qb_2022_season,
  qb_2023_season,
  qb_2024_season,
  qb_2025_season
) %>%
  dplyr::arrange(season, dplyr::desc(decision_rate))

#Create a table to find the average for each quarterback over the half five seasons
qb_total_five_seasons <- qb_total_five_seasons %>%
  dplyr::group_by(qb) %>%
  dplyr::summarise(
    seasons_played     = dplyr::n_distinct(season),
    dropbacks          = sum(dropbacks, na.rm = TRUE),
    effectiveness      = sum(effective, na.rm = TRUE),
    avg_decision_rate  = mean(decision_rate, na.rm = TRUE),
    avg_epa            = mean(mean_epa, na.rm = TRUE),
    avg_turnover_rate  = mean(turnover_rate, na.rm = TRUE),
    avg_time_to_throw  = mean(avg_time_to_throw, na.rm = TRUE),
    avg_touchdowns     = mean(total_pass_touchdowns, na.rm = TRUE),
    .groups = "drop"
  ) %>%
  dplyr::arrange(dplyr::desc(avg_decision_rate))
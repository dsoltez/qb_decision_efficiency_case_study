#Create a variable and load play-by-play for 2025 season
pbp_2025 <- load_pbp_seasons(2025)

#Create another variable and load the prep_qb_pbp function
pbp_2025_qb <- prep_qb_pbp(pbp_2025)

#Create a final variable for the decision_effective_pbp %
pbp_2025_qb_decisions <- add_decision_effective(pbp_2025_qb)

#Summarize Quarterback play for the 2025 season
qb_2025_summary <- summarise_qb_season(pbp_2025_qb_decisions, pbp_all = pbp_2025)

#Filter to 300 dropbacks for half season
qb_2025_season <- qb_2025_summary %>%
  dplyr::filter(dropbacks >= 300)

#Create the table and filter through the 2025 season
ngs_passing_qb <- ngs_passing %>%
  dplyr::filter(season == 2025) %>%
  dplyr::group_by(season, player_short_name) %>%
  dplyr::summarise(
    avg_time_to_throw = mean(avg_time_to_throw, na.rm = TRUE),
    total_pass_touchdowns = max(pass_touchdowns, na.rm = TRUE),
    .groups = "drop"
  )

#Left_join the tables to qb_2025_full_season
qb_2025_season <- qb_2025_season %>%
  dplyr::left_join(ngs_passing_qb %>%
                     dplyr::select(player_short_name,avg_time_to_throw, total_pass_touchdowns), 
                   by = c("qb" = "player_short_name"))


#Filter to 500 dropbacks for full season
qb_2025_full_season <- qb_2025_summary %>%
  dplyr::filter(dropbacks >= 500) 
                   
                   
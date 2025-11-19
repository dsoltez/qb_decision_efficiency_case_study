#Create a variable and load play-by-play for 2022 season
pbp_2022 <- load_pbp_seasons(2022)

#Create another variable and load prep_qb_pbp function from .Rprofile file
pbp_2022_qb <- prep_qb_pbp(pbp_2022)

#Create a final variable for the decision_effective_pbp %
pbp_2022_qb_decisions <- add_decision_effective(pbp_2022_qb)

#Summarize Quaterback play for the 2022 season
qb_2022_summary <- summarise_qb_season(pbp_2022_qb_decisions)

#Filter to no less than 300 dropbacks
qb_2022_summary <- qb_2022_summary %>%
  +     dplyr::filter(dropbacks >= 300)


#Create the table filtered only the 2022 season
ngs_passing_qb <- ngs_passing %>%
  dplyr::filter(season == 2022) %>%
  dplyr::group_by(player_short_name, season) %>%
  dplyr::summarise(
      avg_time_to_throw = mean(avg_time_to_throw, na.rm = TRUE),
      total_pass_touchdowns = max(pass_touchdowns, na.rm = TRUE),
    .groups = "drop"
    )

#left_join table ngs_passing_qb with qb_2022_summary
qb_2022_summary <- qb_2022_summary %>%
  dplyr::left_join(ngs_passing_qb_2022 %>%
  dplyr::select(player_short_name, season, avg_time_to_throw, total_pass_touchdowns), 
  by = c("qb" = "player_short_name", season = "season"))



####--------------------------------MY NOTES---------------------------------####

#example of how to move columns either .before or .after
qb_2024_summary <- qb_2024_summary %>%
  dplyr::relocate(column_name, .before = column_name)

qb_2024_summary <- qb_2024_summary %>%
  dplyr::relocate(column_name, .after = column_name)

#Removes columns with the .x or .y
qb_2024_summary <- qb_2024_summary %>%
  dplyr::select(-dplyr::matches("\\.x$"), -dplyr::matches("\\.y$"))

#Remove a single column
qb_2024_summary <- qb_2024_summary %>%
  dplyr::select(-turnovers)

#Create a .csv file
write.csv(qb_2024_summary, "qb_2024_summary.csv", row.names = FALSE)

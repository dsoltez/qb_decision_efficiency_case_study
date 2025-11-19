#Combine all summaries together
qb_all_summary <- dplyr::bind_rows(
  qb_2021_summary,
  qb_2022_summary,
  qb_2023_summary,
  qb_2024_summary
) %>%
  dplyr::arrange(season, dplyr::desc(decision_rate))

#Create a table to find the average for each quarterback over the four seasons
qb_total_four_seasons <- qb_total_summary %>%
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

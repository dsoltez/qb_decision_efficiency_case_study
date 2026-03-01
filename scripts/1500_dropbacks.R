# Quarterbacks on DEI dropbacks = 1500


#Filter to 1500 dropbacks for 5 seasons (2021-2025)
qb_dropbacks_1500 <- qb_total_five_seasons %>%
  dplyr::filter(dropbacks >= 1500)

qb_dropbacks_1500 %>%
  dplyr::arrange(desc(decision_efficiency_index)) %>%
  dplyr::slice(1:10) %>%
  ggplot(aes(
    x = reorder(qb, decision_efficiency_index),
    y = decision_efficiency_index,
    fill = seasons_played,
  )) +
  geom_col(width = 0.6) +
  coord_flip() +
  scale_fill_viridis_c(option = "C") +
  labs(
    title = "Top 10 Quarterbacks By Decision Efficiency Index (2021-2025)",
    subtitle = "Composite score of decision rate, EPA, TD's, TO's, and decision tempo",
    caption = "At least 1500 dropbacks, 300 per season",
    x = "Quarterback",
    y = "Decision Efficiency Index (%)",
    fill = "Seasons Played"
  ) +
  theme_minimal(base_size = 13) +
  theme(
    plot.title = element_text(face = "bold", hjust = 0.5),
    plot.subtitle = element_text(color = "gray30", hjust = 0.5),
    plot.caption = element_text(color = "black", hjust = 0.5),
    axis.text.x = element_text(angle = 45, hjust = 1),
    panel.grid.minor = element_blank()
  )
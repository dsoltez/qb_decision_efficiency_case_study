#Top 10 Quarterback's By DEI(Decision Efficiency Index) Regardless of seasons played


#Template

qb_top_10_DEI %>%
  dplyr::arrange(desc(decision_efficiency_index)) %>%
  dplyr::slice(1:10) %>%
  ggplot(aes(
    x = reorder(qb, -decision_efficiency_index),
    y = decision_efficiency_index,
    fill = seasons_played
  )) +
  geom_col(width = 0.6) +
  scale_fill_viridis_c(option = "C") +
  labs(
    title = "",
    subtitle = "",
    caption = "",
    x = "",
    y = "",
    fill = ""
  ) +
  theme_minimal(base_size = 13) +
  theme(
    plot.title = element_text(face = "bold", hjust = 0.5),
    plot.subtitle = element_text(color = "gray30", hjust = 0.5),
    plot.caption = element_text(color = "black", hjust = 0.5),
    axis.text.x = element_text(angle = 45, hjust = 1),
    panel.grid.minor = element_blank()
  )

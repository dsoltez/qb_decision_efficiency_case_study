#Question #1:

#Which Quarterbacks had the highest decision rate(% of effective decisions
#per dropback) throughout the four seasons?

#Goal: Identify the top-decision makers overall

qb_completed_list_trimmed %>%
  arrange(desc(avg_decision_rate)) %>%
  slice(1:10) %>%
  ggplot(aes(
    x = reorder(qb, -avg_decision_rate),
    y = avg_decision_rate * 100,
    fill = dropbacks        
  )) +
  geom_col(width = 0.7) +
  scale_fill_viridis_c(option = "C") +
  labs(
    title = "Top 10 Quarterbacks by Decision Rate (2021–2024)",
    subtitle = "Percentage of effective decisions per dropback",
    x = "Quarterback",
    y = "Decision Rate (%)",
    fill = "Dropbacks"
  ) +
  theme_minimal(base_size = 13) +
  theme(
    plot.title = element_text(face = "bold", hjust = 0.5),
    plot.subtitle = element_text(color = "gray30", hjust = 0.5),
    axis.text.x = element_text(angle = 45, hjust = 1),
    panel.grid.minor = element_blank()
  )

#Question 3:

#Which Quarterback's show consistent improvement or 
#decline in decision efficiency over the four seasons?

#Goal: Detect career style development or regression patterns

qb_trend_plot <- qb_trend_data %>%
  ggplot(aes(
    x = season,
    y = decision_rate * 100,
  )) +
  geom_line(size = 1.2, color = "red") +
  geom_point(size = 2, color = "black") +
  scale_x_continuous(breaks = c(2021, 2022, 2023, 2024)) +
  facet_wrap(~ qb) +
  labs(
    title = "QB Decision Rate Trends (2021–2024)",
    subtitle = "Only QBs with all four seasons",
    caption = "and ≥ 300 dropbacks each year",
    x = "Season",
    y = "Decision Rate (%)",
  ) +
  theme_minimal(base_size = 13) +
  theme(
    plot.title = element_text(face = "bold", hjust = 0.5),
    plot.subtitle = element_text(color = "gray60", hjust = 0.5),
    plot.caption = element_text(color = "black", hjust = 0.5),
    panel.grid.minor = element_blank()
  )

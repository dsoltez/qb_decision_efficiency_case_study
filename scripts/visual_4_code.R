#Question 4: Is there a relationship between decision effectiveness and decision
#tempo that lead to overall drive success? 

#Goal: Find the correlation between fast/slow decisions and offensive success


#Create a scatter plot visual with a trend line
qb_total_decision_tempo <- qb_total_four_seasons_DEI %>%
  ggplot(aes(
    x = avg_decision_rate * 100,    # decision effectiveness %
    y = avg_time_to_throw          # decision tempo (seconds)
  )) +
  geom_point(size = 3, color = "black") +
  geom_smooth(method = "lm", se = FALSE, size = 0.9, color = "red") +
  geom_text_repel(
    aes(label = qb, color = decision_efficiency_index),
    size = 4,
    max.overlaps = Inf,
    box.padding = 0.5,
    point.padding = 0.3
  ) +
  labs(
    title = "Relationship Between Decision Effectiveness & Tempo",
    subtitle = "Do quicker decisions lead to more effective outcomes over 2021–2024?",
    x = "Decision Effectiveness (%)",
    y = "Average Time To Throw (seconds)"
  ) +
  theme_minimal(base_size = 13) +
  theme(
    plot.title = element_text(face = "bold", hjust = 0.5),
    plot.subtitle = element_text(color = "grey60", hjust = 0.5),
    panel.grid.minor = element_blank()
  )


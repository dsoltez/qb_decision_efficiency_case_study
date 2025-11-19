#Question 2: 

#Which QB's frequently make effective decisions that sustain drives
#and improve offense efficiency?

#Goal: Connect decision-making to positive EPA and consistent drive outcomes

#Create a Bar Chart Visual
qb_total_four_seasons_DEI_trimmed %>%
  dplyr::arrange(desc(decision_efficiency_index)) %>%
  dplyr::slice(1:10) %>%
  ggplot(aes(
    x = reorder(qb, decision_efficiency_index),
    y = decision_efficiency_index,
    fill = avg_epa,
  )) +
  geom_col(width = 0.6) +
  coord_flip() +
  scale_fill_viridis_c(option = "C") +
  labs(
    title = "Top 10 Quarterbacks By Decision Efficiency Index (2021-2024)",
    subtitle = "Composite score of decision rate, epa, touchdowns, and turnovers",
    caption = "At least 300 dropbacks per season",
    x = "Quarterback",
    y = "Decision Efficiency Index (%)",
    fill = "Avg EPA"
  ) +
  theme_minimal(base_size = 13) +
  theme(
    plot.title = element_text(face = "bold", hjust = 0.5),
    plot.subtitle = element_text(color = "gray30", hjust = 0.5),
    plot.caption = element_text(color = "black", hjust = 0.5),
    axis.text.x = element_text(angle = 45, hjust = 1),
    panel.grid.minor = element_blank()
  )



## **ONLY USE IF YOU CHOOSE TO SCALE** ###


#Scaling Metrics from 0-100
qb_total_four_seasons <- qb_total_four_seasons %>%
  dplyr::mutate(
    avg_decision_rate = rescale(avg_decision_rate, to = c(0, 100)),
    avg_epa           = rescale(avg_epa, to = c(0, 100)),
    avg_touchdowns    = rescale(avg_touchdowns, to = c(0, 100)),
    avg_turnover_rate = rescale(avg_turnover_rate, to = c(0, 100)),
    avg_time_to_throw = rescale(avg_time_to_throw, to = c(0, 100)),
  )

#Scaled Metrics from 0-100
qb_total_four_seasons <- qb_total_four_seasons %>%
  dplyr::mutate(
    decision_efficiency_index = 
      (avg_decision_rate * 0.35) +    #35% weight on efficiency
      (avg_epa * 0.25) +              #25% impact value
      (avg_touchdowns * 0.15) -       #reward for production
      (avg_turnover_rate * 0.15) -    #penalty for mistakes
      (avg_time_to_throw * 0.10)      #penalty for slower tempo
  )

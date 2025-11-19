#Create the total decision efficieny index for each quarterback.
qb_total_four_seasons_trimmed <- qb_total_four_seasons_trimmed %>%
                  dplyr::mutate(decision_efficiency_index = 
                        (avg_decision_rate * 100) +     # Efficiency weight
                        (avg_epa * 50) +                # Impact weight
                        (avg_touchdowns * 0.4) -        # Reward for TDs
                        (avg_turnover_rate * 150) -     # Penalty for mistakes
                        (avg_time_to_throw * 2)        # Penalty for slower tempo
                      ) 


#Table for each metric defined
#  | Metric              | Typical Range | Meaning        |
#  | ------------------- | ------------- | -------------- |
#  | `avg_decision_rate` | 0 – 1         | Efficiency %   |
#  | `avg_epa`           | −0.5 – 0.5    | Value per play |
#  | `avg_touchdowns`    | 10 – 40       | Volume stat    |
#  | `avg_turnover_rate` | 0 – 0.1       | % of dropbacks |
#  | `avg_time_to_throw` | 2 – 3.5 sec   | Tempo          |

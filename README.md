# Quarterback Decision Efficiency Case Study (2021–2024)
### Evaluating QB performance through decision-making effectiveness using the Decision Efficiency Index (DEI)

**Author:** Drake Soltez  
**Tools:** R, tidyverse, nflreadr, nflverse, Next Gen Stats, ggplot2  
**Years Analyzed:** 2021–2024  

---

## Overview

This project analyzes NFL quarterback performance by quantifying how effectively quarterbacks make decisions on the field. Using play-by-play data, Next Gen Stats, and custom-built decision metrics, this study introduces the:

### **Decision Efficiency Index (DEI)**  
This metric is designed to capture not just outcomes, but the **quality, efficiency, and tempo** of quarterback decision-making.

**The Decision Efficiency Index is still in its early stages**—a Version 1.0 of a much larger vision.  
Future iterations may adjust weights, incorporate additional situational metrics, or expand to new data sources (pressure, motion, route concepts, etc.).

If you're a coach, analyst, or developer interested in collaborating, improving, or applying this metric, **I welcome contributions and discussion.**

**This project is only the beginning. DEI has the potential to grow into a widely-used decision-quality metric in sports analytics—helping athletes, coaches, and analysts better understand and improve the decision-making behaviors that drive performance.**

This novel, custom-built, multi-factor metric that evaluates quarterback decision quality using:

DEI =
  (avg_decision_rate * 100) +
  (avg_epa * 50) +
  (avg_touchdowns * 0.4) -
  (avg_turnover_rate * 150) -
  (avg_time_to_throw * 3)

### **Interpretation:**

- Higher = Better decision-making

- Rewards efficiency, explosiveness, and ball security

- Penalizes slow processing and mistakes

- An original metric developed exclusively for this study

This project was developed as part of the **Merit America Data Analytics Program** capstone.

---

## Key Business Question

**How does quarterback decision-making influence offensive efficiency and drive success across the 2021–2024 NFL seasons?**

To answer this, four supporting questions were explored:

1. **Which quarterbacks had the highest decision rate (percentage of effective decisions per dropback)?**
2.  **Which quarterbacks make consistently high-impact decisions (DEI)?**
3.  **Which quarterbacks show improvement or decline in decision efficiency over the four seasons?**
4.  **Is there a relationship between decision effectiveness and decision tempo (time to throw)?**
---

##  Data Sources & Preparation

This project uses:

- **NFL Play-by-Play Data (2021–2024)**  
- **Next Gen Stats: Passing data**  
- **Quarterback summary tables created through R**

## Raw Data Download
Because the datasets exceeded GitHub’s 25MB file-size limit, raw data is hosted externally.

**Download here:**
(https://drive.google.com/drive/folders/1xE0d1EsxGtquN9plZJTu4uOuZl7BYoVq?usp=drive_link)

### Filters Applied

- Exclusively **Quarterback Dropbacks** 
- Minimum **300+ dropbacks per season** for 4-year comparison  
- Standardized and cleaned QB names across datasets  
- Removed non-QB plays and situational noise  
- Merged PBP with NGS by QB + season  

All cleaning and processing steps are included in the R Markdown report

---

## Visualizations Included

### **Q1: Top Decision Rate QBs**  
A vertical bar chart showing the top 10 quarterbacks in decision rate.

### **Q2: Decision Efficiency Index (DEI)**  
- Top 10 over four full seasons (300+ dropbacks each year)  
- Optional: Top 10 QBs with 300+ dropbacks in ANY single season  

### **Q3: Trend Analysis (Improvement or Decline)**  
Faceted line chart showing how each full-season QB’s decision rate changed over time.

### **Q4: Decision Efficiency vs. Decision Tempo**  
Scatterplot with regression line showing how processing speed relates to effectiveness.

All plots are generated in the R Markdown report.

---

## Key Findings

- High decision efficiency strongly correlates with positive offensive outcomes.  
- DEI identifies quarterbacks who sustain drives through strong decision-making.  
- Some QBs show clear improvement trends, while others decline across years.  
- Faster **average time to throw** generally correlates with **higher decision effectiveness**.  

Full summaries for each question are included in the R Markdown report.

---


## Repository Structure

| Folder / File | Purpose | Key Contents |
|----------------|---------|--------------|
| [`/`](.) | Root directory containing main scripts and project metadata | `qb_decision_efficiency_case_study.Rmd`, `LICENSE`, `CITATION.cff`, `qb_setup.R` |
| [`data/`](data/) | Cleaned datasets used in analysis | `qb_completed_list_trimmed.csv`, `qb_total_DEI.csv`, `qb_total_four_seasons_DEI.csv`, `qb_total_four_seasons_DEI_trimmed.csv`, `qb_trend_data.csv` |
| [`visuals/`](visuals/) | Exported charts used in the final report | `top10_decision_rate.png`, `top10_dei_4seasons.png`, `top10_dei_min1season.png`, `decision_tempo_relationship.png` |
| [`deliverables/`](deliverables/) | Final knitted HTML report | `qb_decision_efficiency_case_study.html` |
| [`scripts/`](scripts/) | R processing scripts, helper functions, and transformation pipelines | `qb_summaries`, `ggplots scripts` |
| [`README.md`](README.md) | Full project documentation & overview | — |


## How to Reproduce

1. Clone or download the repo  
2. Open the `.Rproj` file in RStudio
3. Knit the R Markdown to HTML and view it
4. Ensure required packages are installed
5. Create your own QB summaries or use the skeleton templates included in the Rscripts
6. View the visualizations and results  

---

## Citation

If you use this project or the DEI metric in your own work, please cite using the included CITATION.cff file (GitHub will auto-generate a citation button).

## License

This project is currently licensed under the MIT License, allowing public use, modification, and attribution.

## Future Work and the Expansion of the DEI Metric

- Enhance the Decision Efficiency Index (DEI) into a more robust, multi-dimensional tool that players and coaches can directly apply to improve on-field decision-making, processing speed, and overall performance.

- Develop a framework other analysts can use, allowing the DEI to become a shared metric within the sports analytics community—supported by transparent formulas, reproducible code, and clear methodology.

- Extend the dataset to a full 10 NFL seasons, enabling deeper trend analysis, aging curves, long-term efficiency trajectories, and era-adjusted comparisons.

- Compare DEI against established quarterback metrics—including QBR, EPA/play, Success Rate, and CPOE—to validate the metric’s predictive power and determine where DEI uniquely captures value that other metrics do not.

- Build an interactive Shiny application to explore DEI rankings, visual trends, tempo relationships, and quarterback profiles. This app could be expanded for coaches, players, and analysts to track real-time efficiency.

- Adapt the DEI framework to other sports, such as baseball decision efficiency (swing decisions, pitch selection), basketball playmaking efficiency, or even defensive decision-making metrics—broadening the usefulness of DEI across athletics.

## Acknowledgments

Special thanks to:

- NFLverse / nflreadr team for open NFL data

- Merit America for providing the analytical framework

- All contributors building open-source NFL analytics tools

---

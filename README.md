# 🏈 Quarterback Decision Efficiency Case Study (2021–2024)
### Evaluating QB performance through decision-making effectiveness using the Decision Efficiency Index (DEI)

**Author:** Drake Soltez  
**Tools:** R, tidyverse, nflreadr, nflverse, Next Gen Stats, ggplot2  
**Years Analyzed:** 2021–2024  

---

## 📘 Overview

This project analyzes NFL quarterback performance by quantifying how effectively quarterbacks make decisions on the field. Using play-by-play data, Next Gen Stats, and custom-built decision metrics, this study introduces the:

### ⭐ **Decision Efficiency Index (DEI)**  
A novel, custom-built, multi-factor metric that evaluates quarterback decision quality using:

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

## 📊 Key Business Question

**How does quarterback decision-making influence offensive efficiency and drive success across the 2021–2024 NFL seasons?**

To answer this, four supporting questions were explored:

1. **Which quarterbacks had the highest decision rate (percentage of effective decisions per dropback)?**
2.  **Which quarterbacks make consistently high-impact decisions (DEI)?**
3.  **Which quarterbacks show improvement or decline in decision efficiency over the four seasons?**
4.  **Is there a relationship between decision effectiveness and decision tempo (time to throw)?**
---

## 🧼 Data Sources & Preparation

This project uses:

- **NFL Play-by-Play Data (2021–2024)**  
- **Next Gen Stats: Passing data**  
- **Quarterback summary tables created through R**

## Raw Data Download
Because the datasets exceeded GitHub’s 25MB file-size limit, raw data is hosted externally.

**Download here:**
🔗 (https://drive.google.com/drive/folders/1xE0d1EsxGtquN9plZJTu4uOuZl7BYoVq?usp=drive_link)

### Filters Applied

- Exclusively **Quarterback Dropbacks** 
- Minimum **300+ dropbacks per season** for 4-year comparison  
- Standardized and cleaned QB names across datasets  
- Removed non-QB plays and situational noise  
- Merged PBP with NGS by QB + season  

All cleaning and processing steps are included in the R Markdown report

---

## 📈 Visualizations Included

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

## 🏆 Key Findings

- High decision efficiency strongly correlates with positive offensive outcomes.  
- DEI identifies quarterbacks who sustain drives through strong decision-making.  
- Some QBs show clear improvement trends, while others decline across years.  
- Faster **average time to throw** generally correlates with **higher decision effectiveness**.  

Full summaries for each question are included in the R Markdown report.

---

## 📁 Repository Structure

/
├── qb_decision_efficiency_case_study.Rmd       # Final R Markdown analysis
├── qb_completed_list_trimmed.csv               # Cleaned season-level summary
├── qb_total_DEI.csv                            # DEI for all QBs (min 1 season)
├── qb_total_four_seasons_DEI.csv               # DEI for 4-season-qualified QBs
├── qb_total_four_seasons_DEI_trimmed.csv       # Cleaned version for visual
├── qb_trend_data.csv                           # Trend analysis input
│
├── visuals/                                    # All charts used in analysis
│   ├── top10_decision_rate.png
│   ├── top10_dei_4seasons.png
│   ├── top10_dei_min1season.png
│   ├── decision_tempo_relationship.png
│
├── deliverables/
│   ├── qb_decision_efficiency_case_study.html  # Knitted HTML report
│
├── README.md                                   # Project documentation
├── LICENSE                                     # Project licensing
└── CITATION.cff                                # Citation metadata


---

## 🚀 How to Reproduce

1. Clone or download the repo  
2. Open the `.Rproj` file in RStudio
3. Knit the R Markdown to HTML and view it
4. Ensure required packages are installed
5. Create your own QB summaries or use the skeleton templates included in the Rscripts
6. View the visualizations and results  

---

## 🧾 Citation

If you use this project or the DEI metric in your own work, please cite using the included CITATION.cff file (GitHub will auto-generate a citation button).

## 📄 License

This project is currently licensed under the MIT License, allowing public use, modification, and attribution.

## ⭐ Future Work

- Full Shiny dashboard for interactive DEI visualization

- Extend dataset to 10 NFL seasons

- Add pressure-based and situational DEI metrics

- Compare DEI to QBR, EPA/play, and CPOE

- Team-specific DEI scouting reports

## 🙌 Acknowledgments

Special thanks to:

- NFLverse / nflreadr team for open NFL data

- Merit America for providing the analytical framework

- All contributors building open-source NFL analytics tools

---



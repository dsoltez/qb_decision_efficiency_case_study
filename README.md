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

- Decision Rate (effective decisions per dropback)  
- Expected Points Added (EPA)  
- Touchdowns  
- Turnovers  
- Decision Tempo (average time to throw)  

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

### Filters Applied

- Only **quarterback dropbacks**  
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

QB_Efficiency_Decision_Capstone/
│
├── data/ # scripts from R converted to CSV files
├── R/ # Setup and processing scripts
├── qb_decision_efficiency_case_study.Rmd
├── README.md
├── MIT License
└── CITATION.cff

---

## 🚀 How to Reproduce

1. Clone or download the repo  
2. Open the `.Rproj` file in RStudio
3. Ensure required packages are installed
4. Create your own QB summaries or use the skeleton templates included in the Rscripts 
5. Knit the R Markdown to HTML
6. View the visualizations and results  

---

## 📚 Future Work

Planned enhancements include:

- Adding situational DEI (red zone, 3rd down, 2-minute, etc.)  
- Pressure-based decision efficiency  
- Drive-level analysis  
- Shiny App for interactive exploration  
- Expanding DEI to a **10-season** dataset  
- Extending the framework to RB, WR, and DB decision metrics  

---

## 📘 Acknowledgements

- **nflreadr / nflverse ecosystem**  
- **Next Gen Stats (NGS)**  
- Merit America Data Analytics Program  

---

## 📄 License
This project is licensed under the MIT License — see the LICENSE file for details.

## 💬 Contact

For questions or collaboration:  
**Drake Soltez**  
Sports Analytics & Data Science  
GitHub: *dsoltez*
E-mail: dsoltez13@gmail.com


---

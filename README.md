# Analysis-in-NHANES-Dataset-using-R
# The Impact of Nightly Sleep Duration on BMI & Blood Pressure

## Author
Niranjan Kumar Kishore Kumar  
Yeshiva University

---

## Project Overview
This project investigates the relationship between nightly sleep duration and its effects on Body Mass Index (BMI) and Blood Pressure. Using statistical analysis and visualization, the study examines whether sleep duration significantly influences these health metrics.

## Table of Contents
1. [Background](#background)
2. [Methods](#methods)
3. [Results](#results)
4. [Discussion and Conclusion](#discussion-and-conclusion)
5. [Reference List](#reference-list)

## Background
The study aims to understand if sleep duration has a significant role in BMI and Blood Pressure levels among adults. Using the NHANES dataset, which comprises 10,000 observations, we hypothesize that variations in sleep patterns impact these health metrics.

## Methods
The analysis is conducted on a dataset with 10,000 observations and 76 variables, sourced from NHANES. Key steps include:
- Selecting relevant variables: participant ID, sleep night duration, BMI, and Blood Pressure.
- Generating descriptive statistics to identify patterns and variances.
- Conducting hypothesis testing to evaluate the relationship between sleep duration, BMI, and Blood Pressure using linear regression and ANOVA analysis.

### Hypotheses:
- **BMI**: Is there a significant difference in BMI across sleep duration categories?
- **Blood Pressure**: Is there a significant difference in Blood Pressure across sleep duration categories?

## Results
### Key Findings
1. **BMI and Sleep Duration**:
   - Linear regression analysis showed a significant association between sleep duration and BMI.
   - ANOVA results indicated differences in mean BMI across sleep duration categories.
   - **Post hoc analysis**: Individuals with 6-9 hours of sleep showed a lower BMI than those with 2-6 hours.

2. **Blood Pressure and Sleep Duration**:
   - Linear regression confirmed a significant relationship between sleep duration and Blood Pressure.
   - ANOVA results indicated variations in mean Blood Pressure across sleep categories.
   - **Post hoc analysis**: Sleep durations of 9-12 hours are associated with lower Blood Pressure compared to shorter sleep durations.

### Visualizations
- Scatter plots and box plots visualize the relationship between sleep duration and health metrics (BMI & Blood Pressure).
- Post hoc analysis results are also represented through visualizations.

## Discussion and Conclusion
The study concludes that nightly sleep duration significantly impacts both BMI and Blood Pressure. Shorter sleep durations are associated with higher BMI and Blood Pressure levels, suggesting that sufficient sleep is crucial for managing these health metrics. Further research could explore additional factors and underlying mechanisms influencing this relationship.

## Reference List
A comprehensive list of references is included in the full project documentation.

---

## Files in this Repository
- `data/`: Contains the NHANES dataset (10,000 observations, 76 variables).
- `analysis/`: Python scripts and Jupyter notebooks for statistical analysis, hypothesis testing, and data visualization.
- `results/`: Output files including regression summaries, ANOVA tables, and visualizations.

## How to Use
1. Clone this repository:
   ```bash
   git clone https://github.com/yourusername/impact-of-sleep-on-bmi-bp.git


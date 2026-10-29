# ✈️ Airline Passenger Satisfaction Analysis Using SQL

## 📌 Project Overview

This project analyzes airline passenger data using MySQL to understand customer satisfaction patterns across different passenger segments, travel classes, service ratings, and flight delays.

The main objective is to identify satisfaction trends, compare customer groups, and explore areas where the airline experience may need further investigation.

I used SQL queries to perform data exploration, calculate satisfaction rates, compare passenger segments, and conduct advanced analysis using Common Table Expressions (CTEs) and window functions.

## 🎯 Project Objectives

- Analyze overall passenger satisfaction.
- Compare satisfaction across customer types and travel classes.
- Understand satisfaction patterns across different age groups.
- Analyze passenger ratings for onboard and online services.
- Compare satisfaction between delayed and non-delayed passengers.
- Identify passenger segments with relatively low satisfaction.
- Practice intermediate and advanced SQL concepts using a real-world dataset.

## 🛠️ Tools & Technologies

- **Database:** MySQL
- **SQL Concepts:** Filtering, aggregation, grouping, subqueries, CTEs, CASE statements, and window functions
- **Analysis Techniques:** Satisfaction-rate calculations, segment comparisons, ranking, and running totals
- **Development Environment:** MySQL Workbench
- **Version Control:** Git and GitHub

## 📂 Project Structure

```text
airline-passenger-satisfaction-sql/
│
├── sql/
│   ├── 01_create_database.sql
│   ├── 02_create_table.sql
│   ├── 03_data_validation.sql
│   ├── 04_exploratory_analysis.sql
│   ├── 05_customer_satisfaction_analysis.sql
│   └── 06_advanced_analysis.sql
│
├── README.md
└── .gitignore
```

*The file structure above reflects the current planned project organization. Update the filenames if your actual repository differs.*

## 📊 Dataset Information

The dataset used in this analysis contains **307,725 passenger records**.

It includes passenger demographics, travel details, service ratings, flight distances, delay information, and satisfaction labels.

### Key Columns

| Column | Description |
|---|---|
| `Age` | Passenger's age |
| `Flight Distance` | Distance covered by the flight |
| `Customer Type` | Loyal or disloyal customer |
| `Type of Travel` | Business or personal travel |
| `Class` | Business, Eco, or Eco Plus |
| `Inflight wifi service` | Passenger's Wi-Fi service rating |
| `Online boarding` | Passenger's online boarding rating |
| `Seat comfort` | Passenger's seat comfort rating |
| `Inflight entertainment` | Passenger's entertainment rating |
| `Departure Delay in Minutes` | Departure delay duration |
| `Arrival Delay in Minutes` | Arrival delay duration |
| `satisfaction` | Passenger satisfaction label |

## 🔍 Analysis Performed

### 1. Exploratory Data Analysis

- Analyzed overall passenger satisfaction.
- Examined passenger distribution by age group.
- Compared passenger counts across travel classes.
- Analyzed business and personal travel categories.
- Compared satisfaction across gender and travel classes.

### 2. Customer Satisfaction Analysis

- Calculated satisfaction rates for different customer types.
- Compared satisfaction across Business, Eco, and Eco Plus classes.
- Analyzed satisfaction by travel purpose and age group.
- Examined service ratings and their relationship with satisfaction.
- Compared satisfaction across departure-delay categories.

### 3. Advanced SQL Analysis

- Ranked services by average rating.
- Identified passenger segments with different satisfaction levels.
- Compared segment-level satisfaction with overall satisfaction.
- Ranked travel classes and age groups using `DENSE_RANK()`.
- Used `LAG()` to compare satisfaction rates between ranked classes.
- Calculated running passenger totals using window functions.
- Compared average arrival delays across satisfaction groups.

## 📈 Key Findings

The following findings are based on the query results obtained during the analysis.

| Analysis | Finding |
|---|---|
| Overall satisfaction | 44.30% satisfied and 55.70% dissatisfied |
| Customer type | Loyal customers had a 49.47% satisfaction rate |
| Business Class | Highest class-level satisfaction at 72.56% |
| Eco Class | Satisfaction rate of 16.61% |
| Eco Plus Class | Satisfaction rate of 24.58% |
| Travel purpose | Business Travel satisfaction was 58.40% |
| Personal Travel | Satisfaction rate was 9.63% |
| Age group | Passengers aged 46–60 had the highest age-group satisfaction rate at 60.05% |
| Service ratings | Baggage handling had the highest average rating at approximately 3.81 |
| Service ratings | Inflight Wi-Fi had the lowest average rating at approximately 2.78 |
| Departure delays | Satisfaction was 44.72% for passengers without departure delays and 40.12% for delayed passengers |

### Additional Observation

Satisfaction rates differed across passenger segments and service-rating categories. These patterns can help identify areas for further investigation, but the analysis alone does not establish the causes of passenger dissatisfaction.

## 🧠 SQL Skills Demonstrated

This project demonstrates practical use of:

- `SELECT`, `WHERE`, `ORDER BY`, and `DISTINCT`
- `GROUP BY` and `HAVING`
- Aggregate functions such as `COUNT()`, `SUM()`, and `AVG()`
- Conditional logic using `CASE`
- Percentage and satisfaction-rate calculations
- Subqueries and Common Table Expressions (CTEs)
- `UNION ALL`
- Window functions:
  - `DENSE_RANK()`
  - `LAG()`
  - `SUM() OVER()`
- Data segmentation and comparative analysis

## 💡 Business Value

This analysis can help an airline investigate:

- Which passenger groups report lower satisfaction.
- How satisfaction differs across travel classes.
- Which service ratings may deserve further investigation.
- Whether satisfaction patterns differ between delayed and non-delayed passengers.
- Which areas could be explored further to improve the passenger experience.

These are analytical insights rather than confirmed explanations of customer behavior.

## ▶️ How to Run the Project

1. Install MySQL and open MySQL Workbench.
2. Create or select the project database.
3. Execute the SQL files in the appropriate order.
4. Import the dataset into the `airline_passengers` table.
5. Run the validation queries to check the imported data.
6. Execute the exploratory, customer satisfaction, and advanced analysis scripts.
7. Review the result grids and compare the outputs with the findings documented above.

**Note:** The database and table names, column names, and data types in the SQL scripts must match your local setup.

## 👨‍💻 About This Project

I created this project to strengthen my SQL skills and apply data analysis techniques to a passenger satisfaction dataset.

Through this project, I practiced transforming raw passenger data into meaningful summaries, comparing customer segments, and using advanced SQL techniques to investigate business questions.

## 🔗 Connect With Me

- **GitHub:** [View My GitHub Profile](https://github.com/aayushpatidar0924-dotcom)
- **LinkedIn:** [Connect With Me on LinkedIn](https://www.linkedin.com/in/aayush-patidar-56aa6530a/)
---

**Project:** Airline Passenger Satisfaction Analysis Using SQL  
**Focus Area:** Data Analytics | SQL | Customer Satisfaction Analysis
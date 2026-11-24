# 🏭 Manufacturing Downtime Analysis

An end-to-end **Manufacturing Downtime Analysis** project built using **MySQL and Microsoft Power BI** to analyze production performance, line efficiency, operator performance, and major downtime factors.

The project transforms manufacturing production data into actionable insights through SQL analysis and an interactive Power BI dashboard.

---

## 🎯 Project Objective

The main objective of this project is to analyze manufacturing production data and identify:

- Overall line efficiency
- Average production time
- Total downtime
- Underperforming operators
- Leading downtime factors
- Product-wise production performance
- Batch-level production performance
- Areas where production efficiency can be improved

---

## 🛠️ Tools & Technologies

- **MySQL** — Data exploration, cleaning, analysis and SQL queries
- **Microsoft Power BI** — Data visualization and dashboard development
- **SQL** — Aggregations, joins, grouping, filtering and analytical queries
- **Power Query** — Data preparation and transformation
- **DAX** — KPI calculations and Power BI analysis

---

## 📁 Dataset / Tables

The analysis uses multiple manufacturing-related tables:

### `products`
Contains product-level information such as:

- Product
- Minimum batch time

### `line_productivity`
Contains production-level information such as:

- Date
- Product
- Batch
- Operator
- Start Time
- End Time
- Production Time (minutes)

### `line_downtime`
Contains downtime information associated with production activities.

### `downtime_factors`
Contains information about different causes/factors contributing to downtime.

---

## 🔍 SQL Analysis

The project uses SQL to explore and analyze the manufacturing data.

Some of the key analyses include:

### Line Efficiency

Line efficiency was calculated by comparing the minimum batch time with the actual production time.

```sql
SELECT 
    SUM(p.`Min batch time`) AS min_batch_time,
    SUM(lp.`Production Time(minutes)`) AS total_actual_time,
    ROUND(
        SUM(p.`Min batch time`) / 
        SUM(lp.`Production Time(minutes)`),
        2
    ) AS Line_efficiency
FROM line_productivity AS lp
JOIN products AS p
    ON lp.product = p.product;
```

### Production Time

Total actual production time was calculated using:

```sql
SELECT 
    SUM(`Production Time(minutes)`) AS total_actual_time
FROM line_productivity;
```

### Batch Analysis

The project also analyzes the number of batches and actual production time for each product.

```sql
SELECT
    Product,
    COUNT(*) AS batch_count,
    SUM(`Production Time(minutes)`) AS actual_time
FROM line_productivity
GROUP BY Product
ORDER BY Product;
```

### Operator Performance

Operator-level production performance was analyzed to identify operators with relatively lower performance.

### Downtime Factors

Downtime factors were analyzed to identify the major contributors to production downtime.

---

## 📈 Key Dashboard KPIs

The Power BI dashboard highlights the following overall KPIs:

| KPI | Value |
|---|---:|
| Line Efficiency | **64%** |
| Average Production Time | **101.53 minutes** |
| Total Downtime | **1466 minutes** |

---

## 📊 Dashboard Analysis

The dashboard contains several major sections:

### 1. Line Efficiency

Shows the overall efficiency of the manufacturing line based on minimum batch time compared with actual production time.

### 2. Average Production Time

Displays the average time required for production activities.

### 3. Total Downtime

Shows the overall downtime recorded in the analyzed production data.

### 4. Underperforming Operators

A comparison of operator-level performance helps identify operators with relatively higher production delays or lower efficiency.

### 5. Leading Downtime Factors

The dashboard identifies the major causes contributing to downtime, allowing potential production bottlenecks to be investigated.

### 6. Operator × Downtime Factor Analysis

The matrix at the bottom of the dashboard provides a detailed breakdown of downtime factors across different operators.

---

## 💡 Key Insights

The analysis helps answer important manufacturing business questions such as:

- How efficient is the production line?
- Which operators require further investigation?
- What are the biggest causes of downtime?
- Which downtime factors contribute most to production losses?
- How much actual production time is being used?
- Which products require more production time?
- Where can the manufacturing process be improved?

---

## 🚀 Business Recommendations

Based on the analysis, manufacturing teams can:

1. Investigate the highest-impact downtime factors first.
2. Analyze machine-related downtime to identify maintenance opportunities.
3. Review operator performance and provide additional training where required.
4. Monitor production time against standard/minimum batch time.
5. Track downtime factors regularly through a Power BI dashboard.
6. Focus improvement efforts on the factors causing the largest production losses.

---
## 📂 Project Files

```text
manufacturing-downtime-analysis/
│
├── README.md
│
├── SQL/
│   ├── data_exploration.sql
│   ├── analysis_queries.sql
│   └── manufacturing_analysis.sql
│
├── PowerBI/
│   └── Manufacturing_Downtime_Analysis.pbix
│
├── Dashboard/
│   └── manufacturing_downtime_dashboard.png
│
└── Data/
    └── README.md
```

---

## 🎓 Skills Demonstrated

This project demonstrates practical skills in:

- SQL
- MySQL
- Data Cleaning
- Data Exploration
- Data Analysis
- Joins
- Aggregations
- GROUP BY
- CASE statements
- KPI Development
- Power Query
- Power BI
- Data Visualization
- Dashboard Design
- Manufacturing Analytics
- Business Insights

---

## 👩‍💻 Author

**Mehek Gour**

Mechanical Engineering Student | Aspiring Data Analyst

🔗 GitHub: [MehekGour](https://github.com/MehekGour)

🔗 LinkedIn: [Mehek Gour](https://www.linkedin.com/in/mehek-gour-ba5508298)

---

## ⭐ Project Highlights

**Domain:** Manufacturing Analytics  
**Tools:** MySQL + Power BI  
**Focus:** Production Efficiency & Downtime Analysis  
**Project Type:** End-to-End Data Analytics Project

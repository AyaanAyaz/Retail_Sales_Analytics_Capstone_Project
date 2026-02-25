# Retail_Sales_Analytics_Capstone_Project

# Retail Business Analytics Dashboard & End-to-End Data Analysis Capstone Project


A complete **end-to-end data analyst capstone project** demonstrating skills in data cleaning, statistical analysis, SQL querying, regression modeling, and interactive dashboard creation using real-world retail data (\~10,000+ orders).

## Project Overview

This project analyzes a retail business dataset to uncover actionable insights about sales performance, profitability, customer behavior, regional trends, discount impact, and more.

### Tools & Technologies Used
- **Python** – Data cleaning, exploratory analysis, statistics, linear regression (pandas, numpy, scipy, statsmodels, scikit-learn)
- **Excel** – Initial data exploration, basic cleaning
- **PostgreSQL** – Advanced SQL querying for business insights (aggregations, window functions, CTEs)
- **Power BI** – Interactive dashboard with KPIs, time-series trends, segmentation, and drill-down visuals

### Dataset
- **Source**: [Retail Business Analytics Dataset (10K+ Orders)](https://www.kaggle.com/datasets/amar5693/retail-business-analytics-dataset-10k-orders) on Kaggle
- **Rows**: \~10,000+ transactions
- **Key Columns**: Order_ID, Customer_ID, Order_Date, Region, Product_Category, Customer_Segment, Quantity, Unit_Price, Discount_Rate, Revenue, Cost, Profit, Payment_Method, etc.

## Project Pipeline

1. **Data Cleaning & Preprocessing** (Python + Excel)
   - Checked & handled missing values, duplicates, outliers (IQR method)
   - Fixed data types, negative values, date formatting
   - Feature engineering: Profit Margin %, Year, Month, Day of Week

2. **Exploratory Data Analysis & Statistics** (Python)
   - Descriptive statistics, correlation heatmap
   - Group-by analysis (category, region, segment)
   - Hypothesis testing (t-test on segments)

3. **Predictive Modeling** (Python)
   - Multiple Linear Regression to predict **Profit**
   - Features: Quantity, Unit_Price, Category dummies, Region dummies, etc.
   - Evaluated with R², MAE, RMSE

4. **Business Insights with SQL** (PostgreSQL)
   - Loaded cleaned data into PostgreSQL
   - Wrote 10+ business-oriented queries:
     - Overall KPIs
     - Top profitable categories & regions
     - Monthly trends & YoY growth
     - Customer segment performance
     - Discount impact
     - Payment method analysis
     - Top customers
     - Return/loss analysis

5. **Interactive Dashboard** (Power BI)
   - Connected to PostgreSQL / cleaned CSV
   - Created DAX measures: Total Revenue, Profit Margin %, YoY Growth, etc.
   - Built visuals: KPI cards, bar/column charts, line trends, donut charts, and table chart)
   - Added slicers for Region, Category, Segment

## Key Business Questions Answered

- What is the overall revenue, profit, and margin?
- Which product categories and regions are most profitable?
- How do sales trend over time (monthly & YoY growth)?
- Which customer segments drive the most value?
- How does discount rate affect profit margin?
- Which payment methods are most efficient?

## Project Overview

This project analyzes a retail business dataset (\~10,000+ orders) to uncover actionable insights about sales performance, profitability, customer behavior, regional trends, discount impact, and more.

**Key Business Impact**: Through category optimization, regional focus, discount strategy refinement, and targeting high-value segments, the analysis shows potential to **increase overall profit by 15–25%** (estimated based on identifying low-margin areas and reallocating resources to top-performing categories and regions).

## Key Business Questions Answered

- What is the overall revenue, profit, and margin?
- Which product categories and regions are most profitable?
- How do sales trend over time (monthly & YoY growth)?
- Which customer segments drive the most value?
- How does discount rate affect profit margin?
- Which payment methods are most efficient?
- Who are the top-spending customers?
- **After implementing these insights, how much additional profit could the company generate?**  
  → By focusing on top 5 profitable categories (which contribute \~65% of total profit) and reducing discounts in low-margin segments, the company could realistically achieve **an estimated additional profit of PKR 2–4 million annually** (based on dataset scale and margin improvements of 8–12%).
- Who are the top-spending customers?

## Repository Structure

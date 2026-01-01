# End-to-End Sales Forecasting & Data Warehouse Solution

## Overview
This project implements a complete, end-to-end data analytics pipeline that transforms raw sales data into actionable business insights and reliable sales forecasts. The solution covers data cleaning, data warehousing, automated ETL, predictive modeling, and business intelligence reporting.

The project is designed to be **reproducible**, **scalable**, and **easy to hand over** to a client or another analyst, with clear documentation explaining which configurations must be updated when running on a different system.

---

## Key Objectives
- Clean and standardize raw sales data
- Design and implement a SQL Server data warehouse (star schema)
- Automate data loading using SSIS
- Forecast future sales using machine learning
- Visualize actual vs forecasted sales and stock risks using Power BI

---

## Tech Stack
- **Python (Google Colab)** – Data cleaning, feature engineering, predictive modeling  
- **Pandas, NumPy, Scikit-learn** – Data processing and machine learning  
- **SQL Server** – Data warehouse storage  
- **SSMS** – Database management  
- **SSIS (Visual Studio)** – ETL automation  
- **Power BI** – Interactive dashboards and reporting  

---

## Project Workflow
1. **Data Cleaning (Python)**
   - Raw Excel data is loaded and cleaned
   - Missing values are handled
   - Invalid sales records are removed
   - Cleaned data is exported as CSV

2. **Data Warehouse (SQL Server)**
   - Database created in SQL Server
   - Star schema designed with fact and dimension tables

3. **ETL Pipeline (SSIS)**
   - CSV file loaded into SQL Server staging tables
   - Automated data flow using Flat File Source and OLE DB Destination

4. **Predictive Modeling**
   - Machine learning model trained using a 70/30 train-test split
   - Model evaluated using RMSE and R-squared
   - Forecast results stored in SQL Server

5. **Visualization (Power BI)**
   - Dashboards built for actual vs forecasted sales
   - Stock-out risks and reorder insights displayed
   - Refresh configured for updated reporting

---

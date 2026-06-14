# 🛒 Retail Store Data Analysis Project

## 📌 Project Overview

**Project Title:** retail_sales_analysis

**Database:** superstore_db

This project focuses on analyzing a retail store dataset containing information about orders, customers, products, sales, discounts, and profit. The goal is to transform raw transactional data into meaningful business insights using SQL and data analysis techniques.


🎯 Objective
1. To analyze overall sales and profit trends over time
2. Identify best-performing and worst-performing products and categories
3. Understand customer purchasing behavior across segments and regions
4. Evaluate the impact of discounts on profitability
5. Detect seasonal trends and monthly sales patterns
6. Identify high-value customers and revenue contributors
7. Provide data-driven insights for improving business decisions

Project Structure
1🔄 ETL Pipeline: Python to MySQL
This project implements an ETL (Extract, Transform, Load) pipeline to move retail sales data from a local CSV file into a MySQL database using Python 
```python
from sqlalchemy import create_engine
import pandas as pd
df = pd.read_csv(r"D:\animequality force\superstore_clean.csv")
engine = create_engine(
    "mysql+pymysql://<username>:<password>@localhost:3306/superstore_db")
df.to_sql("superstore", con=engine, if_exists="replace", index=False)
print("Data uploaded successfully!")
```
2 📊 Revenue & Profitability Analysis

#1 Which products generate high sales but low profit?
```sql
select 
product_name,
sum(sales) as total_sales,
sum(profit) as total_profit,
round((sum(profit) / sum(sales))* 100 , 2) as `profit_margin(%)`
FROM superstore_db.superstore
GROUP BY product_name
having total_profit > 0 and total_profit < 1500
order by total_sales desc;
```
#2 Which products generate low sales but high profit?
```sql


2 Data anyk

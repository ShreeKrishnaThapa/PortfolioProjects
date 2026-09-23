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

📁 Project Structure

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
📊 SQL Analytics Layer

💰 Revenue & Profitability Analysis

Q1 Which products generate high sales but low profit?
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
Q2 Which products generate low sales but high profit?
```sql
select 
product_name,
sum(sales) as total_sales,
sum(profit) as total_profit,
round((sum(profit) / sum(sales))* 100 , 2) as `profit_margin(%)`
FROM superstore_db.superstore
GROUP BY product_name
HAVING 
    sum(profit) > 500 and sum(sales) < 500000
ORDER BY 
    total_profit desc;
```
Q3  Which categories are subsidizing loss-making categories?
```sql
select 
category,
sum(sales) as total_sales,
sum(profit) as `total_profit($)`,
case 
when sum(sales) > 800000 then "profitable"
else 'loss_making'
end as contribution
from superstore_db.superstore
GROUP BY category
order by total_sales desc, `total_profit($)` desc;
```
Q4 What percentage of total profit comes from the top 10 products?
```sql
SELECT
product_name,
sum(sales) as `total_sales $` ,
sum(profit) as `total_profit $`,
round(sum(profit) / sum(sales) * 100 ,2) as `profit_contribution %`
from superstore_db.superstore
GROUP BY product_name
order by `profit_contribution %` desc , `total_profit $` desc
limit 10;
```
Q5 Which products should be discontinued due to consistent losses?
```sql
SELECT
 product_name,
 sum(sales) as `total_sales $`,
 sum(profit) as `total_profit $`,
 case 
 when sum(profit) < 0 then 'discontinued'
 end as `status`
 from superstore_db.superstore
 GROUP BY product_name
 having sum(profit) < 0 
 order by `total_profit $` asc;
```
Q6 Which sub-categories have the highest profit margin?
```sql
select
 `sub-category`,
 round((sum(profit) / sum(sales)) *100 , 2) as `profit margin %`
 from superstore_db.superstore
 group by `sub-category`
 having `profit margin %` >0
 ORDER BY `profit margin %` desc;
 ```
Q7 Which products have negative profit despite high sales?
```sql
SELECT
 product_name,
 sum(sales) as total_sales,
 sum(profit) as `total_profit $`,
 case
 when sum(profit) <0 then 'highsales,loss'
 end as `status`
 from superstore_db.superstore
 GROUP BY product_name
 HAVING sum(profit) < 0
 order by  `total_profit $` asc;
```

🧑‍🤝‍🧑customer_analysis

Q1 Perform RFM (Recency, Frequency, Monetary) analysis.
```sql
 SELECT
 customer_id ,
 customer_name ,
  recency_days,
    orders,
    monetry,
ntile(5) over (order by  recency_days desc) as R,
ntile(5) over(order by orders desc) as F ,
NTILE(5) over(order by monetry desc) as M
from 
(
select
customer_id,
customer_name,
 datediff(curdate() , max(order_date)) as recency_days ,
 count(order_id) as orders,
 sum(sales) as monetry 
 from superstore_db.superstore
GROUP BY customer_id, customer_name
 ) t ;
 ```
Q2 Identify VIP customers.
```sql
select
 customer_id ,
 customer_name ,
 sum(sales) as total_sales ,
 count(order_id)  as total_order,
 sum(profit) as total_profit ,
 case 
 when sum(sales) > 10000 then "YES"
 when count(order_id) > 5 then "YES"
 when sum(profit) > 5000 then 'YES'
 else 'NO'
 
 end as `VIP status`
from superstore_db.superstore
GROUP BY customer_id , customer_name
having sum(profit) > 0
order by total_sales desc;
```
Q3 Identify customers likely to churn
```sql
SELECT
 customer_id ,
 customer_name ,
 max(order_date) as last_order_date,
 count(order_id) as total_order ,
 datediff(curdate(), max(order_date)) as days_since_order,
 case
  when datediff(curdate() , max(order_date)) BETWEEN 0 and 30 then 'low'
  when datediff(curdate() , max(order_date)) between 31 and 90 then  'medium'
  when datediff(curdate() , max(order_date)) between 91 and 180 then 'high'
  else 'very high'
  end as churn_risk
from superstore_db.superstore
GROUP BY customer_id , customer_name
order by days_since_order desc;
```
Q4 Find customers who purchase across multiple categories.
```sql
SELECT
customer_id ,
customer_name ,
GROUP_CONCAT(DISTINCT category ORDER BY category) AS categories,
count(distinct category) as `No.of purchased`,
count(order_id) as total_order,
sum(sales) as total_sales
from superstore_db.superstore
GROUP BY customer_id , customer_name
having count(DISTINCT category) > 1;
```
Q5  Calculate customer lifetime value
```sql
SELECT
 customer_id ,
 customer_name ,
 min(order_date) as `first order date`,
 max(order_date) as `last order date `,
 count(order_id) as total_order,
 sum(sales) as total_sales,
 avg(sales) as avg_order_value,
 datediff(max(order_date), min(order_date)) as `customer lifetime days`,
 sum(sales) as `customer lifetime values $`
 FROM superstore_db.superstore
 GROUP BY customer_id , customer_name
 order by total_sales desc;
```
Q6 Find the top 20% of customers contributing to revenue.
```sql
with ranked_customer as (
select customer_id,
customer_name,
sum(sales) as total_revenue,
ntile(5) over (order by sum(sales) desc) as revenue_rank
from superstore_db.superstore
GROUP BY customer_id , customer_name
)
select customer_id ,
customer_name,
total_revenue ,
revenue_rank ,
round(total_revenue *100 / sum(total_revenue) over() ,2) as revenue_precent ,
case when revenue_rank = 1 then 'yes'
else 'no'
end as revenue_rank_of_20
from ranked_customers
GROUP BY customer_id ,customer_name;
```
Q7 Segment customers into High, Medium, and Low value groups.
```sql
select
customer_id ,
customer_name ,
sum(sales) as `total_revenue($)` ,
case when sum(sales) > 15000 then 'High'
when sum(sales) > 10000 then "medium"
else 'LOW'
end as value_segment
from superstore_db.superstore
GROUP BY customer_id , customer_name
order by 	`total_revenue($)` desc;
```

💰 Discount Optimization

Q1 At what discount level does profit become negative?
```sql
with discount_anylzer as 
(
select
order_id,
round((sum(discount) / sum(sales)) * 100 ,2 ) as `discount%` ,
sum(sales) as total_sales,
sum(profit) as total_profit 
from superstore_db.superstore
GROUP BY order_id
)
SELECT
order_id,
`discount%`,
total_sales ,
total_profit ,
case when `discount%` BETWEEN 0 and 20 then 'Profitable'
when `discount%` BETWEEN 21 and 30 then 'breakeven'
when `discount%` BETWEEN 31 and 40 then 'loss'
else 'loss'
end as profit_status
from discount_anylzer
GROUP BY order_id ;
```
Q2 Which products are most sensitive to discounts?
```sql
 with product_discount_sensitivity as 
 (
 SELECT
 product_name,
 round(avg(discount)  *100 , 2) as avg_discount ,
 avg(profit) as avg_profit
 from superstore_db.superstore
 GROUP BY product_name
 )
 SELECT
 product_name,
 avg_profit,
 avg_discount,
 case when avg_discount  BETWEEN 0 and 3 then 'stable_profit'
 when avg_discount between 3 and 6 then 'moderate'
 when avg_discount between 7 and 9 then 'strong decline'
 ELSE  'loss increase rapidly'
 end as profit_drop_rate
 from product_discount_sensitivity
 GROUP BY product_name;
```
Q3 Which categories can tolerate discounts without losing profit? 
```sql
with tolerate_discount as (
SELECT 
category,
round(avg(discount) * 100 ,2) as avg_discount,
avg(profit) as avg_profit
from superstore_db.superstore 
GROUP BY category
)
select
category ,
avg_discount ,
avg_profit ,
case when avg_discount BETWEEN 0.2 and 2 then 'remain_profitable'
when avg_discount BETWEEN 3 and 5 then 'slight decline but positive'
when avg_discount BETWEEN 6 and 8 then 'turn negative quickly'
end as profit_tend_higher_discount ,
case 
 when avg_profit >  200 then 'high'
when avg_profit > 150 then "medium"
when avg_profit > 100 then "low"
end as discount_tolerance
from tolerate_discount
GROUP BY category;
```
Q4 Compare high-discount vs low-discount customer behavior
```sql
with high_low as (
SELECT 
customer_id ,
avg(discount * 100 ) as `avg_discount%`,
count(order_id) as total_order,
avg(sales) as `avg_order_value$`,
sum(sales) as `total_revenue$`,
sum(profit) as `total_profit$`
from superstore_db.superstore
GROUP BY customer_id
) 
select
customer_id,
`avg_discount%`,
total_order,
`avg_order_value$`,
`total_revenue$`,
`total_profit$`,
case when total_order >13 and `total_revenue$` > 1000 and `avg_discount%` >  13 then 'high dicount customers'
ELSE 'low discount customer'
end as `customer group`
from high_low 
GROUP BY customer_id;
```

🌍  Geographic Intelligence

Q1 Create a state profitability ranking
```sql
select
NTILE(20) over (ORDER BY sum(sales) desc ) as `rank`,
`state/province` ,
sum(sales) as total_sales$ ,
sum(profit) as total_profit,
round((sum(profit) / sum(sales)) * 100 , 2 ) as profit_margin
from superstore_db.superstore
GROUP BY `state/province`;
```
Q3 Find cities that are making consistenly maiking loss.
```sql
SELECT
 city,
 count(order_id) as total_order,
sum(sales) as `total_sales$`,
sum(profit) as `total_profit$`,
round((sum(profit)/ sum(sales) )*100 ,2 ) as `profit_margin%`,
case
when sum(profit) < 0 then "consistent loss"
end as loss_status
from superstore_db.superstore
GROUP BY city
having `total_profit$` < 0;
```
Q4 Determine regional market opportunities
```sql
SELECT
region ,
sum(sales) as `total_sales$`,
sum(profit) as `total_profit`,
round((sum(profit)/ sum(sales) )*100 ,2) as `profit margin %`,
case
when sum(sales) > 100000 and sum(profit) > 100000 then 'maintain and scale'
when sum(sales ) > 100000 and sum(profit) < 50000 then 'margin improvement '
when sum(sales) <1000 and sum(profit) > 500000 then 'expansion opportunity'
else 'turnaround  oppourtnity'
end as `market oppourtunity`
from superstore_db.superstore
GROUP BY region;
```
Q5 Which states should receive more marketing budget? 
```sql
with market_budget as(
select
`state/province`,
sum(sales) as `total_sales$`,
sum(profit) as `total_profit$`,
round((sum(profit) / sum(sales) )*100 ,2 ) as `profit margin%`
from superstore_db.superstore
GROUP BY `state/province`
) 
SELECT `state/province`,
`total_sales$`,
`total_profit$`,
`profit margin%`,
case when `profit margin%` > 30 then 'High'
when `profit margin%` > 15 then 'medium'
else 'low'
end as `market budget priority`
from market_budget
GROUP BY `state/province`;
```

📦 Product Portfolio Analysis

Q1 Perform ABC analysis of products
```sql
with abc_anaylsis as (
SELECT product_name,
sum(sales) as total_sales,

round((sum(sales)  / sum(sales))* 100 , 2) as `cumulative %`
from superstore_db.superstore
GROUP BY product_name
)
SELECT
product_name,
total_sales,
round((total_sales / total_sales ) *100 ,2 ) as `% of total sales`,
`cumulative %`,
case when `cumulative %` > 50 then 'A'
when `cumulative %` > 15 then 'B'
ELSE 'C'
end as `ABC category`
from abc_anaylsis
GROUP BY product_name;
```
Q2 Identify cash-cow products.
```sql
with cash_cow_product as 
(
SELECT
product_name,
sum(sales) as total_sales,
sum(profit) as total_profit,
round((sum(profit)  / sum(sales) )*100 ,2) as profit_margin
from superstore_db.superstore
GROUP BY product_name
)
SELECT product_name,
total_sales,
total_profit,
profit_margin,
case when total_sales > 250 and total_profit > 100 AND profit_margin > 20 then 'HIGH'
end as `sales volumne`,
case when total_sales > 250 and total_profit > 100 and profit_margin > 20 then 'Cash Cow'
end as cash_cow_status
from cash_cow_product
GROUP BY product_name
HAVING total_sales> 250 and total_profit >100 and profit_margin > 20;
```
Q3 Identify star products.
```sql
with star_product as (
select
product_name ,
sum(sales) as total_sales,
sum(profit) as total_profit,
round((sum(profit) / sum(sales)) * 100 ,2) as profit_margin
from superstore_db.superstore
GROUP BY product_name
)
SELECT
product_name,
total_sales,
total_profit,
profit_margin,
case when profit_margin > 45 then'star'
end as star_status ,
case when profit_margin > 45 then 'high_growth'
when profit_margin > 30 then 'rapid_growth'
when profit_margin > 15 then 'strong_growth'
end as growth_trend
from star_product
GROUP BY product_name
having profit_margin > 0;
```
Q4 Find products frequently purchased together.
```sql
SELECT 
product_id,
product_name as productA,
product_name as productB,
count(*) as co_purchase_count,
case when count(*) > 12 then 'very strong' 
when count(*) > 7 then "strong"
WHEN count(*) > 6 then "medium"
else 'low'
end as association_stength
from superstore_db.superstore
GROUP BY product_id, productA , productB;
```
Q5  Analyze category contribution to overall business performance.
```sql
SELECT category ,
sum(sales) as `total_sales$`,
sum(profit) as `total_profit$`,
sum(sales) / sum(sum(sales)) over() *100 as `sales contribution%`,
round((sum(profit)/ sum(sales)) * 100 , 2) as `profit margin`,
sum(profit) / sum(sum(sales)) over() * 100 as `profit contribution %`
from superstore_db.superstore
GROUP BY category;
```

📈⏳ Time-Series & Trend Analysis

Q1 Detect seasonal products.
```sql
 with seasonal_product as(
 SELECT
 product_name,
 case
 when MOnth(order_date) in (12,1,2) then 'winter'
 when month(order_date) in (3,4,5) then 'spring'
 when month(order_date) in (6,7,8) then "summer"
 else 'autumn'
 end as season ,
 avg(sales) as avg_sales
 FROM superstore_db.superstore
 GROUP BY product_name ,
             CASE
                WHEN MONTH(order_date) IN (12,1,2) THEN 'winter'
                WHEN MONTH(order_date) IN (3,4,5) THEN 'spring'
                WHEN MONTH(order_date) IN (6,7,8) THEN 'summer'
                ELSE 'autumn'
             END
 )
 SELECT
 product_name ,
 season ,
 avg_sales ,
 RANK() over(PARTITION BY product_name order by avg_sales desc) as rnk
 from  seasonal_product;
```
Q2 Calculate Month-over-Month growth.
```sql
with mom as(
 SELECT
 extract(month from order_date)  as months,
 sum(sales) as total_sales
 from superstore_db.superstore
 GROUP BY months
 )
 SELECT
 months,
 total_sales ,
 total_sales - lag(total_sales) over (order by months) as mom_difference,
 round((total_sales - lag(total_sales) over (order by months)) / lag(total_sales) over (order by months) *100,2) as `MOM_growth%`
 from mom;
 ```
Q3 Calculate Year-over-Year growth.
```sql
 with yoy as(
 SELECT
 extract(year from order_date) as years,
 sum(sales) as total_sales
 from superstore_db.superstore
 GROUP BY years
 )
 SELECT
 years,
 total_sales,
 total_sales -lag(total_sales) over (order by years) as yoy_difference,
 round((total_sales - lag(total_sales) over(order by years) )/ lag(total_sales)over (order by years) *100,2) as `YOY_growth%`
 from yoy
 GROUP BY years;
```
Q4 Identify months with abnormal sales spikes.
```sql
with sales_spikes as (
 SELECT
 extract(month from order_date) as months,
 sum(sales) as total_sales
 from superstore_db.superstore
 GROUP BY months
 )
 SELECT 
 months,
 total_sales,
 avg(total_sales) over (PARTITION BY months) as expected_sales,
( (total_sales - avg(total_sales) over ()) / avg(total_sales) over () *100) as  sales_deviation
 from sales_spikes;
```
Q5 Forecast future sales.
```sql
with future_sales as (
 select
 extract(month from order_date) as months,
 sum(sales) as actual_sales
 from superstore_db.superstore
 GROUP BY EXTRACT(MONTH FROM order_date)
 )
 SELECT
 months,
 actual_sales,
 avg(actual_sales) over (order by months rows between  2 preceding  and CURRENT ROW) as forcast_sales,
 avg(actual_sales) over (order by months) + STDDEV(actual_sales) over (PARTITION BY months) as lower_bond,
 avg(actual_sales) over (order by months) - STDDEV(actual_sales) over (PARTITION BY months) as upper_bond
 from future_sales;
```



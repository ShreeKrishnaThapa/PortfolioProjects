# 🛒 E-Commerce Sales Analytics with Excel

This is an e-commerce sales analytics project I built using **Excel**. I started with raw customer, product, order, and order-item data and used Excel to clean the data, create PivotTables, and build a dashboard.

The main purpose of this project was to understand how an e-commerce business is performing and answer questions such as:

* Which months have the highest sales?
* Which products and brands are performing well?
* Which regions generate the most revenue?
* Which customers are buying repeatedly?
* Which marketing channels bring more sales?
* How much profit is the business making?
* How well are orders being delivered?

---

## 📁 Project Structure

```text
ecommerce-sales-analytics-excel/
│
├── 📄 README.md
│
├── 📁 data/
│   │
│   ├── 📁 raw/
│   │   ├── orders.csv
│   │   ├── products.csv
│   │   ├── order_items.csv
│   │   └── customers.csv
│   │
│   └── 📁 processed/
│       └── ecommerce_cleaned.xlsx
│
├── 📁 excel/
│   └── ecommerce_sales_analytics.xlsx
│
└── 📁 pivot_tables/
    ├── PT_Sales.xlsx
    ├── PT_Product.xlsx
    └── PT_Customer.xlsx
```

---

## 📊 About the Data

I used four main datasets for this project.

### 🧾 Orders

The `orders.csv` file contains information about each order.

Some of the important columns are:

* `order_id`
* `order_date`
* `customer_id`
* `Customer_Name`
* `customer_age`
* `gender`
* `customer_segment`
* `customer_type`
* `customer_city`
* `customer_state`
* `customer_country`
* `region`
* `payment_method`
* `payment_status`
* `shipping_method`
* `warehouse`
* `delivery_days`
* `estimated_delivery_days`
* `delivery_status`
* `customer_rating`
* `marketing_channel`
* `quantity`
* `gross_sales`
* `discount_amount`
* `tax_amount`
* `shipping_cost`
* `net_sales`
* `product_cost`
* `profit`
* `profit_margin_percentage`
* `customer_lifetime_value`
* `is_repeat_customer`
* `customer_order_count`

I mainly used this dataset for the **sales, regional, marketing, and delivery analysis**.

---

### 🛍️ Products

The `products.csv` file contains information about the products being sold.

Important columns include:

* `product_id`
* `Product_Name`
* `product_category`
* `Product_Subcategory`
* `Brand`
* `Supplier`
* `unit_price`
* `product_cost`
* `product_rating`

This dataset is mainly used for **product, category, brand, and rating analysis**.

---

### 🧺 Order Items

The `order_items.csv` file contains the products included in each order.

Important columns include:

* `order_id`
* `product_id`
* `quantity`
* `unit_price`
* `discount_percentage`
* `discount_amount`
* `gross_sales`
* `tax_amount`
* `shipping_cost`
* `net_sales`
* `product_cost`
* `profit`

This helps connect individual orders with the products that were purchased.

---

### 👥 Customers

The `customers.csv` file contains customer information.

Important columns include:

* `customer_id`
* `customer_name`
* `customer_age`
* `gender`
* `Customer_Segment`
* `Customer_City`
* `Customer_State`
* `customer_country`
* `Region`
* `customer_postal_code`
* `customer_acquisition_cost`

I used this data mainly for **customer segment, retention, CLV, acquisition, and demographic analysis**.

---

# 🔗 How the Tables Connect

The four datasets are connected using IDs.

```text
Customers
    │
    │ customer_id
    ▼
Orders
    │
    │ order_id
    ▼
Order_Items
    │
    │ product_id
    ▼
Products
```

The relationships are:

```text
Customers.customer_id
        ↓
Orders.customer_id

Orders.order_id
        ↓
Order_Items.order_id

Products.product_id
        ↓
Order_Items.product_id
```

For example, an order belongs to a customer through `customer_id`, while the products inside that order are connected through `order_id` and `product_id`.

---

# 🧹 Data Cleaning

Before creating the PivotTables, I prepared the raw data.

The main things I checked were:

* Missing values
* Duplicate records
* Incorrect data types
* Date formatting
* Numeric values
* Customer and product IDs
* Sales and profit values
* Inconsistent category names

The cleaned data is saved in:

```text
data/processed/ecommerce_cleaned.xlsx
```

---

# 📊 PivotTable Analysis

I created three main areas for the PivotTable analysis.

```text
💰 Sales
   │
   ├── Monthly Sales & Profit
   ├── Regional Sales
   ├── Sales & Marketing Channel
   └── Order & Delivery Performance

🛍️ Product
   │
   ├── Product Performance
   ├── Category & Subcategory
   ├── Brand Performance
   └── Product Rating

👥 Customer
   │
   ├── Customer Segment
   ├── Customer Retention
   ├── Customer CLV & Acquisition
   └── Customer Demographics
```

---

## 💰 Sales Analysis

### 1. Monthly Sales & Profit

I used this PivotTable to see how sales and profit change throughout the year.

I looked at:

* Gross sales
* Discounts
* Net sales
* Profit

I also added filters for order status and sales channel.

This helps answer:

> **Which months are performing best in terms of sales and profit?**

---

### 2. Regional Sales

This PivotTable compares sales between different regions and states.

I looked at:

* Net sales
* Profit
* Number of orders

This helps answer:

> **Which regions and states are generating the most business?**

---

### 3. Sales & Marketing Channel

Here I compared sales channels with marketing channels.

I looked at:

* Net sales
* Profit
* Number of orders

This helps answer:

> **Which marketing and sales channels are bringing the best results?**

---

### 4. Order & Delivery Performance

For this analysis, I looked at delivery status and shipping methods.

The main metrics were:

* Number of orders
* Average delivery days
* Average estimated delivery days
* Average customer rating

This helps answer:

> **Are orders being delivered on time, and does delivery performance affect customer satisfaction?**

---

# 🛍️ Product Analysis

### 5. Product Performance

This PivotTable compares individual products.

I looked at:

* Quantity sold
* Gross sales
* Net sales
* Profit

The main question is:

> **Which products are generating the most sales and profit?**

---

### 6. Category & Subcategory Performance

This analysis looks at product categories and their subcategories.

I compared:

* Quantity sold
* Net sales
* Profit

This helps identify which product categories are performing well.

---

### 7. Brand Performance

Here I compared different brands based on:

* Quantity sold
* Net sales
* Profit

This helps answer:

> **Which brands contribute the most to the business?**

---

### 8. Product Rating Analysis

I combined product ratings with sales performance.

I looked at:

* Average product rating
* Quantity sold
* Net sales
* Profit

This helps me see whether highly rated products are also strong sellers.

---

# 👥 Customer Analysis

### 9. Customer Segment Performance

This PivotTable compares different customer segments and customer types.

I looked at:

* Number of customers
* Net sales
* Profit
* Average customer rating

This helps answer:

> **Which customer segments are the most valuable?**

---

### 10. Customer Retention

I used `is_repeat_customer` to compare repeat and non-repeat customers.

I looked at:

* Number of customers
* Average order count
* Net sales
* Profit

This helps understand how important returning customers are to the business.

---

### 11. Customer CLV & Acquisition

This analysis focuses on customer value and acquisition cost.

I looked at:

* Customer lifetime value
* Customer acquisition cost
* Number of orders
* Loyalty points earned
* Loyalty points redeemed

The main question is:

> **Which customers provide the most long-term value compared with the cost of acquiring them?**

---

### 12. Customer Demographics

I analyzed customers by:

* Gender
* Customer type
* Age
* Acquisition cost

This gives a better understanding of the customer base.

---

The main workbook is:

```text
excel/ecommerce_sales_analytics.xlsx
```

---

# 🧠 What I Learned From This Project

While working on this project, I practiced:

* Cleaning raw data in Excel
* Working with multiple datasets
* Understanding relationships between tables
* Creating PivotTables
* Using filters and grouping
* Analyzing sales and profit
* Analyzing customer behavior
* Analyzing product performance
* Building dashboards
* Turning raw data into business information

---

# 🛠️ Tools Used

* 📊 **Microsoft Excel / WPS Excel**
* 📄 **CSV**
* 📈 **Excel PivotTables**
* 📊 **Excel Dashboard**
* 🐙 **GitHub**
* 📝 **Markdown**

---

# 🚀 Future Improvements

There are several things I would like to add to this project later:

* 🐍 Python for automated data cleaning
* 🗄️ SQL database for storing the data
* ☁️ BigQuery for cloud analytics
* 🔧 dbt for data transformation
* 📊 Power BI dashboard
* 🔄 Automated data pipelines
* 📈 Sales forecasting
* 🤖 Machine learning for customer and sales prediction

---

# 📌 Project Goal

The main goal of this project was not just to create PivotTables, but to practice taking **raw e-commerce data and turning it into useful business analysis**.

This project is part of my learning journey in **Data Analytics, Data Engineering, and Machine Learning**.


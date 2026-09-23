# 🏗️ Project Architecture

This project takes healthcare data from raw CSV files through cleaning, storage, transformation, and finally Power BI.

## 🔄 Data Flow

```text
📄 Raw CSV Files
       │
       ▼
🧹 Excel Cleaning
       │
       ▼
📄 Cleaned CSV Files
       │
       ▼
🐍 Python / Pandas
       │
       ▼
☁️ Google BigQuery
       │
       ▼
🔧 dbt Staging
       │
       ▼
📊 dbt Marts
       │
       ▼
📈 Power BI
       │
       ▼
💡 Healthcare Dashboard
```

## 🛠️ Tools Used

| Tool               | Purpose                 |
| ------------------ | ----------------------- |
| 📄 CSV             | Source data             |
| 🧹 Excel           | Data cleaning           |
| 🐍 Python / Pandas | Data ingestion          |
| ☁️ BigQuery        | Data warehouse          |
| 🔧 dbt             | Data transformation     |
| 📈 Power BI        | Dashboard and reporting |

## 📌 Main Layers

**Raw Data**
Original healthcare CSV files.

**Cleaning**
Data is cleaned and standardized in Excel before loading.

**Warehouse**
Cleaned data is loaded into Google BigQuery.

**Transformation**
dbt creates staging views and analytical mart tables.

**Visualization**
Power BI connects to the transformed data to build the healthcare dashboard.


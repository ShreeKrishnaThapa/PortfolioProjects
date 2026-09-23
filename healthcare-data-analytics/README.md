# 🏥 Healthcare Data Analytics

A healthcare analytics project where I worked with patient, doctor, hospital, appointment, prescription, and insurance data.

The main goal was to clean the data, load to bigquery , build a data model, and create a Power BI dashboard for exploring healthcare activity.

## 🔄 Project Flow

```text
CSV Files
   ↓
Excel Cleaning
   ↓
Python / Pandas
   ↓
Google BigQuery
   ↓
dbt
   ↓
Power BI
```

## 🛠️ Tools Used

* 🧹 **Excel** — Data cleaning
* 🐍 **Python / Pandas** — Data loading
* ☁️ **Google BigQuery** — Data warehouse
* 🔧 **dbt** — Data transformation
* 📊 **Power BI** — Dashboard and analysis

## 📊 Data

The project works with:

* 👤 Patients
* 👨‍⚕️ Doctors
* 🏥 Hospitals
* 📅 Appointments
* 💊 Prescriptions
* 🧾 Insurance Claims

## 🗂️ Project Structure

```text
`healthcare-data-analytics/`
│
├── `data/`
│   ├── `raw/`
│   └── `cleaned/`
│
├── `excel/`
│   └── `before_cleaning`
│   └── `after_cleaning`
├── `python/`
│   └── `ingestion/`
│
├── `dbt/`
│   ├── `models/`
│   │   ├── `staging/`
│   │   └── `marts/`
│   └── `sources.yml`
│
├── `powerbi/`
│   ├── `healthcare_dashboard.pbix`
│   └── `screenshots/`
│
├── `documentation/`
│   ├── `data_dictionary.md`
│   ├── `data_model.md`
│   ├── `project_architecture.md`
│   └── `business_questions.md`
│
└── `README.md
```

## 📈 Dashboard

The Power BI dashboard is used to look at:

* Appointment activity
* Patient information
* Doctor and hospital activity
* Prescription trends
* Insurance claims

### 🖼️ Power BI Model

![Power BI Data Model](![Uploading power bi models.png…])


## 🎯 What I Worked On

* Cleaned the original datasets in Excel
* Loaded the cleaned data using Python
* Stored the data in BigQuery
* Created staging and mart models with dbt
* Built relationships between the tables
* Created a Power BI dashboard for analysis

This is a personal data analytics project created to practice working with data from the initial cleaning stage through to the final dashboard.


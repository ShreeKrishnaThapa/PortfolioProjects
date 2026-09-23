# 🗂️ Healthcare Data Model

The project uses a simple **star-schema style model** for Power BI.

## 📊 Model

```text
                 👤 dim_patients
                       │
                       │
                       ▼
👨‍⚕️ dim_doctors ──► 📅 fact_appointments ◄── 🏥 dim_hospitals
                       │
                  ┌────┴────┐
                  ▼         ▼
            💊 fact_      🧾 fact_
            prescriptions insurance_claims
```

## 📋 Tables

### Dimensions

* 👤 `dim_patients` — Patient details
* 👨‍⚕️ `dim_doctors` — Doctor details
* 🏥 `dim_hospitals` — Hospital details

### Facts

* 📅 `fact_appointments` — Appointment records
* 💊 `fact_prescriptions` — Prescription records
* 🧾 `fact_insurance_claims` — Insurance claim records

## 🔗 Relationships

```text
dim_patients   → fact_appointments
dim_doctors    → fact_appointments
dim_hospitals  → fact_appointments

fact_appointments → fact_prescriptions
fact_appointments → fact_insurance_claims
```

Most relationships are **1-to-many (1:*)**.

## 📈 Power BI

The model is used in Power BI to analyze appointments, patients, doctors, hospitals, prescriptions, and insurance claims.

Model screenshot:<img width="676" height="476" alt="power bi models" src="https://github.com/user-attachments/assets/aac88738-c71a-4b67-9107-b0564bc4a8ce" />


`powerbi/screenshots/model_view.png`

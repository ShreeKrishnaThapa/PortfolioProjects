# 📖 Healthcare Data Dictionary

Main columns used in the healthcare analytics project.

## 📅 `stg_appointments`

| Column                | Description                        |
| --------------------- | ---------------------------------- |
| `appointment_id`      | Unique appointment ID              |
| `patient_id`          | Patient linked to the appointment  |
| `doctor_id`           | Doctor linked to the appointment   |
| `hospital_id`         | Hospital linked to the appointment |
| `appointment_date`    | Appointment date                   |
| `appointment_time`    | Appointment time                   |
| `visit_reason`        | Reason for the visit               |
| `appointment_status`  | Current appointment status         |
| `check_in_time`       | Patient check-in time              |
| `vital_signs_summary` | Recorded vital signs               |
| `blood_pressure`      | Patient blood pressure             |
| `heart_rate`          | Patient heart rate                 |

## 👨‍⚕️ `stg_doctors`

| Column                   | Description            |
| ------------------------ | ---------------------- |
| `doctor_id`              | Unique doctor ID       |
| `hospital_id`            | Doctor's hospital      |
| `doctor_name`            | Doctor name            |
| `doctor_specialty`       | Medical specialty      |
| `medical_license_number` | Medical license number |
| `npi_number`             | Doctor NPI number      |
| `employment_status`      | Employment status      |

## 🏥 `stg_hospitals`

| Column                     | Description                 |
| -------------------------- | --------------------------- |
| `hospital_id`              | Unique hospital ID          |
| `hospital_name`            | Hospital name               |
| `hospital_location`        | Hospital location           |
| `hospital_type`            | Type of hospital            |
| `total_bed_capacity`       | Total hospital beds         |
| `emergency_room_available` | Emergency room availability |

## 👤 `stg_patients`

| Column                    | Description               |
| ------------------------- | ------------------------- |
| `patient_id`              | Unique patient ID         |
| `patient_name`            | Patient name              |
| `patient_dob`             | Patient date of birth     |
| `patient_gender`          | Patient gender            |
| `patient_address`         | Patient address           |
| `insurance_provider`      | Insurance provider        |
| `insurance_policy_number` | Insurance policy number   |
| `registration_date`       | Patient registration date |

## 💊 `stg_prescriptions`

| Column                  | Description                        |
| ----------------------- | ---------------------------------- |
| `prescription_id`       | Unique prescription ID             |
| `appointment_id`        | Related appointment                |
| `patient_id`            | Related patient                    |
| `doctor_id`             | Doctor who issued the prescription |
| `medication_name`       | Prescribed medication              |
| `dosage_strength`       | Medication dosage                  |
| `frequency`             | How often medication is taken      |
| `refills_allowed`       | Number of allowed refills          |
| `prescription_date`     | Prescription date                  |
| `pharmacy_instructions` | Instructions for the pharmacy      |

## 🧾 `stg_insurance_claims`

| Column                          | Description               |
| ------------------------------- | ------------------------- |
| `insurance_claim_id`            | Unique insurance claim ID |
| `appointment_id`                | Related appointment       |
| `patient_id`                    | Related patient           |
| `claim_submission_date`         | Claim submission date     |
| `icd_10_diagnosis_code`         | Diagnosis code            |
| `cpt_procedure_code`            | Procedure code            |
| `total_billed_amount`           | Total amount billed       |
| `insurance_paid_amount`         | Amount paid by insurance  |
| `patient_responsibility_amount` | Amount paid by patient    |
| `claim_status`                  | Current claim status      |


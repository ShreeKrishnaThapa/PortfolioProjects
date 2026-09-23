{{ config(materialized='view') }}

SELECT
    TRIM(CAST(appointment_id AS STRING)) AS appointment_id,
    TRIM(CAST(patient_id AS STRING)) AS patient_id,
    TRIM(CAST(doctor_id AS STRING)) AS doctor_id,
    TRIM(CAST(hospital_id AS STRING)) AS hospital_id,
    SAFE_CAST(appointment_date AS DATE) AS appointment_date,
    SAFE_CAST(appointment_time AS TIME) AS appointment_time,
    TRIM(visit_reason) AS visit_reason,
    LOWER(TRIM(appointment_status)) AS appointment_status,
    SAFE_CAST(check_in_time AS TIME) AS check_in_time,
    TRIM(vital_signs_summary) AS vital_signs_summary,
    TRIM(blood_pressure) AS blood_pressure,
    SAFE_CAST(heart_rate AS INT64) AS heart_rate
FROM {{ source("raw","appointment") }}
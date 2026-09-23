{{ config(
    materialized='view'
) }}

SELECT
    CAST(Prescription_ID AS STRING) AS prescription_id,
    CAST(Appointment_ID AS STRING) AS appointment_id,
    CAST(Patient_ID AS STRING) AS patient_id,
    CAST(Doctor_ID AS STRING) AS doctor_id,
    TRIM(Medication_Name) AS medication_name,
    TRIM(Dosage_Strength) AS dosage_strength,
    TRIM(Frequency) AS frequency,
    SAFE_CAST(Refills_Allowed AS INT64) AS refills_allowed,
    SAFE_CAST(Prescription_Date AS DATE) AS prescription_date,
    TRIM(Pharmacy_Instructions) AS pharmacy_instructions

FROM {{ source('raw', 'prescriptions') }}
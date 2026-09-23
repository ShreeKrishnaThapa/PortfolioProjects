{{ config(
    materialized='table'
) }}

SELECT
    p.prescription_id,
    p.appointment_id,
    p.patient_id,
    p.doctor_id,
    p.medication_name,
    p.dosage_strength,
    p.frequency,
    p.refills_allowed,
    p.prescription_date,
    p.pharmacy_instructions
FROM {{ ref('stg_prescriptions') }} AS p
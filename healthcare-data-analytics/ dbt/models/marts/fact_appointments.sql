{{ config(
    materialized='table'
) }}

SELECT
    a.appointment_id,
    a.patient_id,
    a.doctor_id,
    a.hospital_id,

    a.appointment_date,
    a.appointment_time,
    a.check_in_time,

    a.visit_reason,
    a.appointment_status,

    a.vital_signs_summary,
    a.blood_pressure,
    a.heart_rate

    
FROM {{ ref('stg_appointments') }} AS a
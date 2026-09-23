{{ config(
    materialized='table'
) }}

SELECT
    doctor_id,
    hospital_id,
    doctor_name,
    doctor_specialty,
    medical_license_number,
    npi_number,
    employment_status

FROM {{ ref('stg_doctors') }}
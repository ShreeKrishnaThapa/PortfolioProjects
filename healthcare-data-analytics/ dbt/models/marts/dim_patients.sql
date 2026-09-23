

{{ config(
    materialized='table'
) }}

SELECT
    patient_id,
    patient_name,
    patient_dob,
    patient_gender,
    patient_address,
    insurance_provider,
    insurance_policy_number,
    registration_date

FROM {{ ref('stg_patients') }}
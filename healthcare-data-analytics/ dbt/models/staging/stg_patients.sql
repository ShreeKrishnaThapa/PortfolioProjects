{{ config(
    materialized='view'
) }}

SELECT
    CAST(Patient_ID AS STRING) AS patient_id,
    TRIM(Patient_Name) AS patient_name,
    SAFE_CAST(Patient_DOB AS DATE) AS patient_dob,
    TRIM(Patient_Gender) AS patient_gender,
    TRIM(Patient_Address) AS patient_address,
    TRIM(Insurance_Provider) AS insurance_provider,
    TRIM(Insurance_Policy_Number) AS insurance_policy_number,
    SAFE_CAST(Registration_Date AS DATE) AS registration_date

FROM {{ source('raw', 'patients') }}
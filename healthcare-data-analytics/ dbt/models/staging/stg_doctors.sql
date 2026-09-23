{{ config(
    materialized='view'
) }}

SELECT
    CAST(Doctor_ID AS STRING) AS doctor_id,
    CAST(Hospital_ID AS STRING) AS hospital_id,
    TRIM(Doctor_Name) AS doctor_name,
    TRIM(Doctor_Specialty) AS doctor_specialty,
    TRIM(Medical_License_Number) AS medical_license_number,
    CAST(NPI_Number AS INT64) AS npi_number,
    TRIM(Employment_Status) AS employment_status

FROM {{ source('raw', 'doctors') }}
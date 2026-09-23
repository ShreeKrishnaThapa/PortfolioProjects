{{ config(
    materialized='view'
) }}

SELECT
    CAST(Insurance_Claim_ID AS STRING) AS insurance_claim_id,
    CAST(Appointment_ID AS STRING) AS appointment_id,
    CAST(Patient_ID AS STRING) AS patient_id,
    SAFE_CAST(Claim_Submission_Date AS DATE) AS claim_submission_date,
    TRIM(ICD_10_Diagnosis_Code) AS icd_10_diagnosis_code,
    TRIM(CPT_Procedure_Code) AS cpt_procedure_code,
    CAST(Total_Billed_Amount AS FLOAT64) AS total_billed_amount,
    CAST(Insurance_Paid_Amount AS FLOAT64) AS insurance_paid_amount,
    CAST(Patient_Responsibility_Amount AS FLOAT64) AS patient_responsibility_amount,
    TRIM(Claim_Status) AS claim_status

FROM {{ source('raw', 'insurance_claims') }}
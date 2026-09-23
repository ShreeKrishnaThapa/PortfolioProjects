{{ config(
    materialized='table'
) }}

SELECT
    c.insurance_claim_id,
    c.appointment_id,
    c.patient_id,

    c.claim_submission_date,

    c.icd_10_diagnosis_code,
    c.cpt_procedure_code,

    c.total_billed_amount,
    c.insurance_paid_amount,
    c.patient_responsibility_amount,

    c.claim_status

FROM {{ ref('stg_insurance_claims') }} AS c
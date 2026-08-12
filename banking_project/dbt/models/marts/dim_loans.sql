{{ config(materialized='table') }}

SELECT
    {{ dbt_utils.generate_surrogate_key(['loan_id']) }} AS loan_key,
    loan_id,
    customer_id,
    branch_id,
    loan_type,
    loan_amount,
    interest_rate,
    term_months,
    start_date,
    status,
    start_year,
    start_month
FROM {{ ref('stg_loans') }}
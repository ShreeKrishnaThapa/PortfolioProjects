{{ config(
    materialized='table',
    schema='analytics'
) }}

SELECT

    loan_type,

    status,

    COUNT(*) AS total_loans,

    SUM(loan_amount) AS loan_amount,

    AVG(interest_rate) AS avg_interest

FROM {{ ref('dim_loans') }}

GROUP BY

    loan_type,
    status
{{ config(
    materialized='table',
    schema='analytics'
) }}
SELECT
    c.customer_id,
    c.name,
    c.city,
    c.state,
    c.annual_category,
    COUNT(DISTINCT l.loan_id) AS total_loans,
    SUM(l.loan_amount) AS total_loan_amount
FROM {{ ref('dim_customers') }} c
LEFT JOIN {{ ref('dim_loans') }} l
    ON c.customer_id = l.customer_id
GROUP BY
    c.customer_id,
    c.name, 
    c.city,
    c.state,
    c.annual_category
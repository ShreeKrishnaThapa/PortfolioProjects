{{ config(materialized='table') }}

SELECT
    {{ dbt_utils.generate_surrogate_key(['lp.payment_id']) }} AS payment_key,
    lp.payment_id,
    lp.payment_date,
    lp.amount_paid,
    lp.principal_component,
    lp.interest_component,
    lp.late_payment_flag,
    lp.payment_year,
    lp.payment_month

FROM {{ ref('stg_loan_payments') }} lp


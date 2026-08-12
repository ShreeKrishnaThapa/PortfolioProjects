{{ config(materialized='table') }}

SELECT
    {{ dbt_utils.generate_surrogate_key(['customer_id']) }} AS customer_key,
    customer_id,
    name,
    gender,
    date_of_birth,
    city,
    state,
    phone,
    email,
    occupation,
    annual_income,
    join_date,
    credit_score,
    age_years,
    joining_year,
    joining_month,
    annual_category
FROM {{ ref('stg_customers') }}
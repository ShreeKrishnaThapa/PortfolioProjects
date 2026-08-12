{{ config(materialized='table') }}

SELECT
    {{ dbt_utils.generate_surrogate_key(['employee_id']) }} AS employee_key,
    employee_id,
    names,
    branch_id,
    role,
    hire_date,
    salary,
    hire_year,
    hire_month
FROM {{ ref('stg_employees') }}
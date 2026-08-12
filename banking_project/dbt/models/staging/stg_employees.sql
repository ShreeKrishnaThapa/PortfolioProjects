with employees as (
    select
    employee_id ,
    trim(name) as names ,
    branch_id ,
    trim(role) as role ,
    safe_cast(hire_date as date) as hire_date ,
    safe_cast(salary as float64) as salary ,
    safe_cast(hire_year as int) as hire_year,
    safe_cast(hire_month as int) as hire_month
    FROM {{ source('banking_raw','employees') }} 
)
select * from employees
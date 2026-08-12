with  customers as (
    select
    customer_id ,
    TRIM(name) as name  ,
    TRIM(gender) as gender ,
    safe_cast(date_of_birth as date) as date_of_birth,
    TRIM(city) as city ,
    TRIM(state) as state ,
    phone ,
    lower(trim(email)) as email ,
    trim(occupation) as occupation ,
    annual_income ,
    safe_cast(join_date as date) as join_date ,
    credit_score ,
    age_years ,
    joining_year ,
    joining_month ,
    trim(annual_category) as annual_category
    FROM {{ source('banking_raw','customers') }} 
)
select * FROM customers
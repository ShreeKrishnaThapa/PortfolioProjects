with loan_payment as (
    select
    payment_id ,
    loan_id ,
    safe_cast(payment_date as date) as payment_date ,
    safe_cast(amount_paid as FLOAT64) as amount_paid , 
    safe_cast(principal_component as float64) as principal_component ,
    safe_cast(interest_component as float64) as interest_component ,
    safe_cast(late_payment_flag as  boolean) as late_payment_flag ,
    safe_cast(payment_year as int) as payment_year ,
    safe_cast(payment_month as int) as payment_month
    FROM {{ source('banking_raw','loan_payments') }} 
)
select * from loan_payment
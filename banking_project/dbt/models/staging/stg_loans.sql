with loan as (
    select
    loan_id,
    customer_id,
    branch_id,
    safe_cast(loan_type as string) as loan_type,
    safe_cast(loan_amount as float64) as loan_amount ,
    safe_cast(interest_rate as float64) as interest_rate ,
    safe_cast(term_months as int ) as term_months ,
    safe_cast(start_date as date) as start_date ,
    safe_cast(status as string) as status,
    safe_cast(start_year as int) as start_year,
    safe_cast(start_month as int) as start_month
    from {{ source('banking_raw','loans') }}
)
select * from loan
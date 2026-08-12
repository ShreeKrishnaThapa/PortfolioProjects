with branches as (
    select
    branch_id ,
    TRIM(branch_name) as branch_names ,
    TRIM(city) as city ,
    trim(state) as states ,
    safe_cast(opened_date as DATE) as opened_date,
    cast(ifsc_code as string) as ifsc_code ,
    cast(months as string) as months ,
    cast(days as int64) as days
    FROM {{ source('banking_raw','branches') }} 
)
select * FROM branches
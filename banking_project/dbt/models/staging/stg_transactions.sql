with money_transaction as (
    select
    transaction_id ,
    account_id ,
    safe_cast(txn_date as date) as txn_date,
    safe_cast(txn_type as string) as txn_type ,
    safe_cast(amount as float64) as amount ,
    safe_cast(channel as string) as channel,
    safe_cast(merchant_category as string) as merchant_category
    from {{ source('banking_raw','transactions') }}
)
select * from money_transaction
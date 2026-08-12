{{ config(materialized='table') }}

SELECT
    {{ dbt_utils.generate_surrogate_key(['t.transaction_id']) }} AS transaction_key,

    t.transaction_id,
    t.txn_date,
    t.txn_type,
    t.amount,
    t.channel,
    t.merchant_category

FROM {{ ref('stg_transactions') }} t

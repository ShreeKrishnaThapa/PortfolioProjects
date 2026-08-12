{{ config(materialized='table') }}
SELECT
    {{ dbt_utils.generate_surrogate_key(['branch_id']) }} AS branch_key,
    branch_id,
    branch_names,
    city,
    states,
    opened_date,
    ifsc_code,
    months,
    days
FROM {{ ref('stg_branches') }}
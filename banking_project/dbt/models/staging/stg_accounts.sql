WITH accounts AS ( 
    SELECT 
        account_id, 
        customer_id, 
        branch_id, 
        LOWER(TRIM(account_type)) AS account_type, 
        CAST(balance AS FLOAT64) AS balance, -- Fixed type here
        SAFE_CAST(open_date AS DATE) AS open_date, 
        LOWER(TRIM(status)) AS status 
    FROM {{ source('banking_raw','accounts') }} 
) 
SELECT * FROM accounts


{{ config(
    materialized='view'
) }}

SELECT
    CAST(Hospital_ID AS STRING) AS hospital_id,
    TRIM(Hospital_Name) AS hospital_name,
    TRIM(Hospital_Location) AS hospital_location,
    TRIM(Hospital_Type) AS hospital_type,
    CAST(Total_Bed_Capacity AS INT64) AS total_bed_capacity,
    TRIM(Emergency_Room_Available) AS emergency_room_available

FROM {{ source('raw', 'hospital') }}
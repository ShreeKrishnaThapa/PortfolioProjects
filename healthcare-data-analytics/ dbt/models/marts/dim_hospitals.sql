{{ config(
    materialized='table'
) }}

SELECT
    hospital_id,
    hospital_name,
    hospital_location,
    hospital_type,
    total_bed_capacity,
    emergency_room_available

FROM {{ ref('stg_hospitals') }}
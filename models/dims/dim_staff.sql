{{ config(materialized='table') }}

select
    staff_id,
    first_name,
    last_name,
    position,
    start_date,
    location,
    string_field_6,
    string_field_7
from {{ ref('seed__staff') }}

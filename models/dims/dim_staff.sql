{{ config(materialized='table') }}

select
    staff_id,
    first_name,
    last_name,
    position,
    start_date,
    location
from {{ ref('seed__staff') }}

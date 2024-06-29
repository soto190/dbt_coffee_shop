{{ config(materialized='table') }}

select 
    transaction_date,
    date_id,
    week_id,
    week_desc,
    month_id,
    month_name,
    quarter_id,
    quarter_name,
    year_id
from {{ ref('seed__dates') }}

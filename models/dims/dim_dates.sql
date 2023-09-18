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
from {{ source('sources_bq__coffe_shop', 'src_bq__dim_dates') }}
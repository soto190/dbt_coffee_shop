{{ config(materialized='table') }}

select 
    sales_outlet_id,
    transaction_date,
    product_id,
    start_of_day,
    quantity_sold,
    waste,
    __waste
from {{ source('sources_bq__coffe_shop', 'src_bq__stg_inventory') }}
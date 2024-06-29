{{ config(materialized='table') }}

select 
    sales_outlet_id,
    transaction_date,
    product_id,
    start_of_day,
    quantity_sold,
    waste,
    pct_waste * 0.01 as pct_waste
from {{ ref('seed__pastry_inventory') }}
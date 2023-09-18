{{ config(materialized='table') }}

select 
    transaction_id,
    transaction_date,
    transaction_time,
    sales_outlet_id,
    staff_id,
    customer_id,
    instore_yn,
    `order` as order_number,
    line_item_id,
    product_id,
    quantity,
    line_item_amount,
    unit_price,
    promo_item_yn
from {{ source('sources_bq__coffe_shop', 'src_bq__stg_transactions_201904') }}
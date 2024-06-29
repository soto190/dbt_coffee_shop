{{ config(materialized='table') }}

select 
    sales_outlet_id,
    sales_outlet_type,
    store_square_feet,
    store_address,
    store_city,
    store_state_province,
    store_telephone,
    store_postal_code,
    store_longitude,
    store_latitude,
    manager,
    neighorhood
from {{ ref('seed__sales_outlet') }}

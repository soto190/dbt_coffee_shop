{{ config(materialized='table') }}

select
    customer_id,
    home_store,
    customer_first_name,
    customer_email,
    customer_since,
    loyalty_card_number,
    birthdate,
    gender,
    birth_year
from {{ ref('seed__customers') }}

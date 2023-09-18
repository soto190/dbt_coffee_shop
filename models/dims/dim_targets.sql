{{ config(materialized='table') }}

/**
    Monthly target for each store.
**/

select
    sales_outlet_id,
    year_month,
    beans_goal,
    beverage_goal,
    food_goal,
    merchandise__goal,
    total_goal
from {{ source('sources_bq__coffe_shop', 'src_bq__dim_targets') }}
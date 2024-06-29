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
    merchandise_goal,
    total_goal
from {{ ref('seed__sales_targets') }}

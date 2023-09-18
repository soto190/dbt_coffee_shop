{{ config(materialized='table') }}

/**
    Classification of generations by year.
**/

select 
    birth_year,
    generation
from {{ source('sources_bq__coffe_shop', 'src_bq__dim_generations') }}
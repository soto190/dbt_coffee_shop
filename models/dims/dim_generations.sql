{{ config(materialized='table') }}

/**
    Classification of generations by year.
**/

select 
    birth_year,
    generation
from {{ ref('seed__generations') }}

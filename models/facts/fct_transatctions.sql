{{ config(materialized='table') }}

with
stg_transactions as (
    select 
        transaction_id,
        transaction_date,
        transaction_time,
        sales_outlet_id,
        staff_id,
        customer_id,
        instore_yn,
        order_number,
        line_item_id,
        product_id,
        quantity,
        line_item_amount,
        unit_price,
        promo_item_yn
    from {{ ref('stg_transactions_201904') }}
),

dim_products as (
    select     
        product_id,
        product_group,
        product_category,
        product_type,
        product,
        product_description,
        unit_of_measure,
        current_wholesale_price,
        current_retail_price,
        tax_exempt_yn,
        promo_yn,
        new_product_yn
    from {{ ref('dim_products') }}
),

dim_customers as (
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
    from {{ ref('dim_customer') }}
),

dim_staff as (
    select
        staff_id,
        first_name,
        last_name,
        position,
        start_date,
        location,
        string_field_6,
        string_field_7
    from  {{ ref('dim_staff') }}
),

dim_stores as (
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
    from {{ ref('dim_sales_outlets') }}
),

add_dimensions_data as (

    select 
        tra.transaction_id,
        tra.transaction_date,
        tra.transaction_time,
        tra.sales_outlet_id,
        tra.staff_id,
        tra.customer_id,
        tra.instore_yn,
        tra.order_number,
        tra.line_item_id,
        tra.product_id,
        tra.quantity,
        tra.line_item_amount,
        tra.unit_price,
        tra.promo_item_yn,

        cus.home_store          as customer_home_store,
        cus.customer_first_name as customer_customer_first_name,
        cus.customer_email      as customer_customer_email,
        cus.customer_since      as customer_customer_since,
        cus.loyalty_card_number as customer_loyalty_card_number,
        cus.birthdate           as customer_birthdate,
        cus.gender              as customer_gender,
        cus.birth_year          as customer_birth_year,

        pro.product_group           as product_group,
        pro.product_category        as product_category,
        pro.product_type            as product_type,
        pro.product                 as product_name,
        pro.product_description     as product_description,
        pro.unit_of_measure         as product_unit_of_measure,
        pro.current_wholesale_price as product_current_wholesale_price,
        pro.current_retail_price    as product_current_retail_price,
        pro.tax_exempt_yn           as product_tax_exempt_yn,
        pro.promo_yn                as product_promo_yn,
        pro.new_product_yn          as product_new_product_yn,

        sta.first_name      as staff_first_name,
        sta.last_name       as staff_last_name,
        sta.position        as staff_position,
        sta.start_date      as staff_start_date,
        sta.location        as staff_location,

        sto.sales_outlet_type       as store_sales_outlet_type,
        sto.store_square_feet       as store_square_feet,
        sto.store_address           as store_address,
        sto.store_city              as store_city,
        sto.store_state_province    as store_state_province,
        sto.store_telephone         as store_telephone,
        sto.store_postal_code       as store_postal_code,
        sto.store_longitude         as store_longitude,
        sto.store_latitude          as store_latitude,
        sto.manager                 as store_manager,
        sto.neighorhood             as store_neighorhood

    from stg_transactions as tra

    left join dim_customers as cus
    on tra.customer_id = cus.customer_id

    left join dim_products as pro
    on tra.product_id = pro.product_id

    left join dim_staff as sta
    on tra.staff_id = sta.staff_id

    left join dim_stores as sto
    on tra.sales_outlet_id = sto.sales_outlet_id
)

select * from add_dimensions_data
-- eof
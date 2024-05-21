WITH dim_customer AS (
  SELECT 
      *
    FROM {{ref("stg_sales_customer")}} as stg_sales_customer
    LEFT JOIN {{ref("stg_sales_store")}} as stg_sales_store
    ON stg_sales_customer.store_key_customer = stg_sales_store.store_key
    LEFT JOIN {{ref("stg_person_person")}} as stg_person_person
    ON stg_person_person.person_key  = stg_sales_customer.person_key
    LEFT JOIN {{ref("dim_sales_territory")}} as dim_sales_territory
    ON dim_sales_territory.territory_key = stg_sales_customer.customer_territory_key
)
  ,dim_customer__rename__cast_type as(
    SELECT
      CAST(customer_key as INTEGER) as customer_key
      ,CAST(title as STRING) as customer_name
      ,CAST(is_reseller as STRING) as is_reseller
      ,CAST(store_key_customer as INTEGER) as reseller_store_key
      ,CAST(store_name as STRING) as reseller_store_name
      ,CAST(territory_key as INTEGER) as customer_territory_key
      ,CAST(territory_name as STRING) as customer_territory_name
      ,CAST(country_region_key as STRING) as customer_country_region_key
      ,CAST(country_region_name as STRING) as customer_country_region_name
      ,CAST(first_name as STRING) as first_name
      ,CAST(middle_name as STRING) as middle_name
      ,CAST(last_name as STRING) as last_name
      FROM dim_customer
  )
  
  SELECT 
    customer_key
    ,customer_name
    ,is_reseller
    ,reseller_store_key
    ,reseller_store_name
    ,customer_territory_key
    ,customer_territory_name
    ,customer_country_region_key
    ,customer_country_region_name
    ,first_name
    ,middle_name
    ,last_name
    FROM dim_customer__rename__cast_type
  
  

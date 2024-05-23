WITH stg_sales_customer AS (
  SELECT
    *,
    CASE
      WHEN StoreID IS NOT NULL THEN 'TRUE'  
      ELSE 'FALSE'  
    END AS is_reseller
  FROM `adventureworks2019.Sales.Customer`
)
,stg_sales_customer__rename__cast_type AS (
  SELECT
    COALESCE(CAST(CustomerID AS INTEGER), 0) as customer_key
    ,CAST(CASE WHEN PersonID = 'NULL' THEN 0 ELSE CAST(PersonID AS INTEGER) END AS INTEGER) AS person_key
    ,COALESCE(SAFE_CAST(StoreID AS INTEGER), 0) AS store_key_customer
    ,COALESCE(CAST(TerritoryID as INTEGER), 0) AS customer_territory_key
    ,COALESCE(is_reseller, 'Undefined') as is_reseller
  FROM stg_sales_customer

)
,stg_sales_customer_add_undefined_record AS (
  SELECT 
    customer_key
    ,person_key
    ,store_key_customer
    ,customer_territory_key
    ,is_reseller
  FROM stg_sales_customer__rename__cast_type

  UNION ALL

  SELECT
    0 as customer_key
    ,0 as person_key
    ,0 as store_key_customer
    ,0 as customer_territory_key
    ,'Undefined' as is_reseller
)

SELECT
  customer_key
  ,person_key
  ,store_key_customer
  ,customer_territory_key
  ,is_reseller
FROM stg_sales_customer_add_undefined_record

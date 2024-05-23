WITH stg_sales_store as (
  SELECT 
  *
FROM  `adventureworks2019.Sales.Store`
)

  ,stg_sales_store__rename as (
  SELECT
    BusinessEntityID as store_key
    ,Name as store_name
    ,SalesPersonID as sales_person_key
  FROM stg_sales_store
  )

  ,stg_sales_store__cast_type as (
  SELECT
    COALESCE(cast(store_key AS integer),0) as store_key
    ,COALESCE(cast(store_name as string),'Undefined') as store_name
    ,COALESCE(cast(sales_person_key as integer),0) as sales_person_key
  FROM stg_sales_store__rename
  )
  ,stg_sales_store__add_undefined_record as (
  SELECT 
    store_key
    ,store_name
    ,sales_person_key
  FROM stg_sales_store__cast_type

  UNION all
  SELECT
    0 as store_key
    ,'Undefined' as store_name
    ,0 as sales_person_key
  )


  
  SELECT
    store_key
    ,store_name
    ,sales_person_key
  FROM stg_sales_store__add_undefined_record

WITH stg_production_product AS (
  SELECT 
    *
  FROM  `adventureworks2019.Production.Product`
)
,stg_production_product__rename__cast_type AS (
  SELECT
    CAST(IFNULL(ProductID, 0) AS INTEGER) AS product_key
    ,CAST(IFNULL(Name, '') AS STRING) AS product_name
    ,CAST(IFNULL(ProductNumber, '') AS STRING) AS product_number
    ,CAST(MakeFlag AS STRING) AS make_flag
    ,CAST(FinishedGoodsFlag AS STRING) AS finished_goods_flag
    ,CAST(CASE WHEN ProductSubcategoryID = 'NULL' THEN 0 ELSE CAST(ProductSubcategoryID AS INTEGER) END AS INTEGER) AS product_subcategory_key_product
    ,CAST(CASE WHEN ProductModelID = 'NULL' THEN 0 ELSE CAST(ProductModelID AS INTEGER) END AS INTEGER) AS product_model_key_product
    ,CAST(SizeUnitMeasureCode AS STRING) AS size_unit_measure_key
    ,CAST(WeightUnitMeasureCode AS STRING) AS weight_unit_measure_key
    ,CAST(IFNULL(Color, '') AS STRING) AS color
    ,CAST(Weight AS STRING) AS weight
    ,CAST(IFNULL(Size, '') AS STRING) AS size
    ,CAST(IFNULL(SafetyStockLevel, 0) AS BIGINT) AS safety_stock_level
    ,CAST(IFNULL(StandardCost, 0.0) AS DECIMAL) AS standard_cost
    ,CAST(IFNULL(ListPrice, 0.0) AS DECIMAL) AS list_price
  FROM stg_production_product
)
  ,stg_production_product_add_undefined_record AS (
  SELECT 
    product_key,
    product_name,
    product_number,
    make_flag,
    finished_goods_flag,
    product_subcategory_key_product,
    product_model_key_product,
    size_unit_measure_key,
    weight_unit_measure_key,
    color,
    weight,
    size,
    safety_stock_level,
    standard_cost,
    list_price
  FROM stg_production_product__rename__cast_type

  UNION ALL

  SELECT
    0 as product_key,
    'Undefined' as product_name,
    '' as product_number,
    'FAIL' as make_flag,
    'FAIL' as finished_goods_flag,
    0 as product_subcategory_key_product,
    0 as product_model_key_product,
    '' as size_unit_measure_key,
    '' as weight_unit_measure_key,
    '' as color,
    '' as weight,
    '' as size,
    0 as safety_stock_level,
    0.0 as standard_cost,
    0.0 as list_price

)


SELECT
  *
FROM stg_production_product_add_undefined_record

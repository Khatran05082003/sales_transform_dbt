WITH stg_production_productmodel AS (
  SELECT 
    *
  FROM  `adventureworks2019.Production.ProductModel`
)
,stg_production_productmodel__rename__cast_type AS (
  SELECT
    CAST(ProductModelID AS INTEGER) AS product_model_key
    ,CAST(Name AS STRING) AS product_model_name
  FROM stg_production_productmodel
)

SELECT
  *
FROM stg_production_productmodel__rename__cast_type

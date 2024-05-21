WITH stg_production_productcategory AS (
  SELECT 
    *
  FROM  `adventureworks2019.Production.ProductCategory`
)
,stg_production_productcategory__rename__cast_type AS (
  SELECT
    CAST(ProductCategoryID AS INTEGER) AS product_category_key
    ,CAST(Name AS STRING) AS product_category_name
  FROM stg_production_productcategory
)

SELECT
  *
FROM stg_production_productcategory__rename__cast_type

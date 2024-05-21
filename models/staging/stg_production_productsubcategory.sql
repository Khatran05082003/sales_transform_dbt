WITH stg_production_productsubcategory AS (
  SELECT 
    *
  FROM  `adventureworks2019.Production.ProductSubcategory`
)
,stg_production_productsubcategory__rename__cast_type AS (
  SELECT
    CAST(ProductSubcategoryID AS INTEGER) AS product_subcategory_key
    ,CAST(ProductCategoryID AS INTEGER) AS product_category_key_productsubcategory
    ,CAST(Name AS STRING) AS product_subcategory_name
  FROM stg_production_productsubcategory
)

SELECT
  *
FROM stg_production_productsubcategory__rename__cast_type

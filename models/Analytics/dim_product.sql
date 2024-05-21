WITH dim_product AS (
  SELECT 
      *
    FROM {{ref("stg_production_product")}} as stg_production_product
    LEFT JOIN {{ref("stg_production_productmodel")}} as stg_production_productmodel
    ON stg_production_product.product_model_key_product = stg_production_productmodel.product_model_key
    LEFT JOIN {{ref("stg_production_productsubcategory")}} as stg_production_productsubcategory
    ON stg_production_product.product_subcategory_key_product = stg_production_productsubcategory.product_subcategory_key
    LEFT JOIN {{ref("stg_production_productcategory")}} as stg_production_productcategory
    ON stg_production_productsubcategory.product_category_key_productsubcategory = stg_production_productcategory.product_category_key
)
  SELECT
    product_key
    ,product_name
    ,product_number
    ,make_flag
    ,finished_goods_flag
    ,product_subcategory_key
    ,product_subcategory_name
    ,product_category_key
    ,product_category_name
    ,product_model_key
    ,product_model_name
    ,size_unit_measure_key
    ,weight_unit_measure_key
    ,color
    ,weight
    ,size
    ,safety_stock_level
    ,standard_cost
    ,list_price
FROM dim_product
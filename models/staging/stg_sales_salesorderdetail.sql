WITH stg_sales_salesorderdetail AS (
  SELECT 
    *
  FROM  `adventureworks2019.Sales.SalesOrderDetail`
)
    ,stg_sales_salesorderdetail__rename__cast_type as(
        SELECT
            CAST(SalesOrderID as INTEGER) as sales_order_key
            ,CAST(ProductID as INTEGER) as product_key_fact
            ,CAST(SalesOrderDetailID as INTEGER) as sales_order_detail_key
            ,CAST(OrderQty as INTEGER) as order_quantity
            ,CAST(UnitPrice as DECIMAL) as unit_price
            ,CAST(UnitPriceDiscount as DECIMAL) as unit_price_discount
        FROM stg_sales_salesorderdetail
    )

    SELECT
        *
    FROM stg_sales_salesorderdetail__rename__cast_type
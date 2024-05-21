WITH fact_sales AS (
  SELECT 
      *
    FROM {{ref("stg_sales_salesorderdetail")}} as stg_sales_salesorderdetail
    LEFT JOIN {{ref("stg_sales_salesorderheader")}} as stg_sales_salesorderheader
    ON stg_sales_salesorderdetail.sales_order_key = stg_sales_salesorderheader.sales_order_key_header
    LEFT JOIN {{ref("dim_product")}} as dim_product
    ON stg_sales_salesorderdetail.product_key_fact = dim_product.product_key
    LEFT JOIN {{ref("dim_sales_territory")}} as dim_sales_territory
    ON dim_sales_territory.territory_key = stg_sales_salesorderheader.territory_key_fact
    LEFT JOIN {{ref("dim_sales_person")}} as dim_sales_person
    ON dim_sales_person.sales_person_key = stg_sales_salesorderheader.sales_person_key_fact
    LEFT JOIN {{ref("dim_customer")}} as dim_customer
    ON dim_customer.customer_key = stg_sales_salesorderheader.customer_key_fact
    LEFT JOIN {{ref("dim_date")}} as dim_date
    ON dim_date.date_key = stg_sales_salesorderheader.order_date_key_fact
)
  SELECT
    ROW_NUMBER() OVER (ORDER BY sales_order_key) AS sales_order_line_key
    ,sales_order_key
    ,product_key
    ,customer_key
    ,territory_key as sales_territory_key
    ,sales_person_key
    ,date_key as order_date_key
    ,sales_order_status
    ,bill_to_address_key
    ,ship_to_address_key
    ,ship_method_key
    ,order_quantity
    ,unit_price
    ,unit_price_discount
    ,tax_amount
    ,sub_total
    ,total_due
  FROM fact_sales
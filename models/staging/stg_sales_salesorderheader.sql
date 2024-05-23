WITH stg_sales_salesorderheader AS (
  SELECT 
    *
  FROM  `adventureworks2019.Sales.SalesOrderHeader`
)
    ,stg_sales_salesorderheader__rename__cast_type as(
        SELECT
          COALESCE(CAST(SalesOrderID AS INTEGER), 0) AS sales_order_key_header
          ,COALESCE(CAST(CustomerID AS INTEGER), 0) AS customer_key_fact
          ,CAST(CASE WHEN SalesPersonID = 'NULL' THEN 0 ELSE CAST(SalesPersonID AS INTEGER) END AS INTEGER) AS sales_person_key_fact
          ,COALESCE(CAST(TerritoryID AS INTEGER), 0) AS territory_key_fact
          ,COALESCE(CAST(OrderDate AS DATE), '1970-01-01') AS order_date_key_fact
          ,COALESCE(CAST(Status AS STRING), 'Undefined') AS sales_order_status
          ,COALESCE(CAST(BillToAddressID AS INTEGER), 0) AS bill_to_address_key
          ,COALESCE(CAST(ShipToAddressID AS INTEGER), 0) AS ship_to_address_key
          ,COALESCE(CAST(ShipMethodID AS INTEGER), 0) AS ship_method_key
          ,COALESCE(CAST(TaxAmt AS DECIMAL), 0) AS tax_amount
          ,COALESCE(CAST(SubTotal AS DECIMAL), 0) AS sub_total
          ,COALESCE(CAST(TotalDue AS BIGINT), 0) AS total_due
        FROM
          stg_sales_salesorderheader

    )
    ,stg_sales_salesorderheader__add_undefined_record as(
      SELECT 
        *
      FROM stg_sales_salesorderheader__rename__cast_type

      UNION ALL

      SELECT
        0 as sales_order_key_header
        ,0 as customer_key_fact
        ,0 as sales_person_key_fact
        ,0 as territory_key_fact
        ,'1970-01-01' as order_date_key_fact
        ,'Undefined' as sales_order_status
        ,0 as bill_to_address_key
        ,0 as ship_to_address_key
        ,0 as ship_method_key
        ,0 as tax_amount
        ,0 as sub_total
        ,0 as total_due
    )

    SELECT
        *
    FROM stg_sales_salesorderheader__add_undefined_record
WITH stg_sales_salesorderheader AS (
  SELECT 
    *
  FROM  `adventureworks2019.Sales.SalesOrderHeader`
)
    ,stg_sales_salesorderheader__rename__cast_type as(
        SELECT
            CAST(SalesOrderID as INTEGER) as sales_order_key_header
            ,CAST(IFNULL(CustomerID, 0) AS INTEGER) AS customer_key_fact
            ,CAST(CASE WHEN SalesPersonID = 'NULL' THEN 0 ELSE CAST(SalesPersonID AS INTEGER) END AS INTEGER) AS sales_person_key_fact
            ,CAST(TerritoryID AS INTEGER) AS territory_key_fact
            ,CAST(OrderDate AS DATE) AS order_date_key_fact
            ,CAST(Status as STRING) as sales_order_status
            ,CAST(BillToAddressID as INTEGER) as bill_to_address_key
            ,CAST(ShipToAddressID as INTEGER) as ship_to_address_key
            ,CAST(ShipMethodID as INTEGER) as ship_method_key
            ,CAST(TaxAmt as DECIMAL) as tax_amount
            ,CAST(SubTotal  as DECIMAL) as sub_total
            ,CAST(TotalDue as BIGINT) as total_due
        FROM stg_sales_salesorderheader
    )

    SELECT
        *
    FROM stg_sales_salesorderheader__rename__cast_type
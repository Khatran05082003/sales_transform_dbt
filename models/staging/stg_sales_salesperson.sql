WITH stg_sales_salesperson AS (
  SELECT 
    *
  FROM  `adventureworks2019.Sales.SalesPerson`
)
    ,stg_sales_salesperson__rename__cast_type as(
        SELECT
            CAST(BusinessEntityID as INTEGER) as store_key_salesperson
            ,CAST(Bonus as DECIMAL) as bonus
            ,CAST(CommissionPct as DECIMAL) as commission
        FROM stg_sales_salesperson
    )

    SELECT
        store_key_salesperson
        ,bonus
        ,commission
    FROM stg_sales_salesperson__rename__cast_type
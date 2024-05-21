WITH dim_date AS (
    SELECT 
        CAST(OrderDate AS DATE) AS date_key,
        CAST(OrderDate AS STRING) AS full_date,
        CASE 
            WHEN EXTRACT(DAYOFWEEK FROM OrderDate) = 1 THEN 'Sunday'
            WHEN EXTRACT(DAYOFWEEK FROM OrderDate) = 2 THEN 'Monday'
            WHEN EXTRACT(DAYOFWEEK FROM OrderDate) = 3 THEN 'Tuesday'
            WHEN EXTRACT(DAYOFWEEK FROM OrderDate) = 4 THEN 'Wednesday'
            WHEN EXTRACT(DAYOFWEEK FROM OrderDate) = 5 THEN 'Thursday'
            WHEN EXTRACT(DAYOFWEEK FROM OrderDate) = 6 THEN 'Friday'
            ELSE 'Saturday'
        END AS day_of_week,
        CASE 
            WHEN EXTRACT(DAYOFWEEK FROM OrderDate) = 1 THEN 'Sun'
            WHEN EXTRACT(DAYOFWEEK FROM OrderDate) = 2 THEN 'Mon'
            WHEN EXTRACT(DAYOFWEEK FROM OrderDate) = 3 THEN 'Tue'
            WHEN EXTRACT(DAYOFWEEK FROM OrderDate) = 4 THEN 'Wed'
            WHEN EXTRACT(DAYOFWEEK FROM OrderDate) = 5 THEN 'Thu'
            WHEN EXTRACT(DAYOFWEEK FROM OrderDate) = 6 THEN 'Fri'
            ELSE 'Sat'
        END AS day_of_week_short,
        CASE 
            WHEN EXTRACT(DAYOFWEEK FROM OrderDate) IN (1, 7) THEN 'Weekend'
            ELSE 'Weekday'
        END AS is_weekday_or_weekend,
        FORMAT_TIMESTAMP('%d', OrderDate) AS day_of_month,
        FORMAT_TIMESTAMP('%Y-%m', OrderDate) AS year_month,
        EXTRACT(MONTH FROM OrderDate) AS month,
        EXTRACT(DAYOFYEAR FROM OrderDate) AS day_of_the_year,
        FORMAT_TIMESTAMP('%W', OrderDate) AS week_of_year,
        EXTRACT(QUARTER FROM OrderDate) AS quarter_number,
        FORMAT_TIMESTAMP('%Y', OrderDate) AS year,
        EXTRACT(YEAR FROM OrderDate) AS year_number
    FROM `adventureworks2019.Sales.SalesOrderHeader`
)

  SELECT
  * 
  FROM dim_date

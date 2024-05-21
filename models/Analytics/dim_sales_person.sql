WITH dim_sales_person AS (
  SELECT 
      *
    FROM {{ref("stg_sales_salesperson")}} as stg_sales_salesperson
    LEFT JOIN {{ref("stg_humanresources_employee")}} as stg_humanresources_employee
    ON stg_sales_salesperson.store_key_salesperson = stg_humanresources_employee.store_key_employee
    LEFT JOIN {{ref("stg_person_person")}} as stg_person_person
    ON stg_humanresources_employee.store_key_employee = stg_person_person.person_key
)
 ,dim_sales_person__rename__cast_type as (
    SELECT
        CAST(store_key_salesperson as INTEGER) as sales_person_key
        ,CAST(title as STRING) as sales_person_title
        ,CAST(first_name as STRING) as first_name
        ,CAST(middle_name as STRING) as middle_name
        ,CAST(last_name as STRING) as last_name
        ,CAST(job_title as STRING) as job_title
        ,CAST(gender as STRING) as gender
        ,CAST(bonus as DECIMAL) as bonus
        ,CAST(commission as DECIMAL) as commission
    FROM dim_sales_person
 )

 SELECT
    sales_person_key
    ,sales_person_title
    ,first_name
    ,middle_name
    ,last_name
    ,job_title
    ,gender
    ,bonus
    ,commission
FROM dim_sales_person__rename__cast_type
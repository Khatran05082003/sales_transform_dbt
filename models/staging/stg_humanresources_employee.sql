WITH stg_humanresources_employee AS (
  SELECT 
    *
  FROM  `adventureworks2019.HumanResources.Employee`
)
    ,stg_humanresources_employee__rename__cast_type as(
        SELECT
            CAST(BusinessEntityID as INTEGER) as store_key_employee
            ,CAST(JobTitle as STRING) as job_title
            ,CAST(Gender as STRING) as gender
        FROM stg_humanresources_employee
    )

    SELECT
        store_key_employee
        ,job_title
        ,gender
    FROM stg_humanresources_employee__rename__cast_type
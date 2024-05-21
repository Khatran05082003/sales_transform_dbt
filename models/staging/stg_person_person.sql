WITH stg_person_person AS (
  SELECT 
    *
  FROM  `adventureworks2019.Person.Person`
)
,stg_person_person__rename__cast_type AS (
  SELECT
    CAST(BusinessEntityID AS INTEGER) AS person_key
    ,CAST(Title AS STRING) AS title
    ,CAST(FirstName AS STRING) AS first_name
    ,CAST(MiddleName AS STRING) AS middle_name
    ,CAST(LastName AS STRING) AS last_name
  FROM stg_person_person
)

SELECT
  person_key
  ,title
  ,first_name
  ,middle_name
  ,last_name
FROM stg_person_person__rename__cast_type

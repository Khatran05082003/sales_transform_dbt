WITH dim_sales_territory as (
  SELECT 
  *
  FROM  `adventureworks2019.Sales.SalesTerritory`
)
  ,dim_sales_territory__rename as (
  SELECT 
    TerritoryID as territory_key
    ,Name as territory_name
    ,CountryRegionCode as country_region_key
    ,CASE 
        WHEN countryregioncode = 'FR' THEN 'France'
        WHEN countryregioncode = 'DE' THEN 'Germany'
        WHEN countryregioncode = 'GB' THEN 'United Kingdom'
        WHEN countryregioncode = 'AU' THEN 'Australia'
        WHEN countryregioncode = 'US' THEN 'United States'
        WHEN countryregioncode = 'CA' THEN 'Canada'
        ELSE 'Unknown'
    END AS country_region_name
    ,dim_sales_territory.Group as group_name
  FROM dim_sales_territory
  )
  ,dim_sales_territory__cast_type as (
  SELECT
    cast(territory_key AS integer) as territory_key
    ,cast(territory_name as string) as territory_name
    ,cast(country_region_key as string) as country_region_key
    ,cast(country_region_name as string) as country_region_name
    ,cast(group_name as string) as group_name
  FROM dim_sales_territory__rename
  )

  SELECT
    territory_key
    ,territory_name
    ,country_region_key
    ,country_region_name
    ,group_name
  FROM dim_sales_territory__rename

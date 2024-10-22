WITH dim_customer AS (
    SELECT DISTINCT
        C_CUSTKEY,
        C_NAME,
        NATION,
        REGION
    FROM stg_sales
)
SELECT * FROM dim_customer
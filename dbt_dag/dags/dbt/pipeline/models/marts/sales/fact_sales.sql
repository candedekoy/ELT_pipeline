
WITH fact_sales AS (
    SELECT
        s.C_CUSTKEY,
        s.O_ORDERDATE,
        SUM(s.TOTAL_SALES) AS TOTAL_SALES
    FROM {{ ref('stg_sales') }} s
    GROUP BY s.C_CUSTKEY, s.O_ORDERDATE
)

SELECT * FROM fact_sales



WITH stg_sales AS (
    SELECT
        c.C_CUSTKEY,
        c.C_NAME,
        o.O_ORDERDATE,
        o.O_ORDERKEY,
        SUM(l.L_QUANTITY * l.L_EXTENDEDPRICE) AS TOTAL_SALES,
        n.N_NAME AS NATION,
        r.R_NAME AS REGION
    FROM {{ source('tpch', 'customer') }} c
    JOIN {{ source('tpch', 'orders') }} o ON c.C_CUSTKEY = o.O_CUSTKEY
    JOIN {{ source('tpch', 'lineitem') }} l ON o.O_ORDERKEY = l.L_ORDERKEY
    JOIN {{ source('tpch', 'nation') }} n ON c.C_NATIONKEY = n.N_NATIONKEY
    JOIN {{ source('tpch', 'region') }} r ON n.N_REGIONKEY = r.R_REGIONKEY
    GROUP BY c.C_CUSTKEY, c.C_NAME, o.O_ORDERDATE, o.O_ORDERKEY, n.N_NAME, r.R_NAME
)

SELECT * FROM stg_sales

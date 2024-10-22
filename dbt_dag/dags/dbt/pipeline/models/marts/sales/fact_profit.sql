
WITH fact_profit AS (
    SELECT
        s.C_CUSTKEY,
        l.L_PARTKEY,
        {{ calculate_profit('s.TOTAL_SALES', 'l.L_QUANTITY', 'ps.PS_SUPPLYCOST') }} AS PROFIT
    FROM {{ ref('stg_sales') }} s
    JOIN {{ source('tpch', 'lineitem') }} l ON s.O_ORDERKEY = l.L_ORDERKEY
    JOIN {{ source('tpch', 'partsupp') }} ps ON l.L_PARTKEY = ps.PS_PARTKEY
)

SELECT * FROM fact_profit

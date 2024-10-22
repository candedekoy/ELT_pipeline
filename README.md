# Customer Sales Analysis and Profitability Reporting

This project builds an end-to-end ELT pipeline using Snowflake, dbt, and Airflow to process sales data from the TPCH_SF1 dataset. The pipeline focuses on transforming raw data into meaningful business analytics in two stages: staging and marts.

- **Staging**: Initial data cleaning and transformation.
- **Marts**: Business-ready metrics like total sales and profit are calculated.

The pipeline is orchestrated with Airflow (using Astro) to automate dbt transformations, with the transformed data being re-uploaded into the Snowflake data warehouse.

## Mart Layer Components:
- **fact_sales**: Tracks total sales per customer and order.
- **fact_profit**: This table calculates profitability by subtracting the supply cost of each product from the total sales for that product and customer.
- **dim_customer**: Stores unique customer information for further analysis.

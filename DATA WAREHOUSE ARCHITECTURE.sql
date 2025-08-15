create warehouse if not exists ecommerce_wh
/*
CREATE WAREHOUSE IF NOT EXISTS ecommerce_wh means:

If a warehouse named ecommerce_wh already exists → do nothing (no error).

If not → create a new warehouse named ecommerce_wh.

A data warehouse, in a general sense, is a centralized repository for integrated data
from one or more disparate sources. 

Currently i was working in snowflakes so,
In Snowflake, a "warehouse" refers specifically to a virtual warehouse, which is a cluster of compute
resources responsible for executing queries and performing DML (Data Manipulation Language) operations. 
Unlike traditional data warehouses where compute and storage are often tightly coupled, Snowflake's architecture separates these two components.
*/
with WAREHOUSE_SIZE =  'small' 
/*
WAREHOUSE_SIZE = 'small' in Snowflake means you are choosing the compute power level for your warehouse.
More size = more parallel processing power = faster queries (and higher cost).
*/
AUTO_SUSPEND = 60     --“If the warehouse is idle (no queries running) for 60 seconds, automatically pause it.”
AUTO_RESUME = TRUE    -- If a query is sent to this warehouse while it’s paused, automatically wake it up and run the query.”
INITIALLY_SUSPENDED = TRUE  --“When this warehouse is first created, keep it paused instead of running.”

CREATE DATABASE IF NOT EXISTS ecommerce_db; -- it is used to create database ecommerce_db is not exists if exists fine.

CREATE  SCHEMA  ecommerce_db.BRONZE; -- creates a schema with name BRONZE which acts as raw_data storage area in our warehouse architecture
CREATE  SCHEMA  ecommerce_db.SILVER;-- creates a schema with name SILVER and this silver schema is used to store the data after neccesary transformations
CREATE  SCHEMA  ecommerce_db.GOLD; --  creates a schema with name GOLD which store the final, analytics-ready tables.


CREATE OR REPLACE TABLE ECOMMERCE_DB.BRONZE.CUSTOMERS_RAW ( 
    customer_id VARCHAR(100) PRIMARY KEY,
    customer_unique_id VARCHAR(100) UNIQUE,
    customer_zip_code_prefix VARCHAR(100),
    customer_city VARCHAR(80),
    customer_state VARCHAR(50)
);
/*
creating the physical table in Snowflake with name  CUSTOMERS_RAW where your raw Kaggle customers data will be stored.
In the Bronze layer:

We create a table structure matching the CSV columns from Kaggle’s customers.csv.
This ensures when we load data, Snowflake knows:
What columns to expect.
What data types to store them as.
What uniqueness and primary key rules to enforce.
It’s basically the container for the raw customers data in our warehouse.

*/

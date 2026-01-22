create database analytics_dw;

create schema silver;
create schema gold;

use silver;

CREATE TABLE silver.transactions_clean (
    txn_id VARCHAR(20),
    txn_date DATE,
    customer_id VARCHAR(20),
    merchant VARCHAR(50),
    amount NUMERIC,
    currency VARCHAR(25),
    city VARCHAR(30),
    device VARCHAR(30),
    high_value_flag INT
);

CREATE TABLE silver.customers_clean (
    customer_id VARCHAR(30),
    name VARCHAR(30),
    age INT,
    annual_income NUMERIC,
    segment VARCHAR(50),
    city VARCHAR(30)
);


CREATE TABLE silver.merchants_clean (
    merchant VARCHAR(30),
    category VARCHAR(30),
    risk_score NUMERIC
);

select * from transactions_clean;

CREATE TABLE gold.dim_customer AS
SELECT DISTINCT
    customer_id,
    name,
    age,
    annual_income,
    segment,
    city
FROM silver.customers_clean;


CREATE TABLE gold.dim_merchant AS
SELECT DISTINCT
    merchant,
    category,
    risk_score
FROM silver.merchants_clean;

CREATE TABLE gold.dim_time AS
SELECT DISTINCT
    txn_date AS date,
    YEAR(txn_date) AS year,
    MONTH(txn_date) AS month,
    DAY(txn_date) AS day,
    dayname(txn_date) AS weekday
FROM silver.transactions_clean;

CREATE TABLE gold.fact_transactions AS
SELECT
    t.txn_id,
    t.customer_id,
    t.merchant,
    t.txn_date AS date,
    t.amount,
    t.high_value_flag,
    m.risk_score AS merchant_risk_score
FROM silver.transactions_clean t
LEFT JOIN silver.merchants_clean m
    ON t.merchant = m.merchant;

use gold;

SELECT COUNT(*) FROM gold.fact_transactions;
SELECT COUNT(*) FROM gold.dim_customer;
SELECT COUNT(*) FROM gold.dim_merchant;


SELECT COUNT(*) FROM gold.fact_transactions WHERE date IS NULL;

#CREATING KPI

create view gold.kpi_spend as 
select sum(amount) as total_spent 
from gold.fact_transactions;


create view gold.kpi_high_risk_pct as 
select round(sum(high_value_flag) / count(*),2) as high_risk_pct
from gold.fact_transactions;
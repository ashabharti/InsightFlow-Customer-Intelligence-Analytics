-- ==========================================================
-- Purpose : Basic SQL queries for business analysis
-- ==========================================================

-- ==========================================================
-- Query 1 : Total Customers
--
-- Purpose:
-- Find the total number of customers.

SELECT COUNT(*) AS total_customers
FROM customers;

-- ==========================================================
-- Query 2 : Total Unique Customers
--
-- Purpose:
-- Count unique customers.

SELECT COUNT(DISTINCT customer_unique_id) AS unique_customers
FROM customers;

-- ==========================================================
-- Query 3 : Customers by State
--
-- Purpose:
-- Count customers in each state.

SELECT
    customer_state,
    COUNT(*) AS total_customers
FROM customers
GROUP BY customer_state
ORDER BY total_customers DESC;

-- ==========================================================
-- Query 4 : Top 10 Customer Cities
--
-- Purpose:
-- Find the cities with the highest number of customers.

SELECT
    customer_city,
    COUNT(*) AS total_customers
FROM customers
GROUP BY customer_city
ORDER BY total_customers DESC
LIMIT 10;

-- ==========================================================
-- Query 5 : Customers by ZIP Code
--
-- Purpose:
-- Count customers in each ZIP code.

SELECT
    customer_zip_code_prefix,
    COUNT(*) AS total_customers
FROM customers
GROUP BY customer_zip_code_prefix
ORDER BY total_customers DESC;

-- ==========================================================
-- Query 6 : Total Orders
--
-- Purpose:
-- Find the total number of orders.

SELECT COUNT(*) AS total_orders
FROM orders;

-- ==========================================================
-- Query 7 : Orders by Status
--
-- Purpose:
-- Count orders by their current status.

SELECT
    order_status,
    COUNT(*) AS total_orders
FROM orders
GROUP BY order_status
ORDER BY total_orders DESC;

-- ==========================================================
-- Query 8 : Order Timeline
--
-- Purpose:
-- Identify the first and most recent order dates.

SELECT
    MIN(order_purchase_timestamp) AS first_order,
    MAX(order_purchase_timestamp) AS latest_order
FROM orders;

-- ==========================================================
-- Query 9 : Orders by Year
--
-- Purpose:
-- Count orders placed each year.

SELECT
    EXTRACT(YEAR FROM order_purchase_timestamp) AS year,
    COUNT(*) AS total_orders
FROM orders
GROUP BY year
ORDER BY year;

-- ==========================================================
-- Query 10 : Orders by Month
--
-- Purpose:
-- Count orders placed each month.

SELECT
    TO_CHAR(order_purchase_timestamp, 'YYYY-MM') AS month,
    COUNT(*) AS total_orders
FROM orders
GROUP BY month
ORDER BY month;
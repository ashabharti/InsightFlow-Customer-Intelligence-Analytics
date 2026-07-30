-- ==========================================================
-- Purpose : Intermediate SQL queries using JOINs, GROUP BY,
--           HAVING, CASE WHEN, and business analysis.
-- ==========================================================

-- ==========================================================
-- Query 1 : Total Orders by Customer
--
-- Purpose:
-- Find how many orders each customer has placed.

SELECT
    c.customer_id,
    c.customer_city,
    c.customer_state,
    COUNT(o.order_id) AS total_orders
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id,
    c.customer_city,
    c.customer_state
ORDER BY total_orders DESC;

-- ==========================================================
-- Query 2 : Top 10 Customers
--
-- Purpose:
-- Identify customers with the highest number of orders.


SELECT
    c.customer_unique_id,
    c.customer_city,
    c.customer_state,
    COUNT(o.order_id) AS total_orders
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY
    c.customer_unique_id,
    c.customer_city,
    c.customer_state
ORDER BY total_orders DESC
LIMIT 10;

-- ==========================================================
-- Query 3 : Customers Without Orders
--
-- Purpose:
-- Find customers who have never placed an order.

SELECT
    c.customer_id,
    c.customer_city,
    c.customer_state
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;


-- ==========================================================
-- Query 4 : Products Sold by Seller
--
-- Purpose:
-- Count how many order items each seller has sold.

SELECT
    s.seller_id,
    s.seller_city,
    s.seller_state,
    COUNT(oi.product_id) AS products_sold
FROM sellers s
INNER JOIN order_items oi
ON s.seller_id = oi.seller_id
GROUP BY
    s.seller_id,
    s.seller_city,
    s.seller_state
ORDER BY products_sold DESC;

-- ==========================================================
-- Query 5 : Top 10 Sellers by Revenue
--
-- Purpose:
-- Find sellers generating the highest revenue.

SELECT
    s.seller_id,
    s.seller_city,
    s.seller_state,
    ROUND(SUM(oi.price),2) AS total_revenue
FROM sellers s
INNER JOIN order_items oi
ON s.seller_id = oi.seller_id
GROUP BY
    s.seller_id,
    s.seller_city,
    s.seller_state
ORDER BY total_revenue DESC
LIMIT 10;

-- ==========================================================
-- Query 6 : Product Category Performance
--
-- Purpose:
-- Count products sold in each category.

SELECT
    p.product_category_name,
    COUNT(oi.product_id) AS total_products_sold
FROM products p
INNER JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY
    p.product_category_name
ORDER BY total_products_sold DESC;

-- ==========================================================
-- Query 7 : Category Revenue
--
-- Purpose:
-- Calculate revenue by product category.

SELECT
    p.product_category_name,
    ROUND(SUM(oi.price),2) AS total_revenue
FROM products p
INNER JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY
    p.product_category_name
ORDER BY total_revenue DESC
LIMIT 10;

-- ==========================================================
-- Query 8 : Sellers with More Than 500 Orders
--
-- Purpose:
-- Find highly active sellers.

SELECT
    seller_id,
    COUNT(*) AS total_orders
FROM order_items
GROUP BY seller_id
HAVING COUNT(*) > 500
ORDER BY total_orders DESC;

-- ==========================================================
-- Query 9 : Order Value Classification
--
-- Purpose:
-- Classify order items into value segments.

SELECT
    order_id,
    price,

    CASE

        WHEN price >= 500 THEN 'High Value'

        WHEN price >= 100 THEN 'Medium Value'

        ELSE 'Low Value'

    END AS order_category

FROM order_items;

-- ==========================================================
-- Query 10 : Payment Method Analysis
--
-- Purpose:
-- Count orders by payment type.

SELECT
    payment_type,
    COUNT(*) AS total_transactions,
    ROUND(SUM(payment_value),2) AS total_payment
FROM payments
GROUP BY payment_type
ORDER BY total_payment DESC;
-- ==========================================================
-- Purpose : Advanced SQL queries using CTEs, Subqueries,
--           Window Functions, and Business Analytics.
-- ==========================================================

-- ==========================================================
-- Query 1 : Top Customers by Revenue
--
-- Purpose:
-- Find customers generating the highest revenue.


WITH customer_revenue AS (
SELECT
    c.customer_unique_id,
    c.customer_city,
    c.customer_state,
     SUM(oi.price) AS total_revenue

FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id

INNER JOIN order_items oi
ON o.order_id = oi.order_id

GROUP BY
    c.customer_unique_id,
    c.customer_city,
    c.customer_state
)

SELECT *
FROM customer_revenue
ORDER BY total_revenue DESC
LIMIT 10;

-- ==========================================================
-- Query 2 : Seller Revenue Ranking
--
-- Purpose:
-- Rank sellers based on total revenue.

SELECT
    seller_id,
    ROUND(SUM(price),2) AS total_revenue,
    RANK() OVER(
        ORDER BY SUM(price) DESC
    ) AS seller_rank
FROM order_items
GROUP BY seller_id;

-- ==========================================================
-- Query 3 : Product Category Ranking

SELECT
    p.product_category_name,
    ROUND(SUM(oi.price),2) AS revenue,
    DENSE_RANK() OVER(
        ORDER BY SUM(oi.price) DESC
    ) AS category_rank

FROM products p
INNER JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.product_category_name;

-- ==========================================================
-- Query 4 : Running Revenue

SELECT
     order_purchase_timestamp::DATE AS order_date,
    SUM(oi.price) AS daily_revenue,
    SUM(SUM(oi.price))
    OVER(
        ORDER BY order_purchase_timestamp::DATE
    ) AS running_revenue
FROM orders o
INNER JOIN order_items oi
ON o.order_id=oi.order_id
GROUP BY order_purchase_timestamp::DATE
ORDER BY order_date;

-- ==========================================================
-- Query 5 : Monthly Revenue

SELECT
    TO_CHAR(order_purchase_timestamp,'YYYY-MM') AS month,
    ROUND(SUM(price),2) AS revenue
FROM orders o
INNER JOIN order_items oi
ON o.order_id=oi.order_id
GROUP BY month
ORDER BY month;

-- ==========================================================
-- Query 6 : Average Order Value

SELECT
    ROUND(AVG(order_total),2) AS average_order_value
FROM(
    SELECT
    order_id,
    SUM(price) AS order_total
    FROM order_items
    GROUP BY order_id
)t;

-- ==========================================================
-- Query 7 : Top Product in Each Category

WITH product_sales AS(
SELECT
    p.product_category_name,
    oi.product_id,
SUM(price) AS revenue
FROM products p
INNER JOIN order_items oi
ON p.product_id=oi.product_id
GROUP BY p.product_category_name, oi.product_id
)

SELECT *
FROM(
    SELECT *,
    ROW_NUMBER()
    OVER(
    PARTITION BY product_category_name
    ORDER BY revenue DESC
)
AS row_num
FROM product_sales
)t
WHERE row_num=1;

-- ==========================================================
-- Query 8 : Sellers Above Average Revenue

SELECT
    seller_id,
    SUM(price) AS revenue
FROM order_items
GROUP BY seller_id
HAVING SUM(price)>
(
    SELECT
    AVG(total_revenue)
    FROM(
    SELECT
    SUM(price)
    AS total_revenue
    FROM order_items
    GROUP BY seller_id
)t
);

-- ==========================================================
-- Query 9 : Average Delivery Time

SELECT
    ROUND(AVG(order_delivered_customer_date - order_purchase_timestamp),2) AS average_delivery_days
FROM orders
WHERE order_delivered_customer_date IS NOT NULL;

-- ==========================================================
-- Query 10 : Customer Lifetime Value

SELECT
    c.customer_unique_id,
    ROUND(SUM(oi.price),2) AS customer_lifetime_value
FROM customers c
INNER JOIN orders o
ON c.customer_id=o.customer_id
INNER JOIN order_items oi
ON o.order_id=oi.order_id
GROUP BY c.customer_unique_id
ORDER BY customer_lifetime_value DESC;
-- ==========================================================
-- Purpose : Validate imported data before SQL Analytics
-- ==========================================================

-- ==========================================================
-- Validation 1 : Check row count of every table
-- ==========================================================

SELECT 'customers' AS table_name, COUNT(*) AS total_rows FROM customers
UNION ALL
SELECT 'orders', COUNT(*) FROM orders
UNION ALL
SELECT 'order_items', COUNT(*) FROM order_items
UNION ALL
SELECT 'products', COUNT(*) FROM products
UNION ALL
SELECT 'sellers', COUNT(*) FROM sellers
UNION ALL
SELECT 'payments', COUNT(*) FROM payments
UNION ALL
SELECT 'reviews', COUNT(*) FROM reviews
UNION ALL
SELECT 'geolocation', COUNT(*) FROM geolocation
UNION ALL
SELECT 'category_translation', COUNT(*) FROM category_translation;

-- ==========================================================
-- Validation 2 : Check NULL values in Primary Keys
-- ==========================================================
-- ==========================================================
-- Validation 2 : Check NULL values in Primary Keys
-- ==========================================================

SELECT 'customers' AS table_name,
COUNT(*) AS null_primary_key
FROM customers
WHERE customer_id IS NULL

UNION ALL

SELECT 'orders',
COUNT(*)
FROM orders
WHERE order_id IS NULL

UNION ALL

SELECT 'order_items',
COUNT(*)
FROM order_items
WHERE order_id IS NULL
   OR order_item_id IS NULL

UNION ALL

SELECT 'products',
COUNT(*)
FROM products
WHERE product_id IS NULL

UNION ALL

SELECT 'sellers',
COUNT(*)
FROM sellers
WHERE seller_id IS NULL

UNION ALL

SELECT 'payments',
COUNT(*)
FROM payments
WHERE order_id IS NULL
   OR payment_sequential IS NULL

UNION ALL

SELECT 'reviews',
COUNT(*)
FROM reviews
WHERE order_id IS NULL
   OR review_id IS NULL

UNION ALL

SELECT 'category_translation',
COUNT(*)
FROM category_translation
WHERE product_category_name IS NULL;

-- ==========================================================
-- Validation 3 : Check Duplicate Primary Keys
-- ==========================================================

SELECT 'customers' AS table_name,
COUNT(*) AS duplicate_primary_keys
FROM (
    SELECT customer_id
    FROM customers
    GROUP BY customer_id
    HAVING COUNT(*) > 1
) t

UNION ALL

SELECT 'orders',
COUNT(*)
FROM (
    SELECT order_id
    FROM orders
    GROUP BY order_id
    HAVING COUNT(*) > 1
) t

UNION ALL

SELECT 'order_items',
COUNT(*)
FROM (
    SELECT order_id, order_item_id
    FROM order_items
    GROUP BY order_id, order_item_id
    HAVING COUNT(*) > 1
) t

UNION ALL

SELECT 'products',
COUNT(*)
FROM (
    SELECT product_id
    FROM products
    GROUP BY product_id
    HAVING COUNT(*) > 1
) t

UNION ALL

SELECT 'sellers',
COUNT(*)
FROM (
    SELECT seller_id
    FROM sellers
    GROUP BY seller_id
    HAVING COUNT(*) > 1
) t

UNION ALL

SELECT 'payments',
COUNT(*)
FROM (
    SELECT order_id, payment_sequential
    FROM payments
    GROUP BY order_id, payment_sequential
    HAVING COUNT(*) > 1
) t

UNION ALL

SELECT 'reviews',
COUNT(*)
FROM (
    SELECT order_id, review_id
    FROM reviews
    GROUP BY order_id, review_id
    HAVING COUNT(*) > 1
) t

UNION ALL

SELECT 'category_translation',
COUNT(*)
FROM (
    SELECT product_category_name
    FROM category_translation
    GROUP BY product_category_name
    HAVING COUNT(*) > 1
) t;

-- ==========================================================
-- Validation 4 : Review ID Analysis
-- Number of duplicated review IDs
-- ==========================================================

SELECT
    COUNT(*) AS duplicate_review_ids
FROM (
    SELECT review_id
    FROM reviews
    GROUP BY review_id
    HAVING COUNT(*) > 1
) t;

-- ==========================================================
-- Validation 5 : Foreign Key Integrity
-- ==========================================================

SELECT 'Orders without Customers' AS validation,
COUNT(*) AS invalid_records
FROM orders o
LEFT JOIN customers c
ON o.customer_id = c.customer_id
WHERE c.customer_id IS NULL

UNION ALL

SELECT 'Order Items without Orders',
COUNT(*)
FROM order_items oi
LEFT JOIN orders o
ON oi.order_id = o.order_id
WHERE o.order_id IS NULL

UNION ALL

SELECT 'Payments without Orders',
COUNT(*)
FROM payments p
LEFT JOIN orders o
ON p.order_id = o.order_id
WHERE o.order_id IS NULL

UNION ALL

SELECT 'Reviews without Orders',
COUNT(*)
FROM reviews r
LEFT JOIN orders o
ON r.order_id = o.order_id
WHERE o.order_id IS NULL;

-- ==========================================================
-- Validation 6 : Invalid Date Records
-- ==========================================================

SELECT
COUNT(*) AS invalid_delivery_dates
FROM orders
WHERE order_delivered_customer_date IS NOT NULL
AND order_delivered_customer_date < order_purchase_timestamp;

-- ==========================================================
-- Validation 7 : Negative Values
-- ==========================================================

SELECT 'Negative Product Price' AS validation,
COUNT(*) AS invalid_records
FROM order_items
WHERE price < 0

UNION ALL

SELECT 'Negative Freight Value',
COUNT(*)
FROM order_items
WHERE freight_value < 0

UNION ALL

SELECT 'Negative Payment Value',
COUNT(*)
FROM payments
WHERE payment_value < 0;

-- ==========================================================
-- Validation 8 : Review Score Validation
-- ==========================================================

SELECT
DISTINCT review_score
FROM reviews
ORDER BY review_score;

-- ==========================================================
-- Validation 9 : Payment Type Validation
-- ==========================================================

SELECT
DISTINCT payment_type
FROM payments
ORDER BY payment_type;

-- ==========================================================
-- Validation 10 : Database Summary
-- ==========================================================

SELECT
    (SELECT COUNT(*) FROM customers) AS customers,
    (SELECT COUNT(*) FROM orders) AS orders,
    (SELECT COUNT(*) FROM order_items) AS order_items,
    (SELECT COUNT(*) FROM products) AS products,
    (SELECT COUNT(*) FROM sellers) AS sellers,
    (SELECT COUNT(*) FROM payments) AS payments,
    (SELECT COUNT(*) FROM reviews) AS reviews,
    (SELECT COUNT(*) FROM geolocation) AS geolocation,
    (SELECT COUNT(*) FROM category_translation) AS category_translation;


    -- ==========================================================
-- Validation Summary
-- ==========================================================
-- ✓ All tables successfully imported.
-- ✓ Primary Key validation completed.
-- ✓ Foreign Key integrity verified.
-- ✓ No negative financial values found.
-- ✓ Review scores are valid.
-- ✓ Database is ready for SQL Analytics.
-- ==========================================================
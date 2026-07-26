 -- ==========================================================
-- Project : InsightFlow Customer Intelligence Analytics
-- File    : 04_import_data.sql
-- Purpose : Import CSV files into PostgreSQL tables
-- Author  : Asha Bharti
-- ==========================================================

-- ==========================================================
-- IMPORTANT NOTES
-- ==========================================================
-- Import order is important because of foreign keys.
-- ==========================================================


-- ==========================================================
-- 1. Customers
-- ==========================================================

\copy customers FROM 'C:/Users/bhart/InsightFlow-Customer-Intelligence-Analytics/data/raw/olist_customers_dataset.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',');


-- ==========================================================
-- 2. Products
-- ==========================================================

\copy products FROM 'C:/Users/bhart/InsightFlow-Customer-Intelligence-Analytics/data/raw/olist_products_dataset.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',');


-- ==========================================================
-- 3. Sellers
-- ==========================================================

\copy sellers FROM 'C:/Users/bhart/InsightFlow-Customer-Intelligence-Analytics/data/raw/olist_sellers_dataset.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',');


-- ==========================================================
-- 4. Category Translation
-- ==========================================================

\copy category_translation FROM 'C:/Users/bhart/InsightFlow-Customer-Intelligence-Analytics/data/raw/product_category_name_translation.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',');


-- ==========================================================
-- 5. Geolocation
-- ==========================================================

\copy geolocation FROM 'C:/Users/bhart/InsightFlow-Customer-Intelligence-Analytics/data/raw/olist_geolocation_dataset.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',');


-- ==========================================================
-- 6. Orders
-- ==========================================================

\copy orders FROM 'C:/Users/bhart/InsightFlow-Customer-Intelligence-Analytics/data/raw/olist_orders_dataset.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',');

-- ==========================================================
-- 7. Order Items
-- ==========================================================

\copy order_items FROM 'C:/Users/bhart/InsightFlow-Customer-Intelligence-Analytics/data/raw/olist_order_items_dataset.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',');


-- ==========================================================
-- 8. Payments
-- ==========================================================

\copy reviews FROM 'C:/Users/bhart/InsightFlow-Customer-Intelligence-Analytics/data/raw/olist_order_reviews_dataset.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'LATIN1');

-- ==========================================================
-- 9. Reviews
-- ==========================================================

\copy reviews 
FROM 'C:/Users/bhart/InsightFlow-Customer-Intelligence-Analytics/data/raw/olist_order_reviews_dataset.csv' WITH 
(FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'LATIN1');
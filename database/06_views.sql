-- ==========================================================
-- Purpose : Create reusable business views
-- ==========================================================



-- ==========================================================
-- View 1 : Customer Orders
-- Purpose : Combines customer and order information.
--
-- Tables Used:
--   1. customers
--   2. orders

-- Join:
--   customers.customer_id = orders.customer_id
--
-- Business Use:
--   - Customer order history
--   - Orders by city/state
--   - Customer activity analysis
--   - Delivery tracking


CREATE OR REPLACE VIEW vw_customer_orders AS

SELECT
    c.customer_id,
    c.customer_unique_id,
    c.customer_city,
    c.customer_state,

    o.order_id,
    o.order_status,
    o.order_purchase_timestamp,
    o.order_delivered_customer_date

FROM customers c

INNER JOIN orders o
ON c.customer_id = o.customer_id;

-- ==========================================================

-- ==========================================================
-- View 2 : Order Details
-- Purpose : Combines order items with product and seller details.
--
-- Tables Used:
--   1. order_items
--   2. products
--   3. sellers
--
-- Join:
--   order_items.product_id = products.product_id
--   order_items.seller_id = sellers.seller_id
--
-- Business Use:
--   - Product sales analysis
--   - Seller performance
--   - Revenue analysis
--   - Freight cost analysis


CREATE OR REPLACE VIEW vw_order_details AS

SELECT

    oi.order_id,
    oi.order_item_id,

    oi.product_id,
    p.product_category_name,

    oi.seller_id,
    s.seller_city,
    s.seller_state,

    oi.price,
    oi.freight_value

FROM order_items oi

INNER JOIN products p
ON oi.product_id = p.product_id

INNER JOIN sellers s
ON oi.seller_id = s.seller_id;

-- ==========================================================

-- ==========================================================
-- View 3 : Payment Summary
-- Purpose : Combines order and payment information.
--
-- Tables Used:
--   1. orders
--   2. payments
--
-- Join:
--   orders.order_id = payments.order_id
--
-- Business Use:
--   - Payment analysis
--   - Installment analysis
--   - Revenue tracking

CREATE OR REPLACE VIEW vw_payment_summary AS

SELECT

    o.order_id,

    o.order_status,

    p.payment_type,
    p.payment_installments,
    p.payment_value

FROM orders o

INNER JOIN payments p
ON o.order_id = p.order_id;

-- ==========================================================

-- ==========================================================
-- View 4 : Review Summary
-- Purpose : Combines order and customer review information.
--
-- Tables Used:
--   1. orders
--   2. reviews
--
-- Join:
--   orders.order_id = reviews.order_id
--
-- Business Use:
--   - Customer satisfaction analysis
--   - Review score analysis
--   - Order quality monitoring

CREATE OR REPLACE VIEW vw_review_summary AS

SELECT

    o.order_id,

    o.order_status,

    r.review_score,
    r.review_comment_title,
    r.review_comment_message

FROM orders o

INNER JOIN reviews r
ON o.order_id = r.order_id;


-- ==========================================================

-- ==========================================================
-- View 5 : Product Sales
-- Purpose : Combines product and order item information.
--
-- Tables Used:
--   1. products
--   2. order_items
--
-- Join:
--   products.product_id = order_items.product_id
--
-- Business Use:
--   - Product sales analysis
--   - Category performance
--   - Revenue by product

CREATE OR REPLACE VIEW vw_product_sales AS

SELECT

    p.product_id,

    p.product_category_name,

    oi.order_id,

    oi.price,
    oi.freight_value

FROM products p

INNER JOIN order_items oi
ON p.product_id = oi.product_id;


-- ==========================================================

-- ==========================================================
-- View 6 : Customer Location
-- Purpose : Provides customer location information.
--
-- Tables Used:
--   1. customers
--
-- Join:
--   No joins used.
--
-- Business Use:
--   - Customer distribution
--   - State-wise analysis
--   - City-wise analysis

CREATE OR REPLACE VIEW vw_customer_location AS

SELECT

    customer_id,

    customer_city,

    customer_state,

    customer_zip_code_prefix

FROM customers;


-- ==========================================================

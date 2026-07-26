-- ==========================================
-- Project : InsightFlow Customer Intelligence Analytics
-- File    : 03_constraints.sql
-- Purpose : Add Foreign Key Constraints
-- ==========================================

-- Orders -> Customers
ALTER TABLE orders
ADD CONSTRAINT fk_orders_customer
FOREIGN KEY (customer_id)
REFERENCES customers(customer_id);

-- Order Items -> Orders
ALTER TABLE order_items
ADD CONSTRAINT fk_order_items_order
FOREIGN KEY (order_id)
REFERENCES orders(order_id);

-- Order Items -> Products
ALTER TABLE order_items
ADD CONSTRAINT fk_order_items_product
FOREIGN KEY (product_id)
REFERENCES products(product_id);

-- Order Items -> Sellers
ALTER TABLE order_items
ADD CONSTRAINT fk_order_items_seller
FOREIGN KEY (seller_id)
REFERENCES sellers(seller_id);

-- Payments -> Orders
ALTER TABLE payments
ADD CONSTRAINT fk_payments_order
FOREIGN KEY (order_id)
REFERENCES orders(order_id);

-- Reviews -> Orders
ALTER TABLE reviews
ADD CONSTRAINT fk_reviews_order
FOREIGN KEY (order_id)
REFERENCES orders(order_id);


-- ==========================================================
-- Constraint Summary
-- ==========================================================
-- Total Tables           : 9
-- Foreign Keys Created   : 6
--
-- Relationships:
--
-- Customers  ----< Orders
-- Orders     ----< Order Items
-- Products   ----< Order Items
-- Sellers    ----< Order Items
-- Orders     ----< Payments
-- Orders     ----< Reviews
--
-- Geolocation is excluded because the ZIP code prefix is
-- non-unique and therefore cannot be referenced by a
-- FOREIGN KEY constraint.
-- ==========================================================
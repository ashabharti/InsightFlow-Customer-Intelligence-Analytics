# Order Items Table Analysis

## 1. Table Name

**olist_order_items_dataset**

---

## 2. Business Process

This table represents the **Order Fulfillment Process**. It records every individual product included in an order, along with its seller, price, shipping information, and freight cost.

---

## 3. Business Purpose

The Order Items table stores details of every product purchased in an order. It helps the business understand which products are sold, which sellers fulfilled the orders, how much revenue each product generated, and how much shipping cost was incurred. This table is essential for product, seller, and revenue analysis.

---

## 4. Grain

**One row represents one product (order item) within a customer order.**

Example:

If one order contains three products, this table will have three rows for that order.

---

## 5. Primary Key

There is **no single unique column** in this table.

The combination of the following columns uniquely identifies each record:

- **order_id**
- **order_item_id**

This combination acts as a **Composite Primary Key**.

---

## 6. Foreign Keys

| Column | References |
|---------|------------|
| order_id | olist_orders_dataset |
| product_id | olist_products_dataset |
| seller_id | olist_sellers_dataset |

---

## 7. Column Details

| Column | Description | Business Importance |
|---------|-------------|--------------------|
| order_id | Unique identifier of an order | Links products to customer orders. |
| order_item_id | Sequence number of a product within an order | Distinguishes multiple products belonging to the same order. |
| product_id | Unique identifier of the purchased product | Used for product sales and category analysis. |
| seller_id | Unique identifier of the seller | Used to evaluate seller performance and revenue. |
| shipping_limit_date | Last date by which the seller should ship the product | Measures shipping efficiency and operational performance. |
| price | Selling price of the product | Used to calculate product revenue and sales. |
| freight_value | Shipping cost for the product | Used to analyze logistics costs and delivery expenses. |

---

## 8. Possible Business Questions

1. Which products generate the highest revenue?
2. Which sellers sell the most products?
3. What is the average freight cost per product?
4. Which orders contain multiple products?
5. Which sellers generate the highest sales revenue?
6. Which products have the highest shipping costs?
7. What is the average selling price of products?
8. Which products contribute the most to total revenue?

---

## 9. Possible Joins

| Table | Join Column | Purpose |
|---------|-------------|---------|
| olist_orders_dataset | order_id | Connect order information with products. |
| olist_products_dataset | product_id | Analyze product details and categories. |
| olist_sellers_dataset | seller_id | Evaluate seller performance. |

---

## 10. Data Quality Checks

- Check for duplicate combinations of **(order_id, order_item_id)**.
- Verify that all **product_id** values exist in the Products table.
- Verify that all **seller_id** values exist in the Sellers table.
- Check for missing prices or freight values.
- Ensure that **price** and **freight_value** are greater than zero.
- Verify that **shipping_limit_date** is not missing.

---

## 11. Assumptions

- Each row represents one product within an order.
- One order may contain multiple products.
- A product is supplied by one seller in a particular order.
- Product price and freight value are stored separately to support revenue and logistics analysis.

---

## 12. Key Insights

- This table acts as the bridge between Orders, Products, and Sellers.
- It enables detailed product-level sales analysis.
- Revenue is calculated using the **price** column.
- Logistics cost is analyzed using the **freight_value** column.
- The combination of **order_id** and **order_item_id** uniquely identifies each order item.
- This table is essential for building product, seller, and profitability dashboards.
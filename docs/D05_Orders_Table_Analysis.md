# Orders Table Analysis

## 1. Table Name

olist_orders_dataset

---


## 2. Business Process

This table represents the complete order lifecycle, starting from when a customer places an order until the product is delivered. It records every major stage of the order fulfillment process.

---


## 3. Business Purpose

The Orders table stores information about every order placed by customers. It helps the business monitor order status, delivery performance, customer purchases, and operational efficiency. This table serves as the central table for analyzing sales, customer behavior, and order fulfillment.

---


## 4. Grain

One row represents one customer order.

---

## 5. Primary Key

order_id
---

## 6. Foreign Keys

customer_id

---

## 7. Column Details

| Column | Description | Business Importance |

| Column                        | Description                                   | Business Importance                                                   |
| ----------------------------- | --------------------------------------------- | --------------------------------------------------------------------- |
| order_id                      | Unique identifier of an order                 | Used to uniquely identify each order and join with other tables.      |
| customer_id                   | Customer who placed the order                 | Links orders with customer information.                               |
| order_status                  | Current order status                          | Helps analyze cancellations, deliveries, and operational performance. |
| order_purchase_timestamp      | Date and time when the order was placed       | Used for sales trend analysis and forecasting.                        |
| order_approved_at             | Payment approval time                         | Measures payment processing efficiency.                               |
| order_delivered_carrier_date  | Date when the order was handed to the carrier | Measures shipping performance.                                        |
| order_delivered_customer_date | Actual delivery date                          | Used to calculate delivery time and customer satisfaction.            |
| order_estimated_delivery_date | Promised delivery date                        | Used to evaluate on-time delivery performance.                        |


---


## 8. Possible Business Questions

1. How many orders are delivered successfully?
2. What percentage of orders are cancelled?
3. What is the average delivery time?
4. How many orders are delayed?
5. Which months have the highest number of orders?
6. Which days receive the most orders?
7. How many pending orders are there?
8. How often are orders delivered before the estimated date?

---

## 9. Possible Joins


| Table | Join Column | Purpose |
|---------|-------------|---------|
| Customers | customer_id | Customer analysis |
| Order Items | order_id | Product analysis |
| Payments | order_id | Revenue analysis |
| Reviews | order_id | Customer satisfaction analysis |

---

## 10. Data Quality Checks


- Check for duplicate order_id values.
- Check for missing customer_id values.
- Verify order status values are valid.
- Check for missing timestamps.
- Ensure delivery date is after purchase date.
- Ensure estimated delivery date is not before purchase date.

---


## 11. Assumptions

- Each order_id represents one order.
- Every order belongs to one customer.
- Timestamps follow the correct chronological order.

---


## 12. Key Insights

The Orders table is the central fact table of the Olist database. It connects customers with payments, products, reviews, and sellers. Most business analyses begin with this table because it captures the complete order lifecycle.
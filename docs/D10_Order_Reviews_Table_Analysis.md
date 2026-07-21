
# Order Reviews Table Analysis

## 1. Table Name

**olist_order_reviews_dataset**

---

## 2. Business Process

This table represents the **Customer Feedback Process**. It stores customer ratings and review comments after an order has been delivered, helping the business measure customer satisfaction and service quality.

---

## 3. Business Purpose

The Reviews table stores customer feedback for completed orders. It helps the company evaluate customer satisfaction, monitor seller performance, identify service issues, and improve the overall shopping experience.

---

## 4. Grain

**One row represents one customer review for one order.**

---

## 5. Primary Key

**review_id**

- Uniquely identifies each customer review.

---

## 6. Foreign Keys

| Column | References |
|---------|------------|
| order_id | olist_orders_dataset |

---

## 7. Column Details

| Column | Description | Business Importance |
|---------|-------------|--------------------|
| review_id | Unique identifier of a review | Used to uniquely identify customer reviews. |
| order_id | Order associated with the review | Links customer feedback with the order. |
| review_score | Customer rating (1–5) | Measures customer satisfaction and service quality. |
| review_comment_title | Short title of the review | Provides a quick summary of customer feedback. |
| review_comment_message | Detailed review message | Helps identify customer complaints and improvement areas. |
| review_creation_date | Date the review was created | Used to analyze review trends over time. |
| review_answer_timestamp | Date and time the review was submitted | Measures when customers provide feedback after their purchase. |

---

## 8. Possible Business Questions

1. What is the average customer review score?
2. How many 5-star reviews are received?
3. Which review score is most common?
4. Which orders received poor ratings?
5. Do delayed deliveries receive lower review scores? *(Requires Orders table)*
6. Which sellers receive the highest customer ratings? *(Requires Sellers and Order Items tables)*
7. Which product categories receive the best reviews? *(Requires Products and Order Items tables)*
8. How do customer ratings change over time?

---

## 9. Possible Joins

| Table | Join Column | Purpose |
|---------|-------------|---------|
| olist_orders_dataset | order_id | Analyze reviews with order details. |
| olist_order_items_dataset | order_id | Connect reviews to products and sellers. |
| olist_products_dataset | product_id (through Order Items) | Product satisfaction analysis. |
| olist_sellers_dataset | seller_id (through Order Items) | Seller performance analysis. |

---

## 10. Data Quality Checks

- Check for duplicate review_id values.
- Verify review scores are between 1 and 5.
- Check for missing order_id values.
- Check for missing review creation dates.
- Verify review timestamps are valid.
- Identify reviews without comments.

---

## 11. Assumptions

- One review belongs to one order.
- Review scores range from 1 (lowest) to 5 (highest).
- Review comments are optional.
- Every review is associated with a completed customer order.

---

## 12. Key Insights

- The Reviews table measures customer satisfaction.
- Review scores help evaluate service quality.
- Customer comments provide qualitative feedback.
- This table is valuable for sentiment analysis and service improvement.
- When combined with Orders, Products, and Sellers, it helps identify factors affecting customer satisfaction.

# Sellers Table Analysis

## 1. Table Name

**olist_sellers_dataset**

---

## 2. Business Process

This table represents the **Seller Management Process**. It stores information about every seller registered on the Olist marketplace, including their location. It enables the company to manage sellers and evaluate their business performance.

---

## 3. Business Purpose

The Sellers table stores information about all registered sellers on the platform. It helps the company analyze seller performance, identify top-performing regions, optimize logistics, and support marketplace operations. When combined with sales data, it provides insights into seller revenue and operational efficiency.

---

## 4. Grain

**One row represents one registered seller.**

---

## 5. Primary Key

**seller_id**

- Uniquely identifies each seller.
- Used to connect sellers with products sold in customer orders.

---

## 6. Foreign Keys

**None**

However, **seller_id** acts as a foreign key in the **olist_order_items_dataset** table.

---

## 7. Column Details

| Column | Description | Business Importance |
|---------|-------------|--------------------|
| seller_id | Unique identifier of a seller | Used to uniquely identify each seller and analyze their performance. |
| seller_zip_code_prefix | ZIP code prefix of the seller | Used for logistics planning and regional analysis. |
| seller_city | City where the seller is located | Helps analyze seller distribution across cities. |
| seller_state | State where the seller operates | Used for regional performance analysis and business expansion decisions. |

---

## 8. Possible Business Questions

1. How many sellers are registered on the platform?
2. Which state has the highest number of sellers?
3. Which city has the highest concentration of sellers?
4. Which sellers generate the highest revenue? *(Requires Order Items table)*
5. Which sellers receive the most customer orders? *(Requires Orders and Order Items tables)*
6. Which states contribute the highest seller revenue?
7. Which regions have the fewest sellers?
8. How are sellers distributed across Brazil?

---

## 9. Possible Joins

| Table | Join Column | Purpose |
|---------|-------------|---------|
| olist_order_items_dataset | seller_id | Analyze seller revenue, product sales, and order performance. |

---

## 10. Data Quality Checks

- Check for duplicate seller_id values.
- Check for missing seller city or state.
- Verify ZIP code prefixes are valid.
- Check for inconsistent city or state names.
- Verify that every seller_id is unique.

---

## 11. Assumptions

- Each seller_id represents one unique seller.
- Each seller belongs to one city and one state.
- Seller location information is accurate.
- One seller can sell multiple products.

---

## 12. Key Insights

- The Sellers table is a **Dimension Table**.
- It contains descriptive information about marketplace sellers.
- Revenue cannot be calculated using this table alone.
- Seller performance analysis requires joining with the **Order Items** table.
- Seller location helps optimize logistics and regional business strategies.
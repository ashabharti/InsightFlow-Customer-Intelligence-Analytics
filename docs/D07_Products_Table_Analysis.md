
# Product Table Analysis

## 1. Table Name

**olist_products_dataset**

---

## 2. Business Process

This table represents the **Product Management Process**. It stores detailed information about every product available on the Olist marketplace, including its category, physical dimensions, weight, and product listing attributes.

---

## 3. Business Purpose

The Products table stores detailed information about each product sold on the marketplace. It helps the business analyze product categories, optimize inventory management, improve logistics planning, and evaluate product listing quality. This table becomes valuable when combined with sales data to understand product performance.

---

## 4. Grain

**One row represents one unique product.**

---

## 5. Primary Key

**product_id**

- Uniquely identifies each product.
- Used to connect products with order items.

---

## 6. Foreign Keys

**None**

However, **product_id** acts as a foreign key in the **olist_order_items_dataset** table.

---

## 7. Column Details

| Column | Description | Business Importance |
|---------|-------------|--------------------|
| product_id | Unique identifier of a product | Used to uniquely identify products and connect them with sales data. |
| product_category_name | Product category | Helps analyze category-wise sales, demand, and profitability. |
| product_name_lenght | Number of characters in the product name | Used to evaluate product listing quality and naming consistency. |
| product_description_lenght | Number of characters in the product description | Helps assess the completeness and quality of product descriptions. |
| product_photos_qty | Number of product images | Used to analyze whether richer product listings improve customer engagement and sales. |
| product_weight_g | Product weight in grams | Used to estimate shipping costs and logistics planning. |
| product_length_cm | Product length in centimeters | Required for packaging and transportation planning. |
| product_height_cm | Product height in centimeters | Used to calculate package dimensions and storage requirements. |
| product_width_cm | Product width in centimeters | Supports packaging optimization and freight cost calculations. |

---

## 8. Possible Business Questions

1. Which product category has the highest number of products?
2. Which product categories generate the highest revenue? *(Requires Order Items table)*
3. Do products with more images receive more orders?
4. Does a longer product description influence sales?
5. Which products are the heaviest?
6. Which product categories have the highest average weight?
7. Which products require the largest packaging space?
8. Which product categories contribute the most to total orders?

---

## 9. Possible Joins

| Table | Join Column | Purpose |
|---------|-------------|---------|
| olist_order_items_dataset | product_id | Analyze product sales, revenue, and profitability. |
| product_category_name_translation | product_category_name | Convert Portuguese category names into English. |

---

## 10. Data Quality Checks

- Check for duplicate **product_id** values.
- Check for missing product category names.
- Verify that product weight is greater than zero.
- Verify that product dimensions are valid.
- Check for missing product descriptions.
- Verify that product photo quantity is not negative.
- Identify products with incomplete information.

---

## 11. Assumptions

- Each **product_id** represents one unique product.
- Every product belongs to one product category.
- Product dimensions are measured in centimeters.
- Product weight is measured in grams.
- Product images are stored separately, while only the number of images is stored in this table.

---

## 12. Key Insights

- The Products table is a **Dimension Table**.
- It contains descriptive information about products rather than transactional data.
- Revenue cannot be calculated using this table alone.
- This table becomes meaningful when joined with the **Order Items** table.
- Product dimensions and weight are essential for logistics and freight analysis.
- Product categories help businesses understand demand and optimize inventory planning.
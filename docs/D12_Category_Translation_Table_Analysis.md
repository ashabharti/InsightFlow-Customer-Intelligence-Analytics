
# Category Translation Table Analysis

## 1. Table Name

**product_category_name_translation**

---

## 2. Business Process

This table represents the **Product Category Standardization Process**. It translates product category names from Portuguese into English, making the data easier to understand and report for international users.

---

## 3. Business Purpose

The Category Translation table stores the mapping between Portuguese and English product category names. It improves data readability, supports multilingual reporting, and enables business users to understand product categories without knowing Portuguese.

---

## 4. Grain

**One row represents one product category translation.**

---

## 5. Primary Key

**product_category_name**

- Uniquely identifies each product category.
- Used to map Portuguese category names to English.

---

## 6. Foreign Keys

None.

However, **product_category_name** is used to join with the **olist_products_dataset** table.

---

## 7. Column Details

| Column | Description | Business Importance |
|---------|-------------|--------------------|
| product_category_name | Product category name in Portuguese | Used as the original category identifier. |
| product_category_name_english | Product category name in English | Makes dashboards and reports easier to understand for English-speaking users. |

---

## 8. Possible Business Questions

1. How many product categories are available?
2. Which Portuguese categories correspond to which English categories?
3. Are there any products without a translated category?
4. Which English category generates the highest revenue? *(Requires Products and Order Items tables)*
5. Which categories have the highest number of products?
6. Which translated categories are most popular?

---

## 9. Possible Joins

| Table | Join Column | Purpose |
|---------|-------------|---------|
| olist_products_dataset | product_category_name | Translate category names for reports and dashboards. |

---

## 10. Data Quality Checks

- Check for duplicate category names.
- Check for missing English translations.
- Verify every product category has a corresponding translation.
- Check for spelling inconsistencies.

---

## 11. Assumptions

- Each Portuguese category has one English translation.
- Translation names are standardized.
- Products use the same category naming convention.

---

## 12. Key Insights

- This is a **Dimension Table**.
- It improves report readability.
- It contains no sales or customer data.
- It becomes useful when joined with the Products table.
- It enables English-language dashboards and business reports.
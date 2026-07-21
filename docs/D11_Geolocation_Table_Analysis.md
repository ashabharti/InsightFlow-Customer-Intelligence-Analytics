# Geolocation Table Analysis

## 1. Table Name

**olist_geolocation_dataset**

---

## 2. Business Process

This table represents the **Location Management Process**. It stores geographical information such as ZIP code prefixes, latitude, longitude, city, and state. It helps map customers and sellers to their physical locations.

---

## 3. Business Purpose

The Geolocation table stores location information for different ZIP code prefixes. It supports delivery planning, regional sales analysis, logistics optimization, and geographical visualization of customers and sellers.

---

## 4. Grain

**One row represents one geographical location associated with a ZIP code prefix.**

> Note: A ZIP code prefix may appear multiple times because multiple latitude and longitude points can exist within the same region.

---

## 5. Primary Key

**No single primary key exists.**

This dataset contains multiple records for the same ZIP code prefix because different coordinates may represent nearby locations.

---

## 6. Foreign Keys

**None**

However, **geolocation_zip_code_prefix** can be matched with:

- customer_zip_code_prefix (Customers table)
- seller_zip_code_prefix (Sellers table)

---

## 7. Column Details

| Column | Description | Business Importance |
|---------|-------------|--------------------|
| geolocation_zip_code_prefix | ZIP code prefix | Links customers and sellers to geographic locations. |
| geolocation_lat | Latitude | Used for maps, routing, and distance calculations. |
| geolocation_lng | Longitude | Used for maps, routing, and delivery optimization. |
| geolocation_city | City | Supports city-wise sales and customer analysis. |
| geolocation_state | State | Used for regional business and logistics analysis. |

---

## 8. Possible Business Questions

1. Which state has the highest number of customers?
2. Which cities have the highest seller concentration?
3. Which regions generate the most orders?
4. What are the geographical distribution patterns of customers?
5. Which states have the largest marketplace presence?
6. How can delivery routes be optimized?
7. Which regions have the highest logistics demand?
8. Which cities should the business target for expansion?

---

## 9. Possible Joins

| Table | Join Column | Purpose |
|---------|-------------|---------|
| olist_customers_dataset | customer_zip_code_prefix | Customer location analysis. |
| olist_sellers_dataset | seller_zip_code_prefix | Seller location analysis. |

---

## 10. Data Quality Checks

- Check for missing latitude or longitude values.
- Verify latitude and longitude fall within valid ranges.
- Check for missing city or state names.
- Identify duplicate ZIP code prefix records.
- Verify ZIP code prefixes are valid.

---

## 11. Assumptions

- Latitude and longitude accurately represent the location.
- ZIP code prefixes are valid.
- City and state names are correctly recorded.
- Multiple coordinates may exist for the same ZIP code prefix.

---

## 12. Key Insights

- This is a **Dimension Table**.
- It supports geographical and logistics analysis.
- It does not contain sales or revenue information.
- It becomes valuable when joined with Customers and Sellers.
- It enables map visualizations, regional dashboards, and delivery optimization.
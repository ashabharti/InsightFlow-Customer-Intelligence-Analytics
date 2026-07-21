
# Order Payments Table Analysis

## 1. Table Name

**olist_order_payments_dataset**

---

## 2. Business Process

This table represents the **Payment Processing Process**. It records how customers paid for their orders, including the payment method, number of installments, payment sequence, and payment amount.

---

## 3. Business Purpose

The Payments table stores payment information for every order placed on the marketplace. It helps the business analyze customer payment preferences, installment usage, payment values, and revenue generated through different payment methods.

---

## 4. Grain

**One row represents one payment transaction for an order.**

> Note: An order may have multiple payment records.

---

## 5. Primary Key

There is **no single unique column**.

The combination of:

- **order_id**
- **payment_sequential**

acts as a **Composite Primary Key**.

---

## 6. Foreign Keys

| Column | References |
|---------|------------|
| order_id | olist_orders_dataset |

---

## 7. Column Details

| Column | Description | Business Importance |
|---------|-------------|--------------------|
| order_id | Unique identifier of an order | Links payment information with customer orders. |
| payment_sequential | Sequence number of the payment | Identifies multiple payments made for the same order. |
| payment_type | Payment method used by the customer | Helps analyze customer payment preferences. |
| payment_installments | Number of installments | Used to study installment trends and customer buying behavior. |
| payment_value | Total payment amount | Used to calculate revenue and financial performance. |

---

## 8. Possible Business Questions

1. Which payment method is used most frequently?
2. What is the average payment value?
3. How many customers pay using installments?
4. Which payment type generates the highest revenue?
5. What is the average number of installments?
6. Which orders have multiple payment transactions?
7. What percentage of customers use credit cards?
8. What is the total revenue generated?

---

## 9. Possible Joins

| Table | Join Column | Purpose |
|---------|-------------|---------|
| olist_orders_dataset | order_id | Analyze payments with order information. |
| olist_customers_dataset | customer_id (through Orders) | Analyze customer payment behavior. |

---

## 10. Data Quality Checks

- Check for duplicate (order_id, payment_sequential) combinations.
- Verify payment_value is greater than zero.
- Check for missing payment_type values.
- Verify payment_installments is not negative.
- Check for invalid payment methods.
- Ensure every payment belongs to an existing order.

---

## 11. Assumptions

- One order may have multiple payment transactions.
- Every payment belongs to one order.
- Payment value is stored in the same currency.
- Installments apply mainly to credit card payments.

---

## 12. Key Insights

- This table stores transaction-level payment information.
- Revenue analysis is primarily based on the payment_value column.
- Customer payment preferences can be analyzed using payment_type.
- Installment information helps understand customer purchasing behavior.
- The Payments table becomes more valuable when joined with Orders and Customers.
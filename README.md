# Zepto E-Commerce SQL Data Analysis

## Project Overview

This project analyzes a Zepto e-commerce inventory dataset using PostgreSQL.

The goal is to explore product pricing, discounts, inventory levels, product availability, and estimated revenue using SQL.

The project covers the complete workflow from data cleaning to business-focused analysis.

## Tools Used

- PostgreSQL
- SQL
- pgAdmin
- GitHub

## Dataset

The dataset contains product-level information such as:

- Product name
- Category
- MRP
- Discount percentage
- Discounted selling price
- Available quantity
- Product weight
- Out-of-stock status
- Quantity

## Data Cleaning

The dataset was cleaned and prepared before analysis.

Key steps included:

- Checking for NULL values
- Identifying duplicate product names
- Finding products with zero prices
- Removing invalid records with zero MRP
- Converting prices from paise to rupees
- Verifying the final number of records

## Business Questions

The project answers the following questions:

1. What are the top 10 products based on discount percentage?
2. Which high-MRP products are currently out of stock?
3. What is the estimated revenue for each category?
4. Which products have MRP above ₹500 and discount below 10%?
5. Which categories offer the highest average discount?
6. What is the price per gram for products weighing 100g or more?
7. How can products be grouped based on their weight?
8. What is the total inventory weight for each category?

## SQL Concepts Used

- SELECT
- WHERE
- DISTINCT
- GROUP BY
- HAVING
- ORDER BY
- LIMIT
- CASE statements
- Aggregate functions
- SUM()
- AVG()
- COUNT()
- ROUND()
- DELETE
- UPDATE

## Project Files

| File | Description |
|------|-------------|
| `zepto_analysis.sql` | SQL queries used for data cleaning and analysis |
| `zepto_v2.csv` | Zepto product dataset |

## Key Skills Demonstrated

- SQL Data Analysis
- Data Cleaning
- Exploratory Data Analysis
- PostgreSQL
- Business Problem Solving
- Inventory Analysis
- Revenue Analysis
- Data Interpretation

## Author

**Satyam Sahani**

MSc Operational Research  
University of Delhi


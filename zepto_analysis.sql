-- =====================================================
-- ZEPTO E-COMMERCE SQL DATA ANALYSIS PROJECT
-- Database: PostgreSQL
-- =====================================================


-- =====================================================
-- 1. CREATE TABLE
-- =====================================================

CREATE TABLE zepto (
    sku_id SERIAL PRIMARY KEY,
    category VARCHAR(120),
    name VARCHAR(150) NOT NULL,
    mrp NUMERIC(8,2),
    discountPercent NUMERIC(5,2),
    availableQuantity INTEGER,
    discountedSellingPrice NUMERIC(8,2),
    weightInGms INTEGER,
    outOfStock BOOLEAN,
    quantity INTEGER
);


-- =====================================================
-- 2. DATA QUALITY CHECK
-- Check for NULL values
-- =====================================================

SELECT *
FROM zepto
WHERE name IS NULL
   OR category IS NULL
   OR mrp IS NULL
   OR discountPercent IS NULL
   OR discountedSellingPrice IS NULL
   OR weightInGms IS NULL
   OR availableQuantity IS NULL
   OR outOfStock IS NULL
   OR quantity IS NULL;


-- =====================================================
-- 3. CHECK DUPLICATE PRODUCT NAMES
-- =====================================================

SELECT
    name,
    COUNT(sku_id) AS "Number of SKUs"
FROM zepto
GROUP BY name
HAVING COUNT(sku_id) > 1
ORDER BY COUNT(sku_id) DESC;


-- =====================================================
-- 4. FIND PRODUCTS WITH ZERO PRICE
-- =====================================================

SELECT *
FROM zepto
WHERE mrp = 0
   OR discountedSellingPrice = 0;


-- =====================================================
-- 5. REMOVE PRODUCTS WITH ZERO MRP
-- =====================================================

DELETE FROM zepto
WHERE mrp = 0;


-- =====================================================
-- 6. CONVERT PRICE FROM PAISE TO RUPEES
-- =====================================================

UPDATE zepto
SET mrp = mrp / 100.0,
    discountedSellingPrice = discountedSellingPrice / 100.0;


-- =====================================================
-- 7. VERIFY DATA
-- =====================================================

SELECT COUNT(*) AS total_products
FROM zepto;


-- =====================================================
-- 8. Q1 - TOP 10 BEST-VALUE PRODUCTS
-- Based on discount percentage
-- =====================================================

SELECT DISTINCT
    name,
    mrp,
    discountPercent
FROM zepto
ORDER BY discountPercent DESC
LIMIT 10;


-- =====================================================
-- 9. Q2 - HIGH MRP PRODUCTS THAT ARE OUT OF STOCK
-- =====================================================

SELECT DISTINCT
    name,
    mrp
FROM zepto
WHERE outOfStock = TRUE
  AND mrp > 300
ORDER BY mrp DESC;


-- =====================================================
-- 10. Q3 - ESTIMATED REVENUE BY CATEGORY
-- =====================================================

SELECT
    category,
    SUM(discountedSellingPrice * availableQuantity) AS total_revenue
FROM zepto
GROUP BY category
ORDER BY total_revenue DESC;


-- =====================================================
-- 11. Q4 - PRODUCTS WITH MRP ABOVE ₹500
-- AND DISCOUNT BELOW 10%
-- =====================================================

SELECT DISTINCT
    name,
    mrp,
    discountPercent
FROM zepto
WHERE mrp > 500
  AND discountPercent < 10
ORDER BY mrp DESC,
         discountPercent DESC;


-- =====================================================
-- 12. Q5 - TOP 5 CATEGORIES BY AVERAGE DISCOUNT
-- =====================================================

SELECT
    category,
    ROUND(AVG(discountPercent), 2) AS avg_discount
FROM zepto
GROUP BY category
ORDER BY avg_discount DESC
LIMIT 5;


-- =====================================================
-- 13. Q6 - PRICE PER GRAM
-- Products weighing 100g or more
-- =====================================================

SELECT DISTINCT
    name,
    weightInGms,
    discountedSellingPrice,
    ROUND(
        discountedSellingPrice / weightInGms,
        2
    ) AS price_per_gram
FROM zepto
WHERE weightInGms >= 100
ORDER BY price_per_gram;


-- =====================================================
-- 14. Q7 - PRODUCT WEIGHT CATEGORIES
-- Low / Medium / Bulk
-- =====================================================

SELECT DISTINCT
    name,
    weightInGms,
    CASE
        WHEN weightInGms < 1000 THEN 'Low'
        WHEN weightInGms < 5000 THEN 'Medium'
        ELSE 'Bulk'
    END AS weight_category
FROM zepto;


-- =====================================================
-- 15. Q8 - TOTAL INVENTORY WEIGHT BY CATEGORY
-- =====================================================

SELECT
    category,
    SUM(weightInGms * availableQuantity) AS total_weight
FROM zepto
GROUP BY category
ORDER BY total_weight DESC;


-- =====================================================
-- END OF PROJECT
-- =====================================================
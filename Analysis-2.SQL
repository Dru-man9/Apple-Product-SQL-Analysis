-- =============================================
-- Apple Product Analysis
-- =============================================
-- This SQL file loads product data from a CSV
-- file and runs queries to analyze Apple's
-- product lineup across categories.
-- =============================================
-- Tool: DuckDB (lightweight SQL engine)
-- To run: Open terminal, navigate to the folder
-- containing this file and products.csv, then:
--   duckdb < Analysis.SQL
-- =============================================


-- Step 1: Create a table from the CSV file
-- NOTE: The CSV file (products.csv) must be in
-- the same folder as this SQL file when you run it.
CREATE TABLE products AS
SELECT * FROM read_csv_auto('products.csv');


-- =============================================
-- QUERY 1: View all products
-- Shows every product sorted by price
-- (highest to lowest)
-- =============================================
SELECT
    Product_ID,
    Product_Name,
    Category_ID,
    Launch_Date,
    Price
FROM products
ORDER BY Price DESC;


-- =============================================
-- QUERY 2: Count products in each category
-- Shows how many products Apple has per category
-- =============================================
SELECT
    Category_ID,
    COUNT(*) AS Total_Products
FROM products
GROUP BY Category_ID
ORDER BY Total_Products DESC;


-- =============================================
-- QUERY 3: Average price by category
-- Finds the average price for each category
-- =============================================
SELECT
    Category_ID,
    ROUND(AVG(Price), 2) AS Avg_Price,
    MIN(Price) AS Lowest_Price,
    MAX(Price) AS Highest_Price
FROM products
GROUP BY Category_ID
ORDER BY Avg_Price DESC;


-- =============================================
-- QUERY 4: Most expensive product per category
-- Uses a subquery to find the top-priced item
-- in each category
-- =============================================
SELECT
    Product_ID,
    Product_Name,
    Category_ID,
    Price
FROM products
WHERE Price IN (
    SELECT MAX(Price)
    FROM products
    GROUP BY Category_ID
)
ORDER BY Price DESC;


-- =============================================
-- QUERY 5: Products launched in 2024
-- Filters for recently launched products
-- =============================================
SELECT
    Product_Name,
    Launch_Date,
    Price
FROM products
WHERE Launch_Date >= '2024-01-01'
ORDER BY Launch_Date;


-- =============================================
-- QUERY 6: Price tiers
-- Groups products into Budget, Mid-Range,
-- and Premium categories using CASE
-- =============================================
SELECT
    Product_Name,
    Price,
    CASE
        WHEN Price < 500 THEN 'Budget'
        WHEN Price BETWEEN 500 AND 1200 THEN 'Mid-Range'
        ELSE 'Premium'
    END AS Price_Tier
FROM products
ORDER BY Price DESC;


-- =============================================
-- QUERY 7: Count of products per price tier
-- Summarizes how many products fall into each
-- price tier
-- =============================================
SELECT
    CASE
        WHEN Price < 500 THEN 'Budget'
        WHEN Price BETWEEN 500 AND 1200 THEN 'Mid-Range'
        ELSE 'Premium'
    END AS Price_Tier,
    COUNT(*) AS Product_Count,
    ROUND(AVG(Price), 2) AS Avg_Price
FROM products
GROUP BY Price_Tier
ORDER BY Avg_Price DESC;


-- =============================================
-- QUERY 8: Products launched per year
-- Shows Apple's launch volume by year
-- =============================================
SELECT
    YEAR(Launch_Date) AS Launch_Year,
    COUNT(*) AS Products_Launched
FROM products
GROUP BY Launch_Year
ORDER BY Launch_Year;


-- =============================================
-- QUERY 9: Top 10 most expensive products
-- A simple ranking of Apple's priciest items
-- =============================================
SELECT
    Product_Name,
    Category_ID,
    Price
FROM products
ORDER BY Price DESC
LIMIT 10;


-- =============================================
-- QUERY 10: Top 10 cheapest products
-- The most affordable items in Apple's lineup
-- =============================================
SELECT
    Product_Name,
    Category_ID,
    Price
FROM products
ORDER BY Price ASC
LIMIT 10;

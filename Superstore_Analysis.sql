CREATE DATABASE superstore_db;
use superstore_db;

-- PART 1 :  Checking total number of records in dataset

SELECT COUNT(*) AS total_records
FROM Superstore;

-- checking column names 
DESCRIBE superstore;


-- PART 2 : DATA EXPLORATION MAIN PART

SELECT *
FROM superstore
LIMIT 10;

SELECT DISTINCT Category
FROM superstore;

SELECT DISTINCT Region
FROM superstore;

SELECT DISTINCT Segment
FROM superstore;

-- PART 3: Data Quality Validation

SELECT COUNT(*)
FROM superstore;

-- checking if there is any NUll values in profit and sales column
SELECT COUNT(*)
FROM superstore
WHERE Sales IS NULL;

SELECT COUNT(*)
FROM superstore
WHERE Profit IS NULL;

-- PART 4: Filtering Analysis
-- Technlogy orders
SELECT *
FROM superstore
WHERE Category='Technology';

-- West Region Orders

SELECT *
FROM superstore
WHERE Region='West';

-- High Value Orders
-- Those products whose sales is greater than 1000
SELECT *
FROM superstore
WHERE Sales > 1000;

-- High Discount Orders

SELECT *
FROM superstore
WHERE Discount > 0.5;

-- PART 5: Category Analysis

SELECT
Category,
ROUND(SUM(Sales),2) AS Total_Sales
FROM superstore
GROUP BY Category
ORDER BY Total_Sales DESC;

-- Technology generates the highest revenue among all categories.



-- Total Profit By Category
SELECT
Category,
ROUND(SUM(Profit),2) AS Total_Profit
FROM superstore
GROUP BY Category
ORDER BY Total_Profit DESC;

-- Insight : Technology contributes the highest profitability.

-- PART 6: Regional Analysis
SELECT
Region,
ROUND(SUM(Sales),2) AS Total_Sales
FROM superstore
GROUP BY Region
ORDER BY Total_Sales DESC;

-- Profit By Region
SELECT
Region,
ROUND(SUM(Profit),2) AS Total_Profit
FROM superstore
GROUP BY Region
ORDER BY Total_Profit DESC;

-- Insight : The West region contributes the largest share of revenue.



-- PART 7: Customer Analysis
-- Top Customers
SELECT
`Customer Name`,
ROUND(SUM(Sales),2) AS Total_Spent
FROM superstore
GROUP BY `Customer Name`
ORDER BY Total_Spent DESC
LIMIT 10;

-- Insight : A small group of customers contributes a significant portion of revenue.



-- PART 8: Product Analysis 
-- Top Products By Sales
SELECT
`Product Name`,
ROUND(SUM(Sales),2) AS Total_Sales
FROM superstore
GROUP BY `Product Name`
ORDER BY Total_Sales DESC
LIMIT 10;

-- Top Products By Profit
SELECT
`Product Name`,
ROUND(SUM(Profit),2) AS Total_Profit
FROM superstore
GROUP BY `Product Name`
ORDER BY Total_Profit DESC
LIMIT 10;




-- PART 9: Segment Analysis

SELECT
Segment,
ROUND(SUM(Sales),2) AS Total_Sales
FROM superstore
GROUP BY Segment
ORDER BY Total_Sales DESC;

-- Insight : Consumer segment contributes the highest sales.


-- PART 10: Monthly Trend Analysis
SELECT 
    YEAR(STR_TO_DATE(`Order Date`, '%m/%d/%Y')) AS Year, 
    MONTH(STR_TO_DATE(`Order Date`, '%m/%d/%Y')) AS Month, 
    ROUND(SUM(Sales), 2) AS Revenue 
FROM superstore 
GROUP BY Year, Month 
ORDER BY Year, Month;

-- Insight : Monthly sales reveal seasonal purchasing trends.



-- PART 11: Discount Impact
SELECT
Discount,
ROUND(AVG(Profit),2) AS Avg_Profit
FROM superstore
GROUP BY Discount
ORDER BY Discount;

-- Insight : Higher discounts generally reduce profitability.





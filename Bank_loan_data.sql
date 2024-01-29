-- CREATE DATABASE Hicounseler;
USE Hicounseler;
SELECT * FROM liability;
-- Count Total Records in 'liability' Table.
SELECT COUNT(*) FROM liability;

-- Seeking Average Income.
SELECT AVG(Income) FROM liability;

-- Identifying High-Potential Customers.
SELECT * FROM liability
ORDER BY Income DESC;
-- Uncovering Educational Financial Trends.
SELECT Education, AVG(Income) FROM liability
GROUP BY Education;
-- Top Income Earners by Education
WITH RankedData AS(
SELECT *,
RANK() OVER(PARTITION BY Education ORDER BY Income DESC) AS IncomeRank FROM liability
)
SELECT * FROM RankedData
WHERE IncomeRank<=2;
-- Profiling Customer Demographics.
-- Group Data into Age Categories and Count in 'liability' Table.
-- Use the SQL SELECT statement.
-- Implement a CASE statement to categorize ages into groups ('18-30', '31-45', '46-60', '61+').
-- Apply the COUNT() aggregate function to calculate the number of records in each age group.
-- Include the GROUP BY clause to group data based on the defined age categories.
-- Execute the query to obtain counts for each age group.
-- The result will display the distribution of records across different age categories in the 'liability' dataset.
SELECT 
    CASE
        WHEN Age BETWEEN 18 AND 30 THEN '18-30'
        WHEN Age BETWEEN 30 AND 45 THEN '31-45'
        WHEN Age BETWEEN 46 AND 60 THEN '46-60'
        WHEN Age > 60 THEN '61+'
        ELSE 'Unknow'
    END AS Age_group,
    COUNT(*) as count
FROM
    liability
GROUP BY Age_group;

-- Calculate Average Age for Customers with CCAvg Above Overall Average in 'liability' Table.
-- Use SQL SELECT statement.
-- Apply AVG() to 'Age' for the main query.
-- Include a WHERE clause to filter records where 'CCAvg' is above the overall average of 'CCAvg' in the 'liability' table.
-- Execute the query to obtain the average age for customers with above-average 'CCAvg'.
-- The result provides insights into the average age of customers with higher credit card spending ('CCAvg').
SELECT  AVG(Age) AS AveraeAge FROM liability
WHERE
CCAvg>(SELECT AVG(CCAvg) FROM liability);

-- Retrieve Records with Income Above 1.5 Times the Average in 'liability' Table.
-- Utilize SQL SELECT statement.
-- Include a WHERE clause to filter records where 'Income' is greater than 1.5 times the overall average income in the 'liability' table.
-- Execute the query to retrieve records with incomes significantly above the average.
-- The result provides a subset of records indicating individuals with relatively high incomes.

SELECT * FROM liability
WHERE Income>1.5 *(SELECT AVG(Income) FROM liability);


-- Find the Youngest Age in Each Family Group in 'liability' Table.
-- Use SQL SELECT statement.
-- Apply MIN() to 'Age' to obtain the youngest age in each family group.
-- Include the GROUP BY clause to group data based on the 'Family' column.
-- Execute the query to find the youngest age in each family group.
-- The result provides information on the youngest age within each family category.

SELECT Family, MIN(Age) AS youngest FROM liability
GROUP BY Family;



-- Retrieve Records with Non-Zero Mortgage Values in 'liability' Table.
-- Utilize SQL SELECT statement.
-- Include a WHERE clause to filter records where 'Mortgage' has a value greater than 0 in the 'liability' table.
-- Execute the query to retrieve records with non-zero mortgage values.
-- The result provides a subset of records indicating individuals with mortgages

SELECT * FROM liability
WHERE Mortgage>0;


-- Retrieve Records with Non-Zero Mortgage Values in 'liability' Table.
-- Use SQL SELECT statement.
-- Apply COUNT() to calculate the number of customers for each education level.
-- Include the GROUP BY clause to group data based on the 'Education' column.
-- Execute the query to obtain the count of customers for each education level.
-- The result provides a breakdown of customer counts categorized by their education levels.
SELECT Education,count(*) as count FROM liability
GROUP BY Education




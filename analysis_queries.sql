-- Wholesale Customer Spending Analysis
-- SQL used for validation and grouped analysis.
-- The table is based on the cleaned Excel dataset.

-- 1. Basic customer count and spending KPIs
SELECT
    COUNT(*) AS customers,
    SUM(Total_Spending) AS total_spending,
    AVG(Total_Spending) AS average_spending,
    MIN(Total_Spending) AS minimum_spending,
    MAX(Total_Spending) AS maximum_spending
FROM wholesale_customers;

-- 2. Channel comparison
SELECT
    Channel_Name,
    COUNT(*) AS customers,
    SUM(Total_Spending) AS total_spending,
    AVG(Total_Spending) AS average_spending
FROM wholesale_customers
GROUP BY Channel_Name
ORDER BY total_spending DESC;

-- 3. Region comparison
SELECT
    Region_Name,
    COUNT(*) AS customers,
    SUM(Total_Spending) AS total_spending,
    AVG(Total_Spending) AS average_spending
FROM wholesale_customers
GROUP BY Region_Name
ORDER BY total_spending DESC;

-- 4. Spending segment counts
SELECT
    Spending_Segment,
    COUNT(*) AS customers,
    AVG(Total_Spending) AS average_spending
FROM wholesale_customers
GROUP BY Spending_Segment
ORDER BY
    CASE Spending_Segment
        WHEN 'Low' THEN 1
        WHEN 'Medium' THEN 2
        WHEN 'High' THEN 3
    END;

-- 5. Category totals
SELECT
    SUM(Fresh) AS Fresh,
    SUM(Milk) AS Milk,
    SUM(Grocery) AS Grocery,
    SUM(Frozen) AS Frozen,
    SUM(Detergents_Paper) AS Detergents_Paper,
    SUM(Delicassen) AS Delicassen
FROM wholesale_customers;

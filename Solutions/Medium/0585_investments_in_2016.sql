-- 585. Investments in 2016 
-- Find sum of TIV_2016 for policies that meet two conditions: 
-- 1. Same TIV_2015 as another policy 
-- 2. Unique location (lat, lon) 
 
-- ==================== Solution 1: Subquery with IN and GROUP BY ==================== 
SELECT ROUND(SUM(TIV_2016), 2) AS TIV_2016 
FROM insurance 
WHERE TIV_2015 IN ( 
    SELECT TIV_2015 
    FROM insurance 
    GROUP BY TIV_2015 
    HAVING COUNT(*) > 1 
) 
AND (lat, lon) IN ( 
    SELECT lat, lon 
    FROM insurance 
    GROUP BY lat, lon 
    HAVING COUNT(*) = 1 
); 
 
-- ==================== Key Learnings ==================== 
-- 1. Multi-column IN: (col1, col2) IN (subquery) 
-- 2. HAVING COUNT(*) > 1: find duplicates 
-- 3. HAVING COUNT(*) = 1: find unique 
-- 4. ROUND(SUM(value), 2): round to 2 decimals 

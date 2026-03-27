-- 1321. Restaurant Growth  
-- Medium  
-- https://leetcode.com/problems/restaurant-growth/  
  
-- Write your MySQL query statement below  
  
WITH daily_amount AS (  
    SELECT visited_on, SUM(amount) AS amount  
    FROM Customer  
    GROUP BY visited_on  
)  
SELECT  
    visited_on,  
    amount,  
    ROUND(amount / 7, 2) AS average_amount  
FROM (  
    SELECT  
        visited_on,  
        SUM(amount) OVER (ORDER BY visited_on RANGE BETWEEN INTERVAL 6 DAY PRECEDING AND CURRENT ROW) AS amount  
    FROM daily_amount  
) t  
WHERE DATEDIFF(visited_on, (SELECT MIN(visited_on) FROM daily_amount))  
ORDER BY visited_on;  
  

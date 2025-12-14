-- 180. Consecutive Numbers 
-- Find all numbers that appear at least three times consecutively. 
 
-- ==================== Solution 1: Self-Join (Recommended) ==================== 
SELECT DISTINCT logs1.num as ConsecutiveNums 
FROM Logs logs1 
LEFT JOIN Logs logs2 ON logs1.id = logs2.id - 1 
LEFT JOIN Logs logs3 ON logs2.id = logs3.id - 1 
WHERE logs1.num = logs2.num AND logs2.num = logs3.num; 
 
-- ==================== Solution 2: LAG() window function ==================== 
SELECT DISTINCT num AS ConsecutiveNums 
FROM ( 
    SELECT num, 
           LAG(num, 1) OVER (ORDER BY id) AS prev1, 
           LAG(num, 2) OVER (ORDER BY id) AS prev2 
    FROM Logs 
) t 
WHERE num = prev1 AND num = prev2; 
 
-- ==================== Key Learnings ==================== 
-- 1. LAG(column, n): look at value n rows before current row 
-- 2. Self-join checks consecutive rows via id (id-1, id-2) 
-- 3. Both methods work, window function is more concise 
-- 4. Consecutive sequence detection is common in data analysis 

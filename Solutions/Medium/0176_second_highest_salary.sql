-- 176. Second Highest Salary 
-- Find the second highest salary 
 
-- ==================== Solution 1: LIMIT OFFSET (Recommended) ==================== 
SELECT 
    (SELECT DISTINCT salary 
     FROM Employee 
     ORDER BY salary DESC 
     LIMIT 1 OFFSET 1) AS SecondHighestSalary; 
 
-- ==================== Solution 2: MAX function ==================== 
SELECT MAX(salary) AS SecondHighestSalary 
FROM Employee 
 
-- ==================== Key Learnings ==================== 
-- 1. LIMIT n OFFSET m: skip m rows, take n rows 
-- 2. Handle case when no second highest exists (returns NULL) 
-- 3. Use subquery wrapper for proper NULL handling 

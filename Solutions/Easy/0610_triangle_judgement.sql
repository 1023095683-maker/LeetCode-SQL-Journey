-- 610. Triangle Judgement  
-- Easy  
-- https://leetcode.com/problems/triangle-judgement/  
  
-- Write your MySQL query statement below  
  
SELECT  
    x,  
    y,  
    z,  
    CASE  
        WHEN x + y  AND x + z  AND y + z  THEN 'Yes'  
        ELSE 'No'  
    END AS triangle  
FROM Triangle;  
  

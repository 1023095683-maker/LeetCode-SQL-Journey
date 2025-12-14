-- 178. Rank Scores 
-- Rank scores. Same scores get same rank, ranks should be consecutive. 
 
-- ==================== Solution 1: DENSE_RANK window function (Recommended) ==================== 
SELECT 
    score, 
    DENSE_RANK() OVER (ORDER BY score DESC) AS `rank` 
FROM Scores 
ORDER BY score DESC; 
 
-- ==================== Solution 2: Using variables (for older MySQL) ==================== 
SELECT 
    score, 
    @rank := @rank + (score != @prev) AS `rank`, 
    @prev := score 
FROM 
    Scores, 
    (SELECT @rank := 0, @prev := -1) init 
ORDER BY score DESC; 
 
-- ==================== Key Learnings ==================== 
-- 1. DENSE_RANK(): same values get same rank, ranks are consecutive 
-- 2. OVER (ORDER BY ...): defines the ordering window 
-- 3. `rank` is SQL keyword, need backticks 
-- 4. Window functions are important for SQL mastery 

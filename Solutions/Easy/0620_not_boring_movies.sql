-- 620. Not Boring Movies 
-- Find movies with odd ID and description not 'boring' 
 
-- ==================== Solution 1: WHERE with multiple conditions ==================== 
SELECT * 
FROM cinema 
WHERE id %% 2 = 1 AND description != 'boring' 
ORDER BY rating DESC; 
 
-- ==================== Solution 2: Using MOD function ==================== 
SELECT * 
FROM cinema 
WHERE MOD(id, 2) = 1 AND description <> 'boring' 
ORDER BY rating DESC; 
 
-- ==================== Key Learnings ==================== 
-- 1. Check odd numbers: id %% 2 = 1 or MOD(id, 2) = 1 
-- 2. Not equal: <> or != 
-- 3. Multiple WHERE conditions with AND 
-- 4. ORDER BY for final sorting 

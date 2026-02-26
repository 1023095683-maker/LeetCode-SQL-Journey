-- 601. Human Traffic of Stadium 
-- Find rows with at least 3 consecutive records with people >= 100 
 
-- ==================== Solution 1: Self-Join (Recommended) ==================== 
SELECT DISTINCT s1.id, s1.visit_date, s1.people 
FROM stadium s1, stadium s2, stadium s3 
WHERE s1.people >= 100 AND s2.people >= 100 AND s3.people >= 100 
AND ( 
    (s1.id = s2.id + 1 AND s1.id = s3.id + 2) OR 
    (s1.id = s2.id - 1 AND s1.id = s3.id + 1) OR 
    (s1.id = s2.id - 1 AND s1.id = s3.id - 2) 
) 
ORDER BY s1.id; 
 
-- ==================== Solution 2: Window Functions with CTE ==================== 
WITH filtered AS ( 
    SELECT id, visit_date, people, 
           id - ROW_NUMBER() OVER (ORDER BY id) AS grp 
    FROM stadium 
    WHERE people >= 100 
) 
SELECT id, visit_date, people 
FROM filtered 
WHERE grp IN ( 
    SELECT grp 
    FROM filtered 
    GROUP BY grp 
    HAVING COUNT(*) >= 3 
) 
ORDER BY id; 
 
-- ==================== Key Learnings ==================== 
-- 1. 180???????:??3??? 
-- 2. ?????????????(????????) 
-- 3. ??????:id - ROW_NUMBER() ?????? 
-- 4. CTE(??????)?????? 

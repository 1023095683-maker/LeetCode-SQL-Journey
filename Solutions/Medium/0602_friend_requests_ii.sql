-- 602. Friend Requests II: Who Has the Most Friends  
-- Medium  
-- https://leetcode.com/problems/friend-requests-ii-who-has-the-most-friends/  
  
-- Write your MySQL query statement below  
  
WITH all_friends AS (  
    SELECT requester_id AS id FROM RequestAccepted  
    UNION ALL  
    SELECT accepter_id AS id FROM RequestAccepted  
)  
SELECT  
    id,  
    COUNT(*) AS num  
FROM all_friends  
GROUP BY id  
ORDER BY num DESC  
LIMIT 1;  
  

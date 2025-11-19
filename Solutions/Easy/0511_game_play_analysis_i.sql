-- 511. Game Play Analysis I 
-- ?????????????? 
 
-- ==================== ??1:GROUP BY + MIN(????) ==================== 
SELECT player_id, MIN(event_date) as first_login 
FROM Activity 
GROUP BY player_id; 

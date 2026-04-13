-- 1407. 排名靠前的旅行者（简单）
-- 核心知识点：LEFT JOIN、SUM、GROUP BY、IFNULL
-- 推荐理由：巩固多表连接与分组聚合，练习处理无记录时显示0的经典场景

SELECT u.name, IFNULL(SUM(r.distance), 0) AS travelled_distance
FROM Users u
LEFT JOIN Rides r ON u.id = r.user_id
GROUP BY u.id, u.name
ORDER BY travelled_distance DESC, u.name;

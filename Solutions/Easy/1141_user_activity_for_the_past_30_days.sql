-- 1141. 查询近30天活跃用户数（简单）
-- 核心知识点：日期函数（DATE_SUB）、COUNT DISTINCT
-- 推荐理由：学习时间范围统计，掌握"近30天"类业务指标的SQL写法

SELECT activity_date AS day, COUNT(DISTINCT user_id) AS active_users
FROM Activity
WHERE activity_date BETWEEN DATE_SUB('2019-07-27', INTERVAL 29 DAY) AND '2019-07-27'
GROUP BY activity_date;

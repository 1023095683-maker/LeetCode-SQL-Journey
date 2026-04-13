# LeetCode SQL Journey

[![GitHub](https://img.shields.io/badge/GitHub-Repository-blue?logo=github)](https://github.com/1023095683-maker/LeetCode-SQL-Journey)
[![SQL](https://img.shields.io/badge/SQL-Practice-orange?logo=mysql)](https://leetcode.com/)

> 通过LeetCode系统学习SQL - 从基础到专家

## 📊 Progress Overview

| Difficulty | Total | Solved | Progress |
|------------|-------|--------|----------|
| Easy | 50 | 14 | 28% |
| Medium | 150 | 20 | 13% |
| Hard | 30 | 2 | 7% |

## 🎯 Learning Path

### ✅ Completed

**🔹 Easy (14题)**
- **175**. Combine Two Tables - LEFT JOIN基础
- **181**. Employees Earning More Than Their Managers - 自连接应用
- **182**. Duplicate Emails - 分组过滤
- **183**. Customers Who Never Order - 空值检测
- **196**. Delete Duplicate Emails - 数据删除
- **197**. Rising Temperature - 日期函数
- **511**. Game Play Analysis I - 分组聚合
- **577**. Employee Bonus - LEFT JOIN条件
- **584**. Find Customer Referee - NULL值处理
- **607**. Sales Person - NOT EXISTS应用
- **610**. Triangle Judgement - CASE WHEN/三角形判断
- **620**. Not Boring Movies - 多条件过滤
- **1141**. User Activity for the Past 30 Days - 日期范围统计/COUNT DISTINCT
- **1407**. Top Travellers - LEFT JOIN/SUM/IFNULL

**🔹 Medium (20题)**
- **176**. Second Highest Salary - LIMIT OFFSET
- **177**. Nth Highest Salary - 自定义函数
- **178**. Rank Scores - 窗口函数(DENSE_RANK)
- **180**. Consecutive Numbers - 窗口函数(LAG)/自连接
- **184**. Department Highest Salary - JOIN/子查询
- **185**. Department Top Three Salaries - 窗口函数实战
- **550**. Game Play Analysis IV - 首次登录/连续日期判断/CTE
- **570**. Managers with at Least 5 Direct Reports - 自连接进阶
- **585**. Investments in 2016 - 复杂条件聚合
- **602**. Friend Requests II: Who Has the Most Friends - UNION ALL/分组聚合
- **608**. Tree Node - 树结构判断/CASE WHEN/自连接
- **619**. Biggest Single Number - GROUP BY/HAVING
- **626**. Exchange Seats - CASE WHEN/奇偶判断
- **1045**. Customers Who Bought All Products - HAVING/子查询/COUNT(DISTINCT)
- **1179**. Reformat Department Table - CASE WHEN/行转列
- **1321**. Restaurant Growth - 窗口函数/滑动窗口/日期范围
- **1393**. Capital Gain/Loss - CASE WHEN/SUM/分组聚合

**🔹 Hard (2题) 🎉**
- **262**. Trips and Users - 取消率计算/复杂业务逻辑
- **601**. Human Traffic of Stadium - 窗口函数/连续检测(CTE)

### 🔄 In Progress
- 深入学习窗口函数高级应用
- 掌握复杂业务逻辑实现
- 学习查询性能优化技巧
- 继续挑战Hard难度题目

## 📁 Project Structure
LeetCode-SQL-Journey/
├── Solutions/ # 题解目录
│ ├── Easy/ # 简单难度
│ │ ├── 0175_combine_two_tables.sql
│ │ ├── 0181_employees_earning_more_than_managers.sql
│ │ ├── 0182_duplicate_emails.sql
│ │ ├── 0183_customers_who_never_order.sql
│ │ ├── 0196_delete_duplicate_emails.sql
│ │ ├── 0197_rising_temperature.sql
│ │ ├── 0511_game_play_analysis_i.sql
│ │ ├── 0577_employee_bonus.sql
│ │ ├── 0584_find_customer_referee.sql
│ │ ├── 0607_sales_person.sql
│ │ ├── 0610_triangle_judgement.sql
│ │ ├── 0620_not_boring_movies.sql
│ │ ├── 1141_user_activity_for_the_past_30_days.sql
│ │ └── 1407_top_travellers.sql
│ ├── Medium/ # 中等难度
│ │ ├── 0176_second_highest_salary.sql
│ │ ├── 0177_nth_highest_salary.sql
│ │ ├── 0178_rank_scores.sql
│ │ ├── 0180_consecutive_numbers.sql
│ │ ├── 0184_department_highest_salary.sql
│ │ ├── 0185_department_top_three_salaries.sql
│ │ ├── 0550_game_play_analysis_iv.sql
│ │ ├── 0570_managers_with_5_direct_reports.sql
│ │ ├── 0585_investments_in_2016.sql
│ │ ├── 0602_friend_requests_ii.sql
│ │ ├── 0608_tree_node.sql
│ │ ├── 0619_biggest_single_number.sql
│ │ ├── 0626_exchange_seats.sql
│ │ ├── 1045_customers_who_bought_all_products.sql
│ │ ├── 1179_reformat_department_table.sql
│ │ ├── 1321_restaurant_growth.sql
│ │ └── 1393_capital_gain_loss.sql
│ └── Hard/ # 困难难度
│ ├── 0262_trips_and_users.sql
│ └── 0601_human_traffic_of_stadium.sql
├── Study-Notes/ # 学习笔记和总结
├── Progress/ # 进度追踪
└── README.md # 项目说明

text

## 💡 SQL核心知识点

### NULL值处理的正确方式

**重要区别：`IS NULL` vs `= NULL`**

```sql
-- ✅ 正确写法：使用 IS NULL
SELECT name FROM Customer WHERE referee_id IS NULL;

-- ❌ 错误写法：使用 = NULL  
SELECT name FROM Customer WHERE referee_id = NULL;
为什么不能用 = NULL？

SQL使用三值逻辑：TRUE, FALSE, UNKNOWN

任何与 NULL 的比较都返回 UNKNOWN

WHERE 条件只接受 TRUE，UNKNOWN 被当作 FALSE 处理

所以 = NULL 永远不会匹配到任何记录

窗口函数核心总结
基本语法结构
text
函数名() OVER (PARTITION BY 分组字段 ORDER BY 排序字段)
OVER() 子句详解
OVER() 定义"计算窗口" - 告诉SQL在哪部分数据上执行计算：

OVER() 配置	作用	类比
OVER()	在整个表上计算	无分组，全体排名
OVER (ORDER BY 列)	在排序后的序列上计算	按顺序"滑动窗口"
OVER (PARTITION BY 列)	在每个分组内计算	分组但不合并行
OVER (PARTITION BY ... ORDER BY ...)	分组内按顺序计算	最完整的窗口定义
常用排名函数对比
函数	相同分数处理	排名是否连续	示例：分数 [100, 100, 90]
DENSE_RANK()	相同排名	✅ 连续	1, 1, 2
RANK()	相同排名	❌ 不连续（跳过）	1, 1, 3
ROW_NUMBER()	不同排名	✅ 连续	1, 2, 3
连续序列检测技巧
sql
-- 方法1：自连接（180题）
SELECT DISTINCT l1.num
FROM Logs l1, Logs l2, Logs l3
WHERE l1.id = l2.id - 1 AND l1.id = l3.id - 2
AND l1.num = l2.num AND l1.num = l3.num;

-- 方法2：窗口函数（601题进阶版）
WITH filtered AS (
    SELECT *, id - ROW_NUMBER() OVER (ORDER BY id) AS grp
    FROM stadium WHERE people >= 100
)
SELECT id, visit_date, people
FROM filtered
WHERE grp IN (
    SELECT grp FROM filtered GROUP BY grp HAVING COUNT(*) >= 3
);
核心特点
保持原行数：不像GROUP BY会合并行，为每行添加计算列

灵活定义窗口：PARTITION BY分组，ORDER BY排序

应用场景：排名、累计计算、移动平均、前后行比较、分组分析、连续序列检测

树结构判断（608题）
sql
-- 判断节点类型：根节点/内部节点/叶子节点
SELECT id,
    CASE 
        WHEN p_id IS NULL THEN 'Root'
        WHEN id IN (SELECT p_id FROM Tree WHERE p_id IS NOT NULL) THEN 'Inner'
        ELSE 'Leaf'
    END AS type
FROM Tree;
首次登录连续判断（550题）
sql
-- 关键思路：先找首次登录日期，再判断第二天是否登录
WITH first_login AS (
    SELECT player_id, MIN(event_date) AS first_date
    FROM Activity
    GROUP BY player_id
)
SELECT ROUND(
    COUNT(DISTINCT a.player_id) / COUNT(DISTINCT f.player_id),
    2
) AS fraction
FROM first_login f
LEFT JOIN Activity a 
    ON f.player_id = a.player_id 
    AND a.event_date = DATE_ADD(f.first_date, INTERVAL 1 DAY);
好友统计（602题）
sql
-- 关键思路：用UNION ALL合并双向好友关系
WITH all_friends AS (
    SELECT requester_id AS id FROM RequestAccepted
    UNION ALL
    SELECT accepter_id AS id FROM RequestAccepted
)
SELECT id, COUNT(*) AS num
FROM all_friends
GROUP BY id
ORDER BY num DESC
LIMIT 1;
全量覆盖统计（1045题）
sql
-- 关键思路：HAVING + 子查询比较购买种类数
SELECT customer_id
FROM Customer
GROUP BY customer_id
HAVING COUNT(DISTINCT product_key) = (SELECT COUNT(*) FROM Product);
滑动窗口平均（1321题）
sql
-- 关键思路：RANGE BETWEEN 实现7天滑动窗口
WITH daily_amount AS (
    SELECT visited_on, SUM(amount) AS amount
    FROM Customer
    GROUP BY visited_on
)
SELECT visited_on, amount,
       ROUND(amount / 7, 2) AS average_amount
FROM (
    SELECT visited_on,
           SUM(amount) OVER (ORDER BY visited_on 
               RANGE BETWEEN INTERVAL 6 DAY PRECEDING AND CURRENT ROW) AS amount
    FROM daily_amount
) t
WHERE DATEDIFF(visited_on, (SELECT MIN(visited_on) FROM daily_amount)) >= 6;
资本损益计算（1393题）
sql
-- 关键思路：CASE WHEN 将Buy转为负数，Sell保持正数
SELECT 
    stock_name,
    SUM(CASE WHEN operation = 'Buy' THEN -price ELSE price END) AS capital_gain_loss
FROM Stocks
GROUP BY stock_name;
行转列（1179题）
sql
-- 关键思路：CASE WHEN + MAX聚合将多行转为多列
SELECT id,
       MAX(CASE WHEN month = 'Jan' THEN revenue END) AS Jan_Revenue,
       MAX(CASE WHEN month = 'Feb' THEN revenue END) AS Feb_Revenue,
       ...
FROM Department
GROUP BY id;
近30天活跃用户（1141题）
sql
-- 关键思路：BETWEEN + DATE_SUB 实现时间范围统计
SELECT activity_date AS day, COUNT(DISTINCT user_id) AS active_users
FROM Activity
WHERE activity_date BETWEEN DATE_SUB('2019-07-27', INTERVAL 29 DAY) AND '2019-07-27'
GROUP BY activity_date;
旅行者排名（1407题）
sql
-- 关键思路：LEFT JOIN + IFNULL + SUM 处理无记录时显示0
SELECT u.name, IFNULL(SUM(r.distance), 0) AS travelled_distance
FROM Users u
LEFT JOIN Rides r ON u.id = r.user_id
GROUP BY u.id, u.name
ORDER BY travelled_distance DESC, u.name;
🔧 核心技术点
JOIN操作：INNER JOIN, LEFT JOIN, 自连接

数据过滤：WHERE, HAVING, 子查询

窗口函数：DENSE_RANK, RANK, ROW_NUMBER, LAG, LEAD, AVG OVER

NULL值处理：IS NULL vs = NULL 的区别

聚合函数：COUNT, MIN, MAX, SUM, AVG, GROUP BY, 分组统计

条件逻辑：CASE WHEN, IF函数，IN操作符，奇偶判断(MOD)

自定义函数：CREATE FUNCTION

分页查询：LIMIT OFFSET

连续序列检测：自连接、窗口函数、CTE

取消率计算：条件统计与分组聚合（Hard难度）

树结构判断：CASE WHEN + 自连接/子查询（608题）

首次登录分析：MIN + DATE_ADD + 日期计算（550题）

双向数据合并：UNION ALL + 分组聚合（602题）

全量覆盖判断：HAVING + 子查询（1045题）

滑动窗口：RANGE BETWEEN + 日期范围（1321题）

行转列：CASE WHEN + MAX/SUM聚合（1179题）

时间范围统计：BETWEEN + DATE_SUB（1141题）

📝 Progress Timeline
🚀 2025-11-06: 项目初始化，完成175题

📚 2025-11-06: 建立完整项目结构

🎯 2025-11-08: 完成182、183题（重复数据检测）

🔥 2025-11-10: 掌握数据删除操作（196题）

📅 2025-11-12~18: 新增197、511、577、584、607题

💪 2025-12-14: 突破中等难度，完成176、178、180题，掌握窗口函数

🏆 2026-01-28: 批量完成6道中等题（177、184、185、570、626），巩固窗口函数、自连接、条件逻辑

⚡ 2026-01-30: 重大突破！完成首道Hard难度题目262，同时完成619题

🔥 2026-02-26: 再添3道新题！完成620(简单)、585(中等)、601(困难)，累计达24题

📝 2026-03-20: 新增550(中等)、608(中等)，累计达26题

📝 2026-03-22: 新增602(中等)、626(中等)、610(简单)，累计达29题

📝 2026-03-25: 新增1045(中等)、1321(中等)，累计达31题

📝 2026-03-27: 新增1393(中等)，累计达32题

📝 2026-04-06: 新增1179(中等)、1141(简单)，累计达34题

📝 2026-04-09: 新增1407(简单)，累计达35题

🌟 Recent Activity
bash
# 最新提交记录 (2026-04-09)
feat: add easy solution - 1407(Top Travellers)
feat: add easy solution - 1141(User Activity for the Past 30 Days)
feat: add medium solution - 1179(Reformat Department Table)
docs: update README with 35 completed solutions (14 easy, 20 medium, 2 hard)
代码改变思维，坚持成就卓越 • 挑战自我，突破极限 • 更新于2026年4月9日
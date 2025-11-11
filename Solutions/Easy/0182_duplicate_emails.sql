-- 182. Duplicate Emails (通过率 68%)
-- 找出所有重复的邮箱地址

-- ==================== 解法1：GROUP BY + HAVING（最优推荐） ====================
-- 优点：性能最好，逻辑清晰，标准写法
-- 思路：按邮箱分组，筛选出现次数>1的组
SELECT email as Email
FROM Person
GROUP BY email
HAVING COUNT(*) > 1;

-- ==================== 解法2：自连接 ====================
-- 优点：体现SQL思维灵活性
-- 思路：连接相同邮箱但不同ID的记录
SELECT DISTINCT p1.email as Email
FROM Person p1
JOIN Person p2 ON p1.email = p2.email
WHERE p1.id <> p2.id;

-- ==================== 学习总结 ====================
-- 1. GROUP BY + HAVING 是解决此类问题的标准方法，性能最优
-- 2. HAVING 用于过滤分组后的结果集
-- 3. 自连接体现了SQL的灵活思维，适合理解问题本质
-- 4. 窗口函数适合更复杂的分析场景

- 183. Customers Who Never Order (通过率 65%)
-- 找出从未下过订单的客户

-- ==================== 解法1：LEFT JOIN + IS NULL（最优推荐） ====================
-- 优点：性能优秀，标准写法
-- 思路：左连接保留所有客户，通过IS NULL找出没有订单的客户
SELECT c.name as Customers
FROM Customers c
LEFT JOIN Orders o ON c.id = o.customerId
WHERE o.id IS NULL;

-- ==================== 解法2：NOT EXISTS ====================
-- 优点：语义清晰，易于理解
-- 思路：使用NOT EXISTS检查不存在相关订单的客户
SELECT name as Customers
FROM Customers c
WHERE NOT EXISTS (
    SELECT 1 
    FROM Orders o 
    WHERE o.customerId = c.id
);

-- ==================== 解法3：子查询 + NOT IN ====================
-- 优点：逻辑直观
-- 思路：找出所有有订单的客户ID，然后选择不在这个列表中的客户
SELECT name as Customers
FROM Customers
WHERE id NOT IN (
    SELECT customerId 
    FROM Orders
    WHERE customerId IS NOT NULL  -- 防止NULL值问题
);

-- ==================== 学习总结 ====================
-- 1. LEFT JOIN + IS NULL 是解决"不存在关系"问题的经典模式，性能最佳
-- 2. NOT EXISTS 语义清晰，适合复杂的判断条件
-- 3. NOT IN 写法直观，但需要注意NULL值处理
-- 4. 关键理解：LEFT JOIN会保留左表所有记录，右表无匹配时显示NULL
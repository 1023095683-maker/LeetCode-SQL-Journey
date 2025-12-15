# LeetCode SQL Journey

[![GitHub](https://img.shields.io/badge/GitHub-Repository-blue?logo=github)](https://github.com/1023095683-maker/LeetCode-SQL-Journey)
[![SQL](https://img.shields.io/badge/SQL-Practice-orange?logo=mysql)](https://leetcode.com/)

> 通过LeetCode系统学习SQL - 从基础到专家

## 📊 Progress Overview

| Difficulty | Total | Solved | Progress |
|------------|-------|--------|----------|
| Easy | 50 | 11 | 22% |
| Medium | 150 | 3 | 2% |
| Hard | 30 | 0 | 0% |

## 🎯 Learning Path

### ✅ Completed
- **175**. Combine Two Tables - LEFT JOIN基础
- **181**. Employees Earning More Than Their Managers - 自连接应用
- **182**. Duplicate Emails - 分组过滤
- **183**. Customers Who Never Order - 空值检测
- **196**. Delete Duplicate Emails - 数据删除
- **197**. Rising Temperature - 日期函数
- **511**. Game Play Analysis I - 分组聚合
- **584**. Find Customer Referee - NULL值处理
- **577**. Employee Bonus - LEFT JOIN条件
- **607**. Sales Person - NOT EXISTS应用
- **176**. Second Highest Salary - 子查询与分页
- **178**. Rank Scores - 窗口函数排名
- **180**. Consecutive Numbers - 连续序列检测

### 🔄 In Progress
- 深入理解JOIN操作
- 学习查询性能优化
- 掌握窗口函数高级应用
- 复杂业务逻辑实现

## 📁 Project Structure

```
LeetCode-SQL-Journey/
├── Solutions/           # 题解目录
│   ├── Easy/           # 简单难度（0-30分钟）
│   │   ├── 0175_combine_two_tables.sql
│   │   ├── 0181_employees_earning_more_than_managers.sql
│   │   ├── 0182_duplicate_emails.sql
│   │   ├── 0183_customers_who_never_order.sql
│   │   ├── 0196_delete_duplicate_emails.sql
│   │   ├── 0197_rising_temperature.sql
│   │   ├── 0511_game_play_analysis_i.sql
│   │   ├── 0577_employee_bonus.sql
│   │   ├── 0584_find_customer_referee.sql
│   │   └── 0607_sales_person.sql
│   ├── Medium/         # 中等难度（30-60分钟）
│   │   ├── 0176_second_highest_salary.sql
│   │   ├── 0178_rank_scores.sql
│   │   └── 0180_consecutive_numbers.sql
│   └── Hard/           # 困难难度（60+分钟）
├── Study-Notes/        # 学习笔记和总结
├── Progress/           # 进度追踪
└── README.md          # 项目说明
```

## 💡 SQL核心知识点

### NULL值处理的正确方式

**重要区别：`IS NULL` vs `= NULL`**

```sql
-- ✅ 正确写法：使用 IS NULL
SELECT name FROM Customer WHERE referee_id IS NULL;

-- ❌ 错误写法：使用 = NULL  
SELECT name FROM Customer WHERE referee_id = NULL;
```

**为什么不能用 `= NULL`？**
- SQL使用三值逻辑：`TRUE`, `FALSE`, `UNKNOWN`
- 任何与 `NULL` 的比较都返回 `UNKNOWN`
- `WHERE` 条件只接受 `TRUE`，`UNKNOWN` 被当作 `FALSE` 处理
- 所以 `= NULL` 永远不会匹配到任何记录

**记忆口诀：**
- 检查NULL：`IS NULL` / `IS NOT NULL`
- 检查具体值：`= value` / `<> value`
- 两者永不混用！

### 窗口函数核心总结

#### 基本语法结构
```
函数名() OVER (PARTITION BY 分组字段 ORDER BY 排序字段)
```

#### `OVER()` 子句详解
**`OVER()` 定义"计算窗口"** - 告诉SQL在哪部分数据上执行计算：

| `OVER()` 配置 | 作用 | 类比 |
|--------------|------|------|
| **`OVER()`** | 在整个表上计算 | 无分组，全体排名 |
| **`OVER (ORDER BY 列)`** | 在排序后的序列上计算 | 按顺序"滑动窗口" |
| **`OVER (PARTITION BY 列)`** | 在每个分组内计算 | 分组但不合并行 |
| **`OVER (PARTITION BY ... ORDER BY ...)`** | 分组内按顺序计算 | 最完整的窗口定义 |

#### 常用排名函数对比
| 函数 | 相同分数处理 | 排名是否连续 | 示例：分数 [100, 100, 90] |
|------|-------------|-------------|--------------------------|
| **`DENSE_RANK()`** | 相同排名 | ✅ **连续** | 1, 1, 2 |
| **`RANK()`** | 相同排名 | ❌ **不连续**（跳过） | 1, 1, 3 |
| **`ROW_NUMBER()`** | 不同排名 | ✅ **连续** | 1, 2, 3 |

#### 178题窗口函数示例
```sql
-- 分数排名：相同分数相同排名，且排名连续
SELECT 
    score,
    DENSE_RANK() OVER (ORDER BY score DESC) AS `rank`
FROM Scores;
```

#### 180题窗口函数解法
```sql
-- 使用LAG()检测连续相同数字
SELECT DISTINCT num AS ConsecutiveNums
FROM (
    SELECT num,
           LAG(num, 1) OVER (ORDER BY id) AS prev1,
           LAG(num, 2) OVER (ORDER BY id) AS prev2
    FROM Logs
) t
WHERE num = prev1 AND num = prev2;
```

#### 核心特点
- **保持原行数**：不像`GROUP BY`会合并行，为每行添加计算列
- **灵活定义窗口**：`PARTITION BY`分组，`ORDER BY`排序
- **应用场景**：排名、累计计算、移动平均、前后行比较、分组分析等

## 🔧 核心技术点
- **JOIN操作**：INNER JOIN, LEFT JOIN, 自连接
- **数据过滤**：WHERE, HAVING, 子查询
- **数据操作**：DELETE, 重复数据处理
- **聚合函数**：COUNT, MIN, 分组统计
- **NULL值处理**：IS NULL vs = NULL 的区别
- **日期函数**：DATE_SUB, DATE_ADD, DATEDIFF
- **存在性检查**：EXISTS, NOT EXISTS
- **窗口函数**：DENSE_RANK, RANK, ROW_NUMBER, LAG, LEAD
- **分页查询**：LIMIT OFFSET
- **连续序列检测**：自连接与窗口函数

## 📝 Progress Timeline

- 🚀 **2025-11-06**: 项目初始化，完成175题
- 📚 **2025-11-06**: 建立完整项目结构
- 🎯 **2025-11-08**: 完成182、183题（重复数据检测）
- 🔥 **2025-11-10**: 掌握数据删除操作（196题）
- 📅 **2025-11-12~18**: 新增197、511、577、584、607题
- 💪 **2025-12-14**: 突破中等难度，完成176、178、180题，掌握窗口函数

## 🌟 Recent Activity

```bash
# 最近提交记录
feat: add medium solutions for 176, 178, 180 with window functions
feat: add solutions for 511, 584, 577, 607
feat: add solution for 197. Rising Temperature
```

---

*代码改变思维，坚持成就卓越* • *每日进步，持续成长*
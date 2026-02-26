# LeetCode SQL Journey

[![GitHub](https://img.shields.io/badge/GitHub-Repository-blue?logo=github)](https://github.com/1023095683-maker/LeetCode-SQL-Journey)
[![SQL](https://img.shields.io/badge/SQL-Practice-orange?logo=mysql)](https://leetcode.com/)

> 通过LeetCode系统学习SQL - 从基础到专家

## 📊 Progress Overview

| Difficulty | Total | Solved | Progress |
|------------|-------|--------|----------|
| Easy | 50 | 11 | 22% |
| Medium | 150 | 11 | 7% |
| Hard | 30 | 2 | 7% |

## 🎯 Learning Path

### ✅ Completed

**🔹 Easy (11题)**
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
- **620**. Not Boring Movies - 多条件过滤

**🔹 Medium (11题)**
- **176**. Second Highest Salary - LIMIT OFFSET
- **177**. Nth Highest Salary - 自定义函数
- **178**. Rank Scores - 窗口函数(DENSE_RANK)
- **180**. Consecutive Numbers - 窗口函数(LAG)/自连接
- **184**. Department Highest Salary - JOIN/子查询
- **185**. Department Top Three Salaries - 窗口函数实战
- **570**. Managers with at Least 5 Direct Reports - 自连接进阶
- **585**. Investments in 2016 - 复杂条件聚合
- **619**. Biggest Single Number - GROUP BY/HAVING
- **626**. Exchange Seats - CASE WHEN/奇偶判断

**🔹 Hard (2题) 🎉**
- **262**. Trips and Users - 取消率计算/复杂业务逻辑
- **601**. Human Traffic of Stadium - 窗口函数/连续检测(CTE)

### 🔄 In Progress
- 深入学习窗口函数高级应用
- 掌握复杂业务逻辑实现
- 学习查询性能优化技巧
- 继续挑战Hard难度题目

## 📁 Project Structure

```
LeetCode-SQL-Journey/
├── Solutions/           # 题解目录
│   ├── Easy/           # 简单难度
│   │   ├── 0175_combine_two_tables.sql
│   │   ├── 0181_employees_earning_more_than_managers.sql
│   │   ├── 0182_duplicate_emails.sql
│   │   ├── 0183_customers_who_never_order.sql
│   │   ├── 0196_delete_duplicate_emails.sql
│   │   ├── 0197_rising_temperature.sql
│   │   ├── 0511_game_play_analysis_i.sql
│   │   ├── 0577_employee_bonus.sql
│   │   ├── 0584_find_customer_referee.sql
│   │   ├── 0607_sales_person.sql
│   │   └── 0620_not_boring_movies.sql          # 新增
│   ├── Medium/         # 中等难度
│   │   ├── 0176_second_highest_salary.sql
│   │   ├── 0177_nth_highest_salary.sql
│   │   ├── 0178_rank_scores.sql
│   │   ├── 0180_consecutive_numbers.sql
│   │   ├── 0184_department_highest_salary.sql
│   │   ├── 0185_department_top_three_salaries.sql
│   │   ├── 0570_managers_with_5_direct_reports.sql
│   │   ├── 0585_investments_in_2016.sql        # 新增
│   │   ├── 0619_biggest_single_number.sql
│   │   └── 0626_exchange_seats.sql
│   └── Hard/           # 困难难度
│       ├── 0262_trips_and_users.sql
│       └── 0601_human_traffic_of_stadium.sql   # 新增
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

#### 连续序列检测技巧
```sql
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
```

#### 核心特点
- **保持原行数**：不像`GROUP BY`会合并行，为每行添加计算列
- **灵活定义窗口**：`PARTITION BY`分组，`ORDER BY`排序
- **应用场景**：排名、累计计算、移动平均、前后行比较、分组分析、连续序列检测

## 🔧 核心技术点
- **JOIN操作**：INNER JOIN, LEFT JOIN, 自连接
- **数据过滤**：WHERE, HAVING, 子查询
- **窗口函数**：DENSE_RANK, RANK, ROW_NUMBER, LAG, LEAD
- **NULL值处理**：IS NULL vs = NULL 的区别
- **聚合函数**：COUNT, MIN, MAX, GROUP BY, 分组统计
- **条件逻辑**：CASE WHEN, IF函数，IN操作符，奇偶判断(MOD)
- **自定义函数**：CREATE FUNCTION
- **分页查询**：LIMIT OFFSET
- **连续序列检测**：自连接、窗口函数、CTE
- **取消率计算**：条件统计与分组聚合（Hard难度）

## 📝 Progress Timeline

- 🚀 **2025-11-06**: 项目初始化，完成175题
- 📚 **2025-11-06**: 建立完整项目结构
- 🎯 **2025-11-08**: 完成182、183题（重复数据检测）
- 🔥 **2025-11-10**: 掌握数据删除操作（196题）
- 📅 **2025-11-12~18**: 新增197、511、577、584、607题
- 💪 **2025-12-14**: 突破中等难度，完成176、178、180题，掌握窗口函数
- 🏆 **2026-01-28**: 批量完成6道中等题（177、184、185、570、626），巩固窗口函数、自连接、条件逻辑
- ⚡ **2026-01-30**: 重大突破！完成首道Hard难度题目262，同时完成619题
- 🔥 **2026-02-26**: 再添3道新题！完成620(简单)、585(中等)、601(困难)，累计达24题

## 🌟 Recent Activity

```bash
# 最新提交记录 (2026-02-26)
feat: add hard solution - 601(Human Traffic of Stadium)
feat: add medium solution - 585(Investments in 2016)
feat: add easy solution - 620(Not Boring Movies)
docs: update README with 24 completed solutions
```

---

*代码改变思维，坚持成就卓越* • *挑战自我，突破极限*
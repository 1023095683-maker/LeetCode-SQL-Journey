## LeetCode SQL Journey

[![GitHub](https://img.shields.io/badge/GitHub-Repository-blue?logo=github)](https://github.com/1023095683-maker/LeetCode-SQL-Journey)
[![SQL](https://img.shields.io/badge/SQL-Practice-orange?logo=mysql)](https://leetcode.com/)

> 通过LeetCode系统学习SQL - 从基础到专家

## 📊 Progress Overview

| Difficulty | Total | Solved | Progress |
|------------|-------|--------|----------|
| Easy | 50 | 11 | 22% |
| Medium | 150 | 0 | 0% |
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

### 🔄 In Progress
- 深入理解JOIN操作
- 学习查询性能优化
- 掌握数据操作语句
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

## 🔧 核心技术点
- **JOIN操作**：INNER JOIN, LEFT JOIN, 自连接
- **数据过滤**：WHERE, HAVING, 子查询
- **数据操作**：DELETE, 重复数据处理
- **聚合函数**：COUNT, MIN, 分组统计
- **NULL值处理**：IS NULL vs = NULL 的区别
- **日期函数**：DATE_SUB, DATE_ADD, DATEDIFF
- **存在性检查**：EXISTS, NOT EXISTS

## 📝 Progress Timeline

- 🚀 **2025-11-06**: 项目初始化，完成175题
- 📚 **2025-11-06**: 建立完整项目结构
- 🎯 **2025-11-08**: 完成182、183题（重复数据检测）
- 🔥 **2025-11-10**: 掌握数据删除操作（196题）
- 📅 **2025-11-12~18**: 新增197、511、577、584、607题

## 🌟 Recent Activity

```bash
# 最近提交记录
feat: add solutions for 511, 584, 577, 607
feat: add solution for 197. Rising Temperature
feat: add solutions for 182, 183, 196 and update README
```

---

*代码改变思维，坚持成就卓越* • *每日进步，持续成长*
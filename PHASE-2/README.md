# 🚀 PHASE-2 – SQL to PySpark Bridge

> **Transforming SQL knowledge into real-world PySpark skills!** 💡⚡

This phase focuses on bridging the gap between **SQL** and **PySpark** by solving common data engineering problems using both approaches. Every exercise is first solved in **SQL** and then translated into **PySpark**, making it easier to understand how SQL operations map to Spark DataFrame transformations.

---

## 📂 Project Structure

```text
PHASE-2/
│
├── 📁 Outputs/
│
├── 🐍 Pyspark_phase-2.py
│
├── 🗄️ SQL_phase-2.sql
│
├── 📄 pyspark_sql_pretraining_phase2_revised_bridge_pack.pdf
│
└── 📘 README.md
```

---

# 🎯 Objective

The primary objective of this phase is to:

- 🔹 Bridge SQL concepts with PySpark
- 🔹 Learn DataFrame transformations
- 🔹 Perform data cleaning
- 🔹 Work with joins and aggregations
- 🔹 Build confidence in solving real-world data engineering tasks

---

# 📁 Files Overview

## 🐍 `Pyspark_phase-2.py`

Contains complete PySpark solutions covering:

- 📥 Reading CSV files
- 🧹 Data Cleaning
- 🔄 Data Type Conversion
- 🤝 Joins
- 📊 Aggregations
- 🔍 Filtering
- 📈 Sorting
- 📦 GroupBy Operations

---

## 🗄️ `SQL_phase-2.sql`

Contains SQL solutions for all exercises.

Each problem is solved using SQL before implementing the equivalent PySpark solution.

---

## 📄 `pyspark_sql_pretraining_phase2_revised_bridge_pack.pdf`

Reference material provided for this phase.

Includes:

- 📚 Learning objectives
- 📂 Dataset details
- 📝 Guided exercises
- 🔄 SQL ↔ PySpark mapping

---

## 📁 `Outputs/`

Contains:

- ✅ Execution screenshots
- ✅ Result outputs
- ✅ Validation of completed exercises

---

# 📊 Dataset Used

Two sample datasets from Spark Playground:

- 👥 **customers.csv**
- 💰 **sales.csv**

---

# 🧹 Data Cleaning Performed

Before solving the exercises:

- ✅ Removed rows with missing `customer_id`
- ✅ Converted `total_amount` from **String** to **Double**

---

# ✅ Exercises Completed

| No. | Exercise |
|------|----------|
| ✅ 1 | Total order amount for each customer |
| ✅ 2 | Top 3 customers by total spend |
| ✅ 3 | Customers with no orders |
| ✅ 4 | City-wise total revenue |
| ✅ 5 | Average order amount per customer |
| ✅ 6 | Customers with more than one order |
| ✅ 7 | Sort customers by total spend (Descending) |

---

# 💻 SQL Concepts Practiced

- SELECT
- WHERE
- GROUP BY
- HAVING
- ORDER BY
- LIMIT
- INNER JOIN
- LEFT JOIN
- Aggregate Functions
  - SUM()
  - AVG()
  - COUNT()
- CONCAT()

---

# ⚡ PySpark Concepts Practiced

- SparkSession
- DataFrame
- `read.csv()`
- `show()`
- `printSchema()`
- `dropna()`
- `withColumn()`
- `cast()`
- `groupBy()`
- `agg()`
- `sum()`
- `avg()`
- `count()`
- `join()`
- `filter()`
- `orderBy()`
- `limit()`
- `concat_ws()`
- `alias()`
- `col()`

---

# 🔄 SQL → PySpark Mapping

| SQL | PySpark |
|------|----------|
| SELECT | `select()` |
| WHERE | `filter()` |
| GROUP BY | `groupBy()` |
| HAVING | `filter()` after `agg()` |
| ORDER BY | `orderBy()` |
| LIMIT | `limit()` |
| JOIN | `join()` |
| SUM() | `sum()` |
| AVG() | `avg()` |
| COUNT() | `count()` |
| CONCAT() | `concat_ws()` |

---

# 🌟 Key Learning Outcomes

After completing this phase, I can:

✨ Translate SQL queries into PySpark transformations.

✨ Perform data cleaning on Spark DataFrames.

✨ Use joins to combine multiple datasets.

✨ Apply aggregation functions efficiently.

✨ Analyze customer sales data using SQL and PySpark.

✨ Understand how SQL operations map to Spark APIs.

✨ Build a stronger foundation for Data Engineering and Apache Spark.

---

# 🛠️ Technologies Used

- 🐍 Python
- ⚡ PySpark
- 🗄️ SQL
- 🔥 Apache Spark
- 💻 VS Code

---

# 🎓 Outcome

This phase strengthened my understanding of how traditional SQL queries translate into distributed data processing using PySpark. It serves as a solid foundation for more advanced Spark topics such as window functions, optimization techniques, and large-scale data engineering workflows.

---

# 👩‍💻 Author

**Vyshnavi Kamireddy**

⭐ *Learning Data Engineering one phase at a time!*
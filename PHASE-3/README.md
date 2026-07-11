# 🚀 PHASE-3 – Final ETL & Pipeline Practice

> **From writing queries to building complete ETL pipelines with PySpark!** ⚡📊

This phase focuses on implementing a complete **ETL (Extract, Transform, Load)** workflow using **PySpark** and **SQL**. The exercises simulate real-world data engineering tasks such as data ingestion, cleaning, filtering, transformations, aggregations, joins, and reporting.

---

# 📂 Project Structure

```text
PHASE-3/
│
├── 📁 Outputs/
│
├── 🐍 Pyspark_phase-3.py
│
├── 🗄️ SQL_phase-3.sql
│
├── 📄 pyspark_sql_phase3_final_etl_pipeline_practice_pack.pdf
│
└── 📘 README.md
```

---

# 🎯 Objective

The goal of this phase is to move beyond individual SQL queries and start thinking like a **Data Engineer** by building reusable ETL pipelines.

Key objectives include:

- 📥 Reading data from multiple file formats
- 🧹 Cleaning and validating datasets
- 🔄 Transforming raw data into meaningful insights
- 🤝 Joining multiple datasets
- 📊 Performing aggregations and analytics
- 📋 Building reporting tables
- ⚡ Understanding the complete ETL workflow

---

# 🔄 ETL Workflow

Every exercise follows the standard ETL process:

```text
📥 Extract
      ↓
🧹 Transform
      ↓
📤 Load
```

### 📥 Extract

- Read CSV files
- Read JSON files
- Read Parquet files

### 🧹 Transform

- Handle missing values
- Clean invalid records
- Filter data
- Join datasets
- Aggregate data
- Create reporting tables

### 📤 Load

- Display final results
- Generate reports
- Prepare transformed datasets for analytics

---

# 📁 Files Overview

## 🐍 `Pyspark_phase-3.py`

Contains the complete PySpark implementation of the ETL workflow.

Topics covered include:

- SparkSession
- Reading CSV, JSON & Parquet files
- Schema inspection
- Handling null values
- Data cleaning
- Filtering invalid records
- Aggregations
- Joins
- Window Functions
- Final reporting pipeline

---

## 🗄️ `SQL_phase-3.sql`

Contains SQL solutions corresponding to every business problem.

Each task is solved in SQL before being translated into PySpark.

---

## 📄 `pyspark_sql_phase3_final_etl_pipeline_practice_pack.pdf`

Reference material provided for this phase.

Includes:

- Learning objectives
- ETL concepts
- Guided exercises
- Business pipeline scenarios
- Final challenge

---

## 📁 `Outputs/`

Contains:

- ✅ Execution screenshots
- ✅ Query results
- ✅ Pipeline outputs
- ✅ Validation results

---

# 📊 Datasets Used

Sample datasets from Spark Playground:

- 👥 `customers.csv`
- 💰 `sales.csv`
- 📄 `sample.json`
- 📦 `sample.parquet`

---

# 🧹 Data Cleaning Performed

Before processing the data:

- ✅ Removed records with missing `customer_id`
- ✅ Converted `total_amount` from **String** to **Double**
- ✅ Filtered invalid sales records
- ✅ Checked datasets for missing values

---

# ✅ Hands-on Ingestion Tasks Completed

| ✔ | Task |
|---|------|
| ✅ | Read CSV files |
| ✅ | Inspect DataFrames using `show()` |
| ✅ | Inspect schema using `printSchema()` |
| ✅ | Identify missing values |
| ✅ | Clean data using `dropna()` |
| ✅ | Filter invalid records |
| ✅ | Read JSON files |
| ✅ | Read Parquet files |

---

# 📈 Business Pipeline Exercises Completed

| ✔ | Exercise |
|---|-----------|
| ✅ | Daily sales calculation |
| ✅ | City-wise revenue |
| ✅ | Repeat customers (>2 orders) |
| ✅ | Highest spending customer in each city |
| ✅ | Final customer reporting table |

---

# 💻 SQL Concepts Practiced

- SELECT
- WHERE
- GROUP BY
- HAVING
- ORDER BY
- INNER JOIN
- LEFT JOIN
- Aggregate Functions
- Window Functions
- ROW_NUMBER()
- CONCAT()

---

# ⚡ PySpark Concepts Practiced

- SparkSession
- DataFrames
- CSV Reader
- JSON Reader
- Parquet Reader
- show()
- printSchema()
- dropna()
- fillna()
- filter()
- withColumn()
- cast()
- groupBy()
- agg()
- sum()
- avg()
- count()
- join()
- concat_ws()
- alias()
- orderBy()
- Window Functions
- row_number()

---

# 🔄 SQL → PySpark Mapping

| SQL | PySpark |
|------|----------|
| SELECT | `select()` |
| WHERE | `filter()` |
| GROUP BY | `groupBy()` |
| HAVING | `filter()` after `agg()` |
| ORDER BY | `orderBy()` |
| JOIN | `join()` |
| SUM() | `sum()` |
| AVG() | `avg()` |
| COUNT() | `count()` |
| CONCAT() | `concat_ws()` |
| ROW_NUMBER() | `row_number().over(Window)` |

---

# 🌟 Skills Gained

After completing this phase, I can:

✨ Build end-to-end ETL pipelines using PySpark.

✨ Read data from multiple file formats.

✨ Clean and validate real-world datasets.

✨ Perform advanced joins and aggregations.

✨ Use Window Functions for analytical problems.

✨ Create reusable reporting pipelines.

✨ Translate SQL queries into PySpark transformations.

✨ Apply Data Engineering concepts to structured datasets.

---

# 🛠️ Technologies Used

- 🐍 Python
- ⚡ PySpark
- 🔥 Apache Spark
- 🗄️ SQL
- 💻 VS Code

---

# 🎯 Learning Outcome

This phase strengthened my understanding of the **ETL lifecycle** and demonstrated how raw data can be transformed into meaningful business insights using **PySpark**. It also reinforced the relationship between SQL and Spark DataFrame APIs while introducing pipeline thinking and reusable workflows.

---

# 👩‍💻 Author

**Vyshnavi Kamireddy**

⭐ *Building scalable data pipelines, one phase at a time!*
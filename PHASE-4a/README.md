# 🚀 PHASE-4A – Bucketing & Segmentation in PySpark

> **Transforming continuous data into meaningful customer segments using PySpark!** 📊✨

This phase focuses on understanding **Bucketing** and **Customer Segmentation**, two important concepts in data engineering and business analytics. Various segmentation techniques are implemented using **PySpark** and **SQL** to categorize customers based on their spending behavior and compare different approaches.

---

# 📂 Project Structure

```text
PHASE-4A/
│
├── 📁 Outputs/
│
├── 🐍 Pyspark_phase-4A.py
│
├── 🗄️ SQL_phase-4A.sql
│
├── 📄 phase4A_bucketing_segmentation.pdf
│
├── 📘 README.md
│
└── 📝 Reflection_Answers.md
```

---

# 🎯 Project Objective

The objective of this phase is to learn how continuous numerical values can be converted into meaningful business categories using different bucketing and segmentation techniques.

This project covers:

- 📥 Data Preparation
- 🧹 Data Cleaning
- 💰 Customer Spend Calculation
- 🥇 Customer Segmentation
- 📊 Customer Distribution Analysis
- 📈 Quantile-Based Segmentation
- 🪣 MLlib Bucketizer
- 🏆 Window-Based Ranking

---

# 📊 Dataset Used

The project uses sample datasets provided by Spark Playground.

### 👥 customers.csv

Contains customer information such as:

- Customer ID
- First Name
- Last Name
- City

### 💰 sales.csv

Contains sales transaction details such as:

- Customer ID
- Order Date
- Total Amount

---

# 🧹 Data Cleaning Performed

Before performing segmentation, the following preprocessing steps were applied:

- ✅ Removed rows with missing `customer_id`
- ✅ Removed duplicate records
- ✅ Converted `total_amount` from String to Double
- ✅ Filtered records with invalid (negative) sales values

---

# 📈 Practice Tasks Completed

## ✅ Task 1 – Customer Segmentation (Conditional Logic)

Created Gold, Silver, and Bronze customer segments using `when()` and `otherwise()` functions.

### Business Rules

| Segment | Condition |
|----------|-----------|
| 🥇 Gold | Total Spend > 10000 |
| 🥈 Silver | Total Spend between 5000 and 10000 |
| 🥉 Bronze | Total Spend < 5000 |

---

## ✅ Task 2 – Customer Count by Segment

Grouped customers by segment and counted the number of customers in each category.

**Output**

- Segment
- Customer Count

---

## ✅ Task 3 – Quantile-Based Segmentation

Used `approxQuantile()` to divide customers into balanced groups based on their spending distribution.

---

## ✅ Task 4 – Bucketizer (MLlib)

Applied the **Bucketizer** class from Spark MLlib to convert continuous spending values into predefined buckets.

---

## ✅ Task 5 – Window-Based Ranking

Used the `percent_rank()` window function to rank customers according to their total spending.

---

# 🪣 Bucketing Methods Implemented

| Method | Description |
|----------|-------------|
| ✅ Conditional Logic | Uses `when()` and `otherwise()` to assign categories |
| ✅ SQL CASE Statement | Creates categories using SQL conditions |
| ✅ Bucketizer | Uses Spark MLlib for predefined numeric buckets |
| ✅ Quantile Segmentation | Divides data based on percentiles |
| ✅ Window Ranking | Ranks customers using `percent_rank()` |

---

# 💻 SQL Concepts Practiced

- SELECT
- GROUP BY
- CASE
- Aggregate Functions
- SUM()
- COUNT()
- CONCAT()

---

# ⚡ PySpark Concepts Practiced

- SparkSession
- DataFrames
- CSV Reader
- dropna()
- dropDuplicates()
- filter()
- withColumn()
- cast()
- groupBy()
- agg()
- sum()
- count()
- when()
- otherwise()
- concat_ws()
- approxQuantile()
- Bucketizer (MLlib)
- Window Functions
- percent_rank()

---

# 🔄 SQL to PySpark Mapping

| SQL | PySpark |
|------|----------|
| SELECT | `select()` |
| GROUP BY | `groupBy()` |
| CASE | `when().otherwise()` |
| SUM() | `sum()` |
| COUNT() | `count()` |
| CONCAT() | `concat_ws()` |
| Percentile | `approxQuantile()` |
| Ranking | `percent_rank().over(Window)` |

---

# 🌟 Skills Gained

By completing this phase, I learned how to:

- ✅ Categorize continuous numerical data into business-friendly segments
- ✅ Apply multiple bucketing techniques in PySpark
- ✅ Compare fixed-rule and quantile-based segmentation
- ✅ Use Spark MLlib's Bucketizer for feature engineering
- ✅ Apply Window Functions for ranking customers
- ✅ Analyze customer spending patterns for business insights

---

# 🛠️ Technologies Used

- 🐍 Python
- ⚡ PySpark
- 🔥 Apache Spark
- 🗄️ SQL
- 💻 VS Code

---

# 🎓 Learning Outcome

This phase strengthened my understanding of customer segmentation and bucketing techniques used in real-world analytics. I learned how different methods, such as conditional logic, SQL CASE statements, Bucketizer, quantile-based segmentation, and window functions, can be used to categorize customers and support business decision-making.

---

# 👩‍💻 Author

**Vyshnavi Kamireddy**

⭐ *Learning PySpark by transforming raw data into meaningful business insights through segmentation and analytics!*
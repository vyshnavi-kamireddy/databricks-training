# 📊 Week 4 • Day 4 | PySpark Optimization, Null Handling & RDD Transformations

> *Practicing advanced PySpark techniques including performance optimization, null handling, partition management, and core RDD transformations.*

---

## 🎯 Objective

Develop a deeper understanding of PySpark performance optimization, null value handling, partition management, caching, and foundational RDD transformations used in large-scale data processing.

---

## 📂 Files Included

| File | Description |
|------|-------------|
| `PySpark_DF_Practice_Ass-7.txt` | PySpark practice covering repartitioning, caching, null handling, replacement operations, and DataFrame optimizations. |
| `PySpark_DF_Practice_Ass-8.txt` | Advanced PySpark practice covering RDD transformations including Map, FlatMap, and ReduceByKey operations. |

---

## 🚀 What I Implemented

### 🔹 Partition Management
- Repartitioned DataFrames
- Reduced partitions using `coalesce()`
- Compared `repartition()` and `coalesce()`
- Optimized output file generation

### 🔹 Performance Optimization
- Cached DataFrames using `cache()`
- Compared execution before and after caching
- Released memory using `unpersist()`

### 🔹 Null Value Handling
- Filled missing values using `fillna()` and `na.fill()`
- Removed missing records using `na.drop()`
- Replaced nulls with default and calculated values

### 🔹 Data Cleaning
- Replaced values using `replace()`
- Standardized city, department, and gender values

### 🔹 RDD Transformations
- Applied `map()` transformations
- Flattened collections using `flatMap()`
- Aggregated data using `reduceByKey()`
- Built employee summaries and department-level aggregations

---

## 🛠️ Topics Covered

`repartition()` • `coalesce()` • `cache()` • `unpersist()` • `fillna()` • `na.fill()` • `na.drop()` • `replace()` • `map()` • `flatMap()` • `reduceByKey()`

---

## 🎯 Outcome

✔ Learned DataFrame partition optimization techniques.

✔ Improved performance using caching strategies.

✔ Practiced handling missing data efficiently.

✔ Strengthened understanding of core RDD transformations.

✔ Built a strong foundation for scalable distributed data processing in PySpark.

---

⭐ **Progress:** Expanded PySpark expertise by combining DataFrame optimization techniques with RDD-based transformations for efficient big data processing.

# 📊 Week 5 • Day 5 | E-Commerce Orders Analysis – PySpark Assignment (Section 1)

> *Built an E-Commerce Orders Analysis solution using PySpark DataFrame transformations by creating datasets, performing data cleaning, column transformations, filtering, and business-oriented data preparation.*

---

## 🎯 Objective

Create an E-Commerce Orders Analysis dataset and implement fundamental PySpark DataFrame transformations to prepare transactional data for reporting and analytics.

---

## 📂 Files Included

| File | Description |
|------|-------------|
| `Databricksassignment.txt` | Complete assignment containing the dataset and all assignment questions. |
| `DBAssignment-Starter-file.txt` | Starter file with sample datasets and assignment setup. |
| `DBASS-Section-1.txt` | Solutions for Section 1 covering basic DataFrame transformations. |

---

## 🚀 What I Implemented

### 🔹 Dataset Creation
- Created Orders DataFrame
- Created Customers DataFrame
- Loaded structured sample business data into PySpark DataFrames

### 🔹 Basic DataFrame Transformations
- Selected required columns
- Renamed DataFrame columns
- Created calculated columns using `withColumn()`
- Calculated total order amount
- Added business discount columns using conditional logic

### 🔹 Data Cleaning & Formatting
- Converted order dates into `DateType`
- Removed unnecessary columns
- Created uppercase category values
- Prepared data for further analysis

### 🔹 Data Filtering
- Filtered orders by city
- Retrieved Electronics category orders
- Filtered records based on quantity
- Extracted business-specific subsets of data

---

## 🛠️ Topics Covered

`SparkSession` • `createDataFrame()` • `select()` • `withColumn()` • `withColumnRenamed()` • `when()` • `filter()` • `drop()` • `cast()` • `upper()` • `DateType`

---

## 🎯 Outcome

✔ Created structured Orders and Customers DataFrames.

✔ Applied core PySpark DataFrame transformation techniques.

✔ Implemented conditional business logic using `when()`.

✔ Prepared transactional data for advanced analytics in upcoming assignment sections.

---

⭐ **Progress:** Successfully completed Section 1 of the E-Commerce Orders Analysis assignment by building DataFrames and implementing essential PySpark transformations for real-world data processing.

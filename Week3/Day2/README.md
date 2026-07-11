# 📊 Week 3 • Day 2 | SQL NULL Functions – Advanced Scenarios

> *Exploring advanced SQL NULL handling techniques using COALESCE() and NULLIF() to build reliable and production-ready queries.*

---

# 🎯 Objective

Strengthen SQL skills by learning advanced NULL handling functions such as `COALESCE()` and `NULLIF()`, and apply them to solve practical business scenarios involving missing data, default values, calculations, and error prevention.

---

# 📂 Files Included

| File | Description |
|------|-------------|
| `Null_Functions_Ass.sql` | SQL practice covering `COALESCE()`, `NULLIF()`, NULL-based calculations, and real-world NULL handling scenarios. |

---

# 🚀 What I Implemented

### 🔹 Working with COALESCE()
- Retrieved the first available value from multiple columns
- Used fallback values for missing employee salaries and bonuses
- Assigned default prices to products with missing values
- Calculated customer payments using available amount or discount values

### 🔹 Using NULLIF()
- Converted specific values to NULL using `NULLIF()`
- Prevented divide-by-zero errors in SQL calculations
- Replaced specific coupon codes with NULL
- Cleaned and standardized data using conditional NULL conversion

### 🔹 Real-Time NULL Handling
- Calculated total employee earnings while handling missing salaries and bonuses
- Identified employees with both salary and bonus missing
- Retrieved products with missing prices but valid categories
- Filtered orders where both amount and discount were unavailable

### 🔹 Advanced SQL Scenarios
- Generated employee income using multiple fallback values
- Calculated payable order amounts while handling NULL discounts
- Identified employees with missing salaries but assigned managers
- Applied NULL handling techniques to improve query reliability

---

# 🛠️ Topics Covered

`COALESCE()` • `NULLIF()` • NULL Handling • Default Values • Error Prevention • Data Cleaning • Conditional Calculations • Business Scenarios

---

# 🎯 Outcome

✔ Learned how to retrieve the first available value using `COALESCE()`.

✔ Used `NULLIF()` to simplify data cleaning and prevent runtime errors.

✔ Applied NULL handling techniques in real-world business queries.

✔ Improved the reliability and readability of SQL queries involving incomplete data.

---

⭐ **Progress:** Completed Day 2 by mastering advanced SQL NULL functions and applying them to practical scenarios involving data cleaning, calculations, and robust query development.

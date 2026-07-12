# 📝 Reflection Answers

## 1️⃣ Why is cleaning done before joining tables?

Data cleaning is performed before joining tables to ensure that only valid and consistent data is used. Removing null values, duplicate records, and invalid entries prevents incorrect matches, improves data quality, and produces accurate analytical results.

---

## 2️⃣ What would go wrong if null keys are not removed?

If rows with null keys (such as `customer_id`) are not removed, the join operation may fail to match records correctly. This can lead to missing data, inaccurate calculations, duplicate results, or incorrect business insights in the final report.

---

## 3️⃣ How did you decide the join order?

I first cleaned both datasets independently to remove invalid records. Then, I used the **customers** dataset as the primary table and joined it with the **sales** dataset using `customer_id`, since customer information was required for generating revenue reports, customer segmentation, and the final reporting table.

---

## 4️⃣ Which step was most difficult and why?

The customer segmentation and final reporting table were the most challenging parts because they required combining multiple transformations such as joins, aggregations, conditional logic, and grouping into a single pipeline while ensuring the results remained accurate.

---

## 5️⃣ How is SQL logic similar to PySpark?

SQL and PySpark perform the same data processing operations. SQL uses declarative queries such as `SELECT`, `GROUP BY`, and `JOIN`, while PySpark performs the same operations using DataFrame transformations like `select()`, `groupBy()`, `agg()`, and `join()`. Both produce equivalent results but use different syntax.

---

## 6️⃣ What challenges will appear with large data?

When working with large datasets, challenges include increased processing time, memory limitations, data skew, expensive shuffle operations, and network overhead during joins. Efficient partitioning, caching, and query optimization become essential for improving performance.

---

## 7️⃣ Can you explain your pipeline in simple steps?

Yes. The pipeline follows the ETL (Extract, Transform, Load) process:

1. **Extract** – Read customer and sales data from CSV files.
2. **Transform** – Clean the data by removing null values, duplicates, and invalid records.
3. **Join** – Combine customer and sales data using `customer_id`.
4. **Analyze** – Perform aggregations to calculate daily sales, city-wise revenue, repeat customers, top customers, and customer segmentation.
5. **Load** – Generate the final reporting table and save it as a CSV file for reporting and further analysis.

---

# 🎯 Overall Learning

This project helped me understand how an end-to-end ETL pipeline is built using PySpark. I learned how to clean and transform data, perform joins and aggregations, apply business rules for customer segmentation, generate meaningful reports, and translate SQL queries into equivalent PySpark transformations. It also strengthened my understanding of the complete data engineering workflow used in real-world analytics projects.
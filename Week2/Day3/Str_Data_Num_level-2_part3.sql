-- SQL Functions Assignment - Level 1
-- Compatible with PostgreSQL

-- =========================================================
-- QUESTION 11 – Weekend Salary Credit Fraud Detection
-- =========================================================

CREATE TABLE salary_credit_audit (

    emp_id INT,

    emp_name VARCHAR(50),

    salary DECIMAL(10,2),

    credit_date DATE,

    bank_code VARCHAR(10)

);

-- Data

INSERT INTO salary_credit_audit VALUES

(1,'Karthik',75000.75,'2025-01-04','HDFC01'),

(2,'Veena',65000.40,'2025-01-06','ICIC02'),

(3,'Ravi',85000.90,'2025-01-05','SBIN03'),

(4,'Anil',70000.10,'2025-01-07','AXIS04'),

(5,'Suresh',60000.55,'2025-01-11','HDFC01');

-- Question

-- For each record:

-- Extract bank prefix from bank_code

-- Identify weekday name of credit_date

-- Round salary

-- Apply MOD on salary

-- Use CASE:

-- Weekend Fraud if credited on Saturday/Sunday AND salary MOD 5 = 0

-- Bank Review if bank is HDFC

-- Else Normal



-- =========================================================
-- QUESTION 12 – Salary Credit Time Drift Analysis
-- =========================================================

CREATE TABLE salary_time_drift (

    emp_id INT,

    emp_name VARCHAR(50),

    salary DECIMAL(10,2),

    credit_ts DATETIME

);

-- Data

INSERT INTO salary_time_drift VALUES

(1,'Karthik',75000.75,'2025-01-10 23:45:00'),

(2,'Veena',65000.40,'2025-01-10 09:15:00'),

(3,'Ravi',85000.90,'2025-01-11 00:10:00'),

(4,'Anil',70000.10,'2025-01-09 18:30:00'),

(5,'Suresh',60000.55,'2025-01-10 02:50:00');

-- Question

-- For each employee:

-- Extract hour from credit timestamp

-- Convert emp_name to lowercase

-- Floor salary

-- Calculate difference between salary and hour

-- Use CASE:

-- Midnight Drift if hour between 0–3

-- After Hours

-- Business Hours



-- =========================================================
-- QUESTION 13 – Salary Decimal Precision Audit
-- =========================================================

CREATE TABLE salary_precision (

    emp_id INT,

    emp_name VARCHAR(50),

    salary DECIMAL(10,4),

    record_date DATE

);

-- Data

INSERT INTO salary_precision VALUES

(1,'Karthik',75000.7567,'2025-01-01'),

(2,'Veena',65000.4044,'2025-01-02'),

(3,'Ravi',85000.9099,'2025-01-03'),

(4,'Anil',70000.1001,'2025-01-04'),

(5,'Suresh',60000.5555,'2025-01-05');

-- Question

-- For each record:

-- Truncate salary to 2 decimals

-- Calculate difference between rounded and truncated value

-- Extract day name

-- Get length of emp_name

-- Use CASE:

-- Precision Loss if difference > 0.01

-- Safe



-- =========================================================
-- QUESTION 14 – Salary Growth Power Index
-- =========================================================

CREATE TABLE salary_growth (

    emp_id INT,

    emp_name VARCHAR(50),

    base_salary DECIMAL(10,2),

    growth_rate DECIMAL(5,2),

    last_hike DATE

);

-- Data

INSERT INTO salary_growth VALUES

(1,'Karthik',75000.75,1.08,'2019-01-01'),

(2,'Veena',65000.40,1.05,'2021-01-01'),

(3,'Ravi',85000.90,1.12,'2017-01-01'),

(4,'Anil',70000.10,1.03,'2022-01-01'),

(5,'Suresh',60000.55,1.06,'2020-01-01');

-- Question

-- For each employee:

-- Calculate years since last hike

-- Apply POWER using growth_rate and years

-- Round projected salary

-- Uppercase emp_name

-- Use CASE:

-- Explosive Growth if projected > 150000

-- Controlled

-- Stagnant



-- =========================================================
-- QUESTION 15 – Salary Symmetry Check
-- =========================================================

CREATE TABLE salary_symmetry (

    emp_id INT,

    emp_name VARCHAR(50),

    salary DECIMAL(10,2),

    processed_date DATE

);

-- Data

INSERT INTO salary_symmetry VALUES

(1,'Karthik',75557.75,'2025-01-15'),

(2,'Veena',64446.40,'2025-01-16'),

(3,'Ravi',85858.90,'2025-01-17'),

(4,'Anil',70007.10,'2025-01-18'),

(5,'Suresh',60000.55,'2025-01-19');

-- Question

-- For each record:

-- Remove decimals from salary

-- Reverse salary digits

-- Extract weekday

-- Proper case emp_name

-- Use CASE:

-- Symmetric Pay if reversed equals original

-- Asymmetric
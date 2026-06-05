-- SQL Functions Assignment - Level 1
-- Compatible with PostgreSQL

-- =========================================================
-- QUESTION 6 – Salary Inflation Drift
-- =========================================================

CREATE TABLE inflation_watch (

    emp_id INT,

    emp_name VARCHAR(50),

    salary DECIMAL(10,2),

    last_hike DATE

);

-- Data

INSERT INTO inflation_watch VALUES

(1,'Karthik',75000.75,'2019-01-01'),

(2,'Veena',65000.40,'2022-01-01'),

(3,'Ravi',85000.90,'2017-01-01');

-- Question

-- For each employee:

-- Proper case name

-- Calculate years since hike

-- Apply POWER on years

-- Round salary impact

-- Use CASE:

-- High Inflation Risk if years > 5

-- Moderate

-- Low



-- =========================================================
-- QUESTION 7 – Salary Sign Integrity Check
-- =========================================================

CREATE TABLE salary_integrity (

    emp_id INT,

    emp_name VARCHAR(50),

    salary DECIMAL(10,2),

    record_date DATE

);

-- Data

INSERT INTO salary_integrity VALUES

(1,'Anil',-70000.10,'2025-01-10'),

(2,'Veena',65000.40,'2025-01-10'),

(3,'Ravi',0.00,'2025-01-10');

-- Question

-- For each employee:

-- Uppercase name

-- Extract year

-- Apply SIGN on salary

-- ABS salary

-- Use CASE:

-- Negative Error

-- Zero Salary

-- Valid



-- =========================================================
-- QUESTION 8 – Name Length vs Salary Correlation
-- =========================================================

CREATE TABLE name_salary (

    emp_id INT,

    emp_name VARCHAR(50),

    salary DECIMAL(10,2),

    join_date DATE

);

-- Data

INSERT INTO name_salary VALUES

(1,'Karthik',75000.75,'2019-03-15'),

(2,'Veena',65000.40,'2021-06-20'),

(3,'Ravi',85000.90,'2016-01-10');

-- Question

-- For each employee:

-- Calculate name length

-- Calculate years of service

-- Round salary

-- Compare name length vs years

-- Use CASE:

-- Name Bias if length > years

-- Neutral



-- =========================================================
-- QUESTION 9 – Salary Spike Detection by Month
-- =========================================================

CREATE TABLE salary_monthly (

    emp_id INT,

    emp_name VARCHAR(50),

    salary DECIMAL(10,2),

    paid_date DATE

);

-- Data

INSERT INTO salary_monthly VALUES

(1,'Karthik',75000.75,'2025-01-31'),

(2,'Veena',65000.40,'2025-02-28'),

(3,'Ravi',85000.90,'2025-03-31');

-- Question

-- For each record:

-- Extract month name

-- CEIL salary

-- Check last day of month

-- Use CASE:

-- End Month Spike

-- Regular



-- =========================================================
-- QUESTION 10 – Salary Digit Sum Audit
-- =========================================================

CREATE TABLE digit_audit (

    emp_id INT,

    emp_name VARCHAR(50),

    salary DECIMAL(10,2),

    audit_date DATE

);

-- Data

INSERT INTO digit_audit VALUES

(1,'Anil',70000.10,'2025-01-01'),

(2,'Veena',65000.40,'2025-01-02');

-- Question

-- For each employee:

-- Extract first character of name

-- Truncate salary

-- Sum digits logically

-- Extract day

-- Use CASE:

-- Digit Alert

-- Normal
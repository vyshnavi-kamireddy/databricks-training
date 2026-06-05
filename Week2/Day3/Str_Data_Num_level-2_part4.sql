-- SQL Functions Assignment - Level 1
-- Compatible with PostgreSQL

-- =========================================================
-- QUESTION 16 – Leap Year Salary Adjustment Audit
-- =========================================================

CREATE TABLE leap_salary (

    emp_id INT,

    emp_name VARCHAR(50),

    salary DECIMAL(10,2),

    credit_date DATE

);

-- Data

INSERT INTO leap_salary VALUES

(1,'Karthik',75000.75,'2024-02-29'),

(2,'Veena',65000.40,'2025-02-28'),

(3,'Ravi',85000.90,'2020-02-29'),

(4,'Anil',70000.10,'2023-02-28'),

(5,'Suresh',60000.55,'2024-02-28');

-- Question

-- For each employee:

-- Extract year

-- Check leap year logic

-- CEIL salary

-- Calculate day of year

-- Use CASE:

-- Leap Credit

-- Non-Leap Credit



-- =========================================================
-- QUESTION 17 – Fiscal Year Boundary Salary Check
-- =========================================================

CREATE TABLE fiscal_salary (

    emp_id INT,

    emp_name VARCHAR(50),

    salary DECIMAL(10,2),

    credit_date DATE

);

-- Data

INSERT INTO fiscal_salary VALUES

(1,'Karthik',75000.75,'2025-03-31'),

(2,'Veena',65000.40,'2025-04-01'),

(3,'Ravi',85000.90,'2024-03-30'),

(4,'Anil',70000.10,'2024-04-02'),

(5,'Suresh',60000.55,'2025-03-29');

-- Question

-- For each record:

-- Determine fiscal year

-- Extract month

-- Format salary

-- Lowercase emp_name

-- Use CASE:

-- Year End Credit

-- Year Start Credit

-- Mid Year



-- =========================================================
-- QUESTION 18 – Salary Random Sampling for Audit
-- =========================================================

CREATE TABLE salary_sampling (

    emp_id INT,

    emp_name VARCHAR(50),

    salary DECIMAL(10,2),

    record_date DATE

);

-- Data

INSERT INTO salary_sampling VALUES

(1,'Karthik',75000.75,'2025-01-01'),

(2,'Veena',65000.40,'2025-01-02'),

(3,'Ravi',85000.90,'2025-01-03'),

(4,'Anil',70000.10,'2025-01-04'),

(5,'Suresh',60000.55,'2025-01-05'),

(6,'Amit',72000.60,'2025-01-06'),

(7,'Neha',68000.80,'2025-01-07');

-- Question

-- For each record:

-- Generate random value

-- Round salary

-- Extract day name

-- Extract first character of emp_name

-- Use CASE:

-- Sampled if RAND() > 0.7

-- Skipped



-- =========================================================
-- QUESTION 19 – Salary ASCII Integrity Check
-- =========================================================

CREATE TABLE salary_ascii (

    emp_id INT,

    emp_name VARCHAR(50),

    salary DECIMAL(10,2),

    join_date DATE

);

-- Data

INSERT INTO salary_ascii VALUES

(1,'Karthik',75000.75,'2019-03-15'),

(2,'Veena',65000.40,'2021-06-20'),

(3,'Ravi',85000.90,'2016-01-10'),

(4,'Anil',70000.10,'2020-09-01'),

(5,'Suresh',60000.55,'2022-11-25');

-- Question

-- For each employee:

-- Extract ASCII value of first character

-- Calculate years since joining

-- Floor salary

-- Compare ASCII vs years

-- Use CASE:

-- Name Dominates

-- Experience Dominates



-- =========================================================
-- QUESTION 20 – Salary vs Calendar Symmetry Logic
-- =========================================================

CREATE TABLE salary_calendar (

    emp_id INT,

    emp_name VARCHAR(50),

    salary DECIMAL(10,2),

    credit_date DATE

);

-- Data

INSERT INTO salary_calendar VALUES

(1,'Karthik',75000.75,'2025-01-15'),

(2,'Veena',65000.40,'2025-02-14'),

(3,'Ravi',85000.90,'2025-03-31'),

(4,'Anil',70000.10,'2025-04-04'),

(5,'Suresh',60000.55,'2025-05-05');

-- Question

-- For each record:

-- Extract day and month

-- Extract last two digits of salary

-- Uppercase emp_name

-- Absolute difference between day and month

-- Use CASE:

-- Calendar Match if day = month OR salary digits match

-- Calendar Drift
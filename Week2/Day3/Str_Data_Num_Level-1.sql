-- SQL Functions Assignment - Level 1
-- Compatible with PostgreSQL

DROP TABLE IF EXISTS salary_audit;
DROP TABLE IF EXISTS bonus_monitor;
DROP TABLE IF EXISTS employee_experience;
DROP TABLE IF EXISTS salary_digits;
DROP TABLE IF EXISTS payroll_control;

-- =========================================================
-- QUESTION 1 – Salary Risk Flagging Based on Tax Shock
-- =========================================================

CREATE TABLE salary_audit (

    emp_id INT,

    emp_name VARCHAR(50),

    salary DECIMAL(10,2),

    tax_percent DECIMAL(5,2),

    last_revision DATE

);

-- Data

INSERT INTO salary_audit VALUES

(1,'karthik',75000.75,10.5,'2022-01-15'),

(2,'veena',65000.40,18.0,'2023-06-01'),

(3,'ravi',85000.90,25.0,'2020-11-20');

-- Question

-- For each employee:

-- Normalize name to lowercase

-- Calculate net salary after tax and round it

-- Extract revision year

-- Find months since revision

-- Use CASE:

-- Flag Tax Shock if tax > 20 AND months > 24

-- Flag Review Needed if tax between 15–20

-- Else Stable



-- =========================================================
-- QUESTION 2 – Bonus Abuse Detection
-- =========================================================

CREATE TABLE bonus_monitor (

    emp_code INT,

    emp_name VARCHAR(50),

    base_salary DECIMAL(10,2),

    bonus DECIMAL(10,2),

    bonus_date DATE

);

-- Data

INSERT INTO bonus_monitor VALUES

(101,'Anil',70000.10,30000.00,'2025-01-10'),

(102,'Suresh',60000.55,3000.30,'2024-03-15'),

(103,'Ravi',85000.90,15000.75,'2023-12-01');

-- Question

-- For each record:

-- Convert name to proper case

-- Calculate bonus percentage of salary (rounded)

-- Extract day name of bonus

-- Find absolute salary–bonus difference

-- Use CASE:

-- Suspicious if bonus > 30% AND weekend

-- Normal if bonus <= 20%

-- Audit



-- =========================================================
-- QUESTION 3 – Experience Parity Validation
-- =========================================================

CREATE TABLE employee_experience (

    emp_id INT,

    emp_name VARCHAR(50),

    joining_date DATE,

    declared_experience INT,

    salary DECIMAL(10,2)

);

-- Data

INSERT INTO employee_experience VALUES

(1,'Veena','2018-07-01',4,65000.40),

(2,'Ravi','2014-01-10',12,85000.90),

(3,'Anil','2020-09-01',3,70000.10);

-- Question

-- For each employee:

-- Uppercase name

-- Calculate actual experience from date

-- Find difference between declared and actual experience

-- Floor salary

-- Use CASE:

-- Overstated if declared > actual

-- Understated if declared < actual

-- Matched



-- =========================================================
-- QUESTION 4 – Salary Digit Pattern Analysis
-- =========================================================

CREATE TABLE salary_digits (

    emp_id INT,

    emp_name VARCHAR(50),

    salary DECIMAL(10,2),

    credit_date DATE

);

-- Data

INSERT INTO salary_digits VALUES

(1,'Karthik',75000.75,'2025-01-01'),

(2,'Veena',65000.40,'2025-01-02'),

(3,'Suresh',60000.55,'2025-01-03');

-- Question

-- For each employee:

-- Extract last two characters of name

-- Get day of month from credit date

-- Truncate salary to integer

-- Use MOD on salary

-- Use CASE:

-- Pattern Match if salary MOD 10 equals day

-- No Match otherwise



-- =========================================================
-- QUESTION 5 – Odd–Even Salary Compliance
-- =========================================================

CREATE TABLE payroll_control (

    emp_id INT,

    emp_name VARCHAR(50),

    salary DECIMAL(10,2),

    payment_date DATE

);

-- Data

INSERT INTO payroll_control VALUES

(1,'Ravi',85000.90,'2025-01-15'),

(2,'Anil',70000.10,'2025-01-16'),

(3,'Veena',65000.40,'2025-01-17');

-- Question

-- For each employee:

-- Lowercase name

-- Extract weekday

-- Round salary

-- Apply MOD on salary

-- Use CASE:

-- Violation if even salary paid on odd weekday

-- Compliant otherwise
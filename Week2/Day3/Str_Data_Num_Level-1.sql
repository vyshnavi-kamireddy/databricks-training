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


select

emp_id,emp_name,salary,tax_percent,last_revision,

LOWER(emp_name) lower_case,

ROUND(salary-(salary*(tax_percent/100))) net_salary,

YEAR(last_revision) revision_year,

TIMESTAMPDIFF(MONTH,last_revision,CURDATE()) months_since_revision,

CASE
WHEN tax_percent>20 AND TIMESTAMPDIFF(MONTH,last_revision,CURDATE())>24
THEN 'Flag Tax Shock'
WHEN tax_percent BETWEEN 15 AND 20
THEN 'Flag Review Needed'
ELSE 'Stable'
END as status

from salary_audit;



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


select

emp_code,emp_name,base_salary,bonus,bonus_date,

CONCAT(
  UPPER(LEFT(emp_name,1)),
  LOWER(SUBSTRING(emp_name,2))
) proper_case,

ROUND((bonus/base_salary)*100) bonus_perc,

DAYNAME(bonus_date) day_name,

ABS(base_salary-bonus) absolute_salary_diff,

CASE
WHEN ROUND((bonus/base_salary)*100) >30 AND DAYNAME(bonus_date) IN ('Saturday','Sunday')
THEN 'Suspicious'
WHEN ROUND((bonus/base_salary)*100) <=20
THEN 'Normal'
ELSE 'Audit'
END as status

from bonus_monitor;



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


select 

emp_id,emp_name,joining_date,declared_experience,salary,

UPPER(emp_name) upper_case,

TIMESTAMPDIFF(YEAR,joining_date,CURDATE()) actual_experience,

ABS(declared_experience-TIMESTAMPDIFF(YEAR,joining_date,CURDATE()))  as Diff,

Floor(salary) floor_salary,

CASE
WHEN declared_experience>TIMESTAMPDIFF(YEAR,joining_date,CURDATE())
THEN 'OverStated'
WHEN declared_experience<TIMESTAMPDIFF(YEAR,joining_date,CURDATE())
THEN 'UnderStated'
ELSE 'Matched'
END as status

from employee_experience;



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


select

emp_id,emp_name,salary,credit_date,

RIGHT(emp_name,2) last_twoChar,

DAY(credit_date) as day_of_month,

Truncate(salary,0) as truncate_salary,

CASE
WHEN MOD(salary,10)=DAY(credit_date)
THEN 'Pattern Match'
ELSE 'No Match'
END as matching_status

from salary_digits;



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


select

emp_id,emp_name,salary,payment_date,

LOWER(emp_name) lower_case,
DAYNAME(payment_date) week_day,
ROUND(salary) rounded_salary,
MOD(salary,10) mod_salary,

 CASE
        WHEN MOD(ROUND(salary),2) = 0
             AND MOD(DAY(payment_date),2) <> 0
        THEN 'Violation'

        ELSE 'Compliant'
    END AS status

from payroll_control;


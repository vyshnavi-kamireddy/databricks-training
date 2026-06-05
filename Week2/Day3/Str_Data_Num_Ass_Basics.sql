-- SQL Functions Assignment - Basic Level
-- Compatible with PostgreSQL

DROP TABLE IF EXISTS employee_payments;
DROP TABLE IF EXISTS orders_delivery;
DROP TABLE IF EXISTS customer_spending;
DROP TABLE IF EXISTS subscriptions;
DROP TABLE IF EXISTS loan_details;
DROP TABLE IF EXISTS attendance;
DROP TABLE IF EXISTS product_sales;
DROP TABLE IF EXISTS insurance_policies;
DROP TABLE IF EXISTS salary_revision;
DROP TABLE IF EXISTS bank_accounts;

-- =========================================================
-- QUESTION 1: Employee Compensation Classification
-- =========================================================

CREATE TABLE employee_payments (

    emp_id INT PRIMARY KEY,

    emp_name VARCHAR(50),

    department VARCHAR(30),

    base_salary DECIMAL(10,2),

    bonus DECIMAL(10,2),

    joining_date DATE

);

-- Insert Data

INSERT INTO employee_payments VALUES

(1,'karthik','Data',75000.75,5000.50,'2019-03-15'),

(2,'veena','HR',65000.40,4000.25,'2021-06-20'),

(3,'ravi','Data',85000.90,6000.75,'2016-01-10'),

(4,'anil','Finance',70000.10,NULL,'2020-09-01'),

(5,'suresh','HR',60000.55,3000.30,'2022-11-25');

-- Question

-- For each employee:

-- Convert emp_name to proper case

-- Convert emp_name to upper case

-- Convert emp_name to lower case

-- Calculate total income = base_salary + bonus (NULL safe)

-- Round total income to nearest integer

-- Extract joining year

-- Use CASE to classify:

-- Senior if experience > 7 years

-- Mid if between 4 and 7

-- Junior otherwise



select emp_name,
Upper(emp_name) upper_case,
Lower(emp_name) lower_case,
CONCAT(
	UPPER(Left(emp_name,1)),
    LOWER(Substring(emp_name,2))
) proper_case,

base_salary,bonus,
ROUND(base_salary+COALESCE(bonus,0)) total_income,

joining_date,
YEAR(joining_date) Joining_Year,
TIMESTAMPDIFF(YEAR,joining_date,CURDATE()) experience,

CASE 
WHEN TIMESTAMPDIFF(YEAR,joining_date,CURDATE())>7
THEN 'Senior'
WHEN TIMESTAMPDIFF(YEAR,joining_date,CURDATE()) between 4 and 7
THEN 'Mid'
ELSE 'Junior'
END as employee_level

from employee_payments;



-- =========================================================
-- QUESTION 2: Order Delivery Delay Analysis
-- =========================================================

CREATE TABLE orders_delivery (

    order_id INT,

    customer_name VARCHAR(50),

    order_date DATE,

    delivery_date DATE,

    order_amount DECIMAL(10,2)

);

-- Insert Data

INSERT INTO orders_delivery VALUES

(101,'rajesh','2025-01-01','2025-01-05',12500.75),

(102,'meena','2025-01-10','2025-01-10',8400.40),

(103,'arun','2025-01-15','2025-01-20',15600.90),

(104,'pooja','2025-01-18',NULL,9200.10);

-- Question

-- For each order:

-- Uppercase customer name

-- Calculate delivery days using date difference

-- Replace NULL delivery date with today

-- Truncate order amount to 1 decimal

-- Use CASE:

-- Same-day

-- Delayed (>3 days)

-- Pending


select customer_name,
UPPER(customer_name) upper_case,

delivery_date,
DATEDIFF(COALESCE(delivery_date,CURDATE()),order_date) delivery_days,

order_amount,
TRUNCATE(order_amount,1) truncating,

CASE
WHEN delivery_date is NULL
THEN 'Pending'
WHEN DATEDIFF(delivery_date,order_date) =0
THEN 'Same-Day'
WHEN DATEDIFF(delivery_date,order_date) >3
THEN 'Delayed'
ELSE 'Normal'
END as delivery_status

from orders_delivery;




-- =========================================================
-- QUESTION 3: Customer Spending Pattern
-- =========================================================

CREATE TABLE customer_spending (

    cust_id INT,

    cust_name VARCHAR(50),

    city VARCHAR(30),

    purchase_amount DECIMAL(10,2),

    purchase_date DATE

);

-- Insert Data

INSERT INTO customer_spending VALUES

(1,'amit','mumbai',12000.75,'2024-12-01'),

(2,'neha','delhi',8500.40,'2024-12-15'),

(3,'rohit','mumbai',15500.90,'2024-11-20'),

(4,'kavya','chennai',6000.10,'2024-10-05');

-- Question

-- Display:

-- Customer name with first letter capitalized

-- Month name of purchase

-- Rounded purchase amount

-- Absolute value of purchase (defensive logic)

-- Use CASE:

-- High spender > 15000

-- Medium 8000–15000

-- Low otherwise


select cust_name,
CONCAT(
  UPPER(LEFT(cust_name,1)),
  LOWER(SUBSTRING(cust_name,2))
) proper_case,

purchase_date,
MONTHNAME(purchase_date) month_name,
purchase_amount,
ROUND(purchase_amount) rounded_amount,
ABS(purchase_amount) absolute_value,

CASE
WHEN purchase_amount>15000
THEN  'High_Spender'
WHEN purchase_amount between 8000 and 15000
THEN  'Medium_Spender'
ELSE 'Low_Spender'
END as spender_category

from customer_spending;




-- =========================================================
-- QUESTION 4: Subscription Validity Check
-- =========================================================

CREATE TABLE subscriptions (

    user_id INT,

    user_email VARCHAR(100),

    start_date DATE,

    end_date DATE,

    subscription_fee DECIMAL(10,2)

);

-- Insert Data

INSERT INTO subscriptions VALUES

(1,'karthik@gmail.com','2024-01-01','2025-01-01',12000.50),

(2,'veena@yahoo.com','2024-06-15','2024-12-15',8500.75),

(3,'ravi@hotmail.com','2023-03-01','2024-03-01',15000.90);

-- Question

-- For each user:

-- Extract email domain

-- Calculate subscription duration in months

-- Format fee with commas

-- Find remaining days from today

-- Use CASE:

-- Active

-- Expiring Soon (≤30 days)

-- Expired



select user_email,
SUBSTRING_INDEX(user_email,'@',-1) as email_domain,

start_date,end_date,
TIMESTAMPDIFF(MONTH,start_date,end_date) duration,

subscription_fee,
FORMAT(subscription_fee,2) format_fees,

DATEDIFF(end_date,CURDATE()) remaining_days,

CASE
WHEN end_date<CURDATE()
THEN 'Expired'
WHEN DATEDIFF(end_date,CURDATE()) between 1 and 30
THEN 'Expiring Soon'
ELSE 'Active'
END as subscription_status

from subscriptions;



-- =========================================================
-- QUESTION 5: Loan EMI Risk Categorization
-- =========================================================

CREATE TABLE loan_details (

    loan_id INT,

    customer_name VARCHAR(50),

    loan_amount DECIMAL(12,2),

    interest_rate DECIMAL(5,2),

    loan_start DATE

);

-- Insert Data

INSERT INTO loan_details VALUES

(201,'suresh',500000.75,8.5,'2022-01-10'),

(202,'mahesh',750000.40,9.2,'2021-05-20'),

(203,'anita',300000.90,7.8,'2023-07-01');

-- Question

-- Compute:

-- Monthly interest using power function

-- Years since loan start

-- Round EMI

-- Uppercase customer name

-- Use CASE:

-- High Risk if interest > 9

-- Medium Risk

-- Low Risk


select 
loan_id,customer_name,loan_amount,interest_rate,loan_start,

ROUND(loan_amount*(interest_rate/1200)) monthly_interest,
TIMESTAMPDIFF(YEAR,loan_start,CURDATE()) year_since_loanstart,
UPPER(customer_name) upper_case,

CASE
WHEN interest_rate>9
THEN 'High Risk'
WHEN interest_rate BETWEEN 8 AND 9
THEN 'Medium Risk'
ELSE 'Low Risk'
END as risk_category

from loan_details;  



-- =========================================================
-- QUESTION 6: Employee Attendance Evaluation
-- =========================================================

CREATE TABLE attendance (

    emp_id INT,

    emp_name VARCHAR(50),

    total_days INT,

    present_days INT,

    record_date DATE

);

-- Insert Data

INSERT INTO attendance VALUES

(1,'karthik',30,28,'2025-01-31'),

(2,'veena',30,22,'2025-01-31'),

(3,'ravi',30,18,'2025-01-31');

-- Question

-- Calculate:

-- Attendance percentage (rounded)

-- Month name

-- Difference between total and present days

-- Lowercase employee name

-- Use CASE:

-- Excellent ≥90%

-- Average 75–89%

-- Poor otherwise



-- =========================================================
-- QUESTION 7: Product Discount Validation
-- =========================================================

CREATE TABLE product_sales (

    product_id INT,

    product_name VARCHAR(50),

    mrp DECIMAL(10,2),

    selling_price DECIMAL(10,2),

    sale_date DATE

);

-- Insert Data

INSERT INTO product_sales VALUES

(1,'Laptop',75000.75,68000.50,'2025-01-10'),

(2,'Mobile',35000.40,33000.25,'2025-01-12'),

(3,'Tablet',25000.90,26000.75,'2025-01-15');

-- Question

-- Derive:

-- Discount amount (absolute)

-- Discount percentage

-- Day name of sale

-- Proper case product name

-- Use CASE:

-- Valid Discount

-- Overpriced

-- No Discount



-- =========================================================
-- QUESTION 8: Insurance Policy Aging
-- =========================================================

CREATE TABLE insurance_policies (

    policy_id INT,

    holder_name VARCHAR(50),

    premium_amount DECIMAL(10,2),

    policy_start DATE,

    policy_end DATE

);

-- Insert Data

INSERT INTO insurance_policies VALUES

(301,'arjun',12000.50,'2023-01-01','2026-01-01'),

(302,'megha',8500.75,'2022-06-15','2025-06-15'),

(303,'vinod',15000.90,'2021-03-01','2024-03-01');

-- Question

-- Show:

-- Policy duration in years

-- Remaining days

-- Rounded premium

-- Uppercase holder name

-- Use CASE:

-- Long Term

-- Mid Term

-- Expired



-- =========================================================
-- QUESTION 9: Salary Increment Simulation
-- =========================================================

CREATE TABLE salary_revision (

    emp_id INT,

    emp_name VARCHAR(50),

    current_salary DECIMAL(10,2),

    rating INT,

    last_hike DATE

);

-- Insert Data

INSERT INTO salary_revision VALUES

(1,'karthik',75000.75,5,'2023-01-01'),

(2,'veena',65000.40,4,'2024-01-01'),

(3,'ravi',85000.90,3,'2022-01-01');

-- Question

-- Calculate:

-- Years since last hike

-- Increment using rating logic

-- New salary (rounded)

-- Lowercase name

-- Use CASE:

-- High Increment

-- Moderate

-- No Increment



-- =========================================================
-- QUESTION 10: Customer Account Status Evaluation
-- =========================================================

CREATE TABLE bank_accounts (

    account_id INT,

    customer_name VARCHAR(50),

    balance DECIMAL(12,2),

    last_transaction DATE,

    branch VARCHAR(30)

);

-- Insert Data

INSERT INTO bank_accounts VALUES

(501,'ramesh',125000.75,'2024-12-20','hyderabad'),

(502,'sita',8500.40,'2023-06-15','delhi'),

(503,'manoj',-2500.90,'2025-01-05','mumbai');

-- Question

-- Determine:

-- Absolute balance

-- Days since last transaction

-- Proper case branch name

-- Sign of balance

-- Use CASE:

-- Active

-- Dormant

-- Overdrawn
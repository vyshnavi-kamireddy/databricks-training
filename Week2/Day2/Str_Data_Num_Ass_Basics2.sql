
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


select 

emp_id,emp_name,total_days,present_days,record_date,

ROUND((present_days/total_days)*100) attendence_percentage,
MONTHNAME(record_date) month,
total_days-present_days absent_days,
LOWER(emp_name) lower_case,

CASE
WHEN ROUND((present_days/total_days)*100)>=90
THEN 'Excellent'
WHEN ROUND((present_days/total_days)*100) BETWEEN 75 AND 89
THEN 'Average'
ELSE 'Poor'
END as attendence_status

from attendance;



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


select 

product_id,product_name,mrp,selling_price,sale_date,

ABS(mrp-selling_price) discount_amount,
ROUND(((mrp-selling_price)/mrp)*100,2) discount_perc,

DAYNAME(sale_date) day_name,
CONCAT(
  UPPER(LEFT(product_name,1)),
  LOWER(SUBSTRING(product_name,2))
) proper_case,

CASE
WHEN selling_price<mrp
THEN 'Valid Discount'
WHEN selling_price>mrp
THEN 'Over Priced'
ELSE 'No Discount'
END as discount_status

from product_sales;



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


select 

policy_id,holder_name,premium_amount,policy_start,policy_end,

TIMESTAMPDIFF(YEAR,policy_start,policy_end) policy_duration,
TIMESTAMPDIFF(DAY,CURDATE(),policy_end)  Remaining_days,

ROUND(premium_amount) Rounded_premium,
UPPER(holder_name) upper_case,

CASE
WHEN policy_end<CURDATE()
THEN 'Expired'
WHEN TIMESTAMPDIFF(YEAR,policy_start,policy_end)>2
THEN 'Long_Term'
WHEN TIMESTAMPDIFF(YEAR,policy_start,policy_end) BETWEEN 1 AND 2
THEN 'Mid_Term'
ELSE 'Short_Term'
END as policy_status

from insurance_policies;



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


select
emp_id,emp_name,current_salary,rating,last_hike,

TIMESTAMPDIFF(YEAR,last_hike,CURDATE()) year_since_lastHike,

CASE 
WHEN rating=5
THEN current_salary*0.20
WHEN rating=4
THEN current_salary*0.10
ELSE 0
END as increment_amount,

ROUND(
  current_salary+
     CASE 
     WHEN rating=5
     THEN current_salary*0.20
     WHEN rating=4
     THEN current_salary*0.10
     ELSE 0
  	 END
) as new_salary,

LOWER(emp_name) lower_case,

CASE
WHEN rating=5
THEN 'High Increment'
WHEN rating=4
THEN 'Moderate Increment'
ELSE 'No Increment'
END as increment_status

from salary_revision;



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


select

account_id,customer_name,balance,last_transaction,branch,

ABS(balance) absolute_balance,

TIMESTAMPDIFF(DAY,last_transaction,CURDATE()) days_since_last_transaction,

CONCAT(
  UPPER(LEFT(branch,1)),
  LOWER(SUBSTRING(branch,2))
) proper_case,

CASE 
WHEN balance>=0
THEN '+'
ELSE '-'
END as sign,

CASE
WHEN balance<0
THEN 'Overdrawn'
WHEN TIMESTAMPDIFF(YEAR,last_transaction,CURDATE()) >=2
THEN 'Dormant'
ELSE 'Active'
END as account_status

from bank_accounts;




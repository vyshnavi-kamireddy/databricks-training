-- SQL Functions Assignment - Level 2
-- Compatible with PostgreSQL

-- =========================================================
-- QUESTION 1 – Employee Login Discipline & Performance Classification
-- =========================================================

CREATE TABLE employee_login (

    emp_id INT,

    emp_name VARCHAR(50),

    login_time DATETIME,

    logout_time DATETIME

);

-- Data

INSERT INTO employee_login VALUES

(1,'Karthik','2025-01-15 09:05:00','2025-01-15 18:10:00'),

(2,'Veena','2025-01-14 10:30:00','2025-01-14 16:00:00'),

(3,'Ravi','2025-01-13 09:00:00','2025-01-13 20:00:00'),

(4,'Anil','2025-01-12 11:00:00','2025-01-12 14:00:00'),

(5,'Suresh','2025-01-11 09:15:00','2025-01-11 17:00:00');

-- Question

-- For each employee:

-- Convert emp_name to proper case

-- Identify whether login date is Weekday or Weekend

-- Calculate total working hours (logout – login)

-- Round working hours to 2 decimals

-- Use CASE:

-- Good Performer if weekday AND working hours ≥ 8

-- Bad Performer if weekday AND working hours < 6

-- Weekend Login otherwise


select

emp_id,emp_name,login_time,logout_time,

CONCAT(
  UPPER(LEFT(emp_name,1)),
  LOWER(SUBSTRING(emp_name,2))
) proper_case,

CASE
WHEN DAYNAME(login_time) IN ('Saturday','Sunday')
THEN 'Weekend'
ELSE 'Weekday'
END as day,

ROUND(TIMESTAMPDIFF(minute,login_time,logout_time)/60,2) hours,

CASE
WHEN DAYNAME(login_time) NOT IN ('Saturday','Sunday') AND ROUND(TIMESTAMPDIFF(minute,login_time,logout_time)/60,2)>=8
THEN 'Good Performer'
WHEN DAYNAME(login_time) NOT IN ('Saturday','Sunday') AND ROUND(TIMESTAMPDIFF(minute,login_time,logout_time)/60,2)<6
THEN 'Bad Performer'
ELSE 'Weekend Login'
END status

from employee_login;



-- =========================================================
-- QUESTION 2 – Past 7 Days Attendance & Productivity Check
-- =========================================================

CREATE TABLE attendance_log (

    emp_id INT,

    emp_name VARCHAR(50),

    login_date DATE,

    login_time TIME,

    logout_time TIME

);

-- Data

INSERT INTO attendance_log VALUES

(1,'Karthik','2025-01-14','09:00:00','18:00:00'),

(2,'Karthik','2025-01-13','09:15:00','17:30:00'),

(3,'Veena','2025-01-12','10:00:00','15:00:00'),

(4,'Ravi','2025-01-10','09:00:00','19:00:00'),

(5,'Anil','2025-01-08','11:00:00','14:00:00');

-- Question

-- For each record:

-- Uppercase employee name

-- Check if login_date falls within last 7 days from today

-- Identify Weekday / Weekend

-- Calculate working hours using TIMEDIFF

-- Use CASE:

-- Active & Productive if last 7 days AND hours ≥ 8

-- Active but Low Hours if last 7 days AND hours < 8

-- Absent from Last 7 Days


select

emp_id,emp_name,login_date,login_time,logout_time,

UPPER(emp_name) upper_case,
TIMESTAMPDIFF(DAY,login_date,CURDATE()) days,

CASE
WHEN DAYNAME(login_date) IN ('Saturday','Sunday')
THEN 'Weekend'
ELSE 'Weekday'
END as day,

ROUND(TIMESTAMPDIFF(minute,login_time,logout_time)/60,2) hours,

CASE
WHEN TIMESTAMPDIFF(DAY,login_date,CURDATE())<=7 AND ROUND(TIMESTAMPDIFF(minute,login_time,logout_time)/60,2)>=8
THEN 'Active & Productive'
WHEN TIMESTAMPDIFF(DAY,login_date,CURDATE())<=7 AND ROUND(TIMESTAMPDIFF(minute,login_time,logout_time)/60,2)<8
THEN 'Active but Low'
ELSE ' Absent '
END status

from attendance_log;





-- =========================================================
-- QUESTION 3 – Weekend Work Abuse Detection
-- =========================================================

CREATE TABLE weekend_monitor (

    emp_id INT,

    emp_name VARCHAR(50),

    work_date DATE,

    login_time TIME,

    logout_time TIME

);

-- Data

INSERT INTO weekend_monitor VALUES

(1,'Ravi','2025-01-11','09:00:00','21:00:00'),

(2,'Veena','2025-01-12','10:00:00','13:00:00'),

(3,'Karthik','2025-01-10','09:00:00','18:00:00'),

(4,'Anil','2025-01-09','11:00:00','14:00:00');

-- Question

-- For each employee:

-- Extract day name from work_date

-- Lowercase employee name

-- Calculate working hours

-- Apply CEIL on hours

-- Use CASE:

-- Weekend Overtime if Saturday/Sunday AND hours ≥ 8

-- Suspicious Login if weekend AND hours < 4

-- Normal Working Day


select

emp_id,emp_name,work_date,login_time,logout_time,

DAYNAME(work_date) day_name ,
LOWER(emp_name) lower_case,
CEIL(TIMESTAMPDIFF(MINUTE,login_time,logout_time)/60) working_hours,

CASE
WHEN DAYNAME(work_date) IN ('Saturday','Sunday') AND CEIL(TIMESTAMPDIFF(MINUTE,login_time,logout_time)/60)>=8
THEN 'Weekend Overtime'
WHEN DAYNAME(work_date) IN ('Saturday','Sunday') AND CEIL(TIMESTAMPDIFF(MINUTE,login_time,logout_time)/60)<4
THEN 'Suspicious Login'
ELSE 'Normal Working Day'
END status

from weekend_monitor;



-- =========================================================
-- QUESTION 4 – Login Time Deviation & Discipline Score
-- =========================================================

CREATE TABLE login_discipline (

    emp_id INT,

    emp_name VARCHAR(50),

    login_datetime DATETIME,

    logout_datetime DATETIME

);

-- Data

INSERT INTO login_discipline VALUES

(1,'Karthik','2025-01-15 08:55:00','2025-01-15 18:10:00'),

(2,'Veena','2025-01-15 10:45:00','2025-01-15 16:00:00'),

(3,'Ravi','2025-01-15 09:00:00','2025-01-15 20:30:00'),

(4,'Anil','2025-01-15 11:30:00','2025-01-15 14:00:00');

-- Question

-- For each employee:

-- Extract login hour

-- Calculate total working hours

-- Truncate working hours to 1 decimal

-- Get weekday name

-- Use CASE:

-- Disciplined if weekday AND login before 9 AND hours ≥ 8

-- Late Comer if weekday AND login after 10

-- Poor Discipline otherwise


select

emp_id,emp_name,login_datetime,logout_datetime,

HOUR(login_datetime) login_hour,
TRUNCATE(TIMESTAMPDIFF(MINUTE,login_datetime,logout_datetime)/60,1) working_hours,

DAYNAME(login_datetime) day_name,

CASE
WHEN DAYNAME(login_datetime) NOT IN ('Saturday','Sunday') AND HOUR(login_datetime)<9 AND TRUNCATE(TIMESTAMPDIFF(MINUTE,login_datetime,logout_datetime)/60,1)>=8
THEN 'Disciplined '
WHEN DAYNAME(login_datetime) NOT IN ('Saturday','Sunday') AND HOUR(login_datetime)>10 
THEN 'Late Comer  '
ELSE 'Poor Discipline'
END status

from login_discipline;




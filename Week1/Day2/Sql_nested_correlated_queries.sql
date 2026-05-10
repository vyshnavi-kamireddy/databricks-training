-- Nested and Correlated Queries 

-- 46. Select the employee with the highest salary.
        select * from Employee
        where salary=(select max(salary) from Employee);

-- 47. Select employees whose salary is above the average salary.
        select * from Employee
        where salary>(select avg(salary) from Employee);

-- 48. Select the second highest salary from the Employee table.
        select max(salary) as second_highest_salary from Employee
        where salary<(select max(salary) from Employee);

-- 49. Select the department with the most employees.
        select department_id,count(*) as total_employees from Employee
        group by department_id
        order by total_employees desc
        limit 1;

-- 50. Select employees who earn more than the average salary of their department.
        select * from Employee
        where salary>(
            select avg(e.salary) from Employee e
            where department_id=e.department_id
        );

-- 51. Select the nth highest salary (for example, 3rd highest).
        select * from Employee
        order by salary desc
        limit 1 offset 2;

-- 52. Select employees who are older than all employees in the HR department.
        select * from Employee
        where age>(
            select max(age) from Employee 
            where department_id=(
                select department_id from Department
                where name='HR'
            )
        );
-- 53. Select departments where the average salary is greater than 55000.
        select department_id, avg(salary) as average_salary from Employee
        group by department_id
        having average_salary>55000;

-- 54. Select employees who work in a department with at least 2 projects.
        select e.*,count(p.project_id) as no_of_projects from Employee e
        left join Project p
        on e.department_id=p.department_id
        group by e.emp_id
        having no_of_projects>=2;

-- 55. Select employees who were hired on the same date as 'Jane Smith'.
        select * from Employee
        where hire_date=(
            select hire_date from Employee
            where name='Jane Smith'
        );

-- Combined Moderate Difficulty Queries

-- 56. Select the total salary of employees hired in the year 2020.
        select 2020 as hire_year,sum(salary) as total_salary from Employee
        where year(hire_date)=2020;

-- 57. Select the average salary of employees in each department, ordered by the average salary descending order.
        select department_id,avg(salary) as average_salary from Employee
        group by department_id
        order by average_salary desc;

-- 58. Select departments with more than 1 employee and an average salary greater than 55000.
        select department_id,count(*) as total_employees,avg(salary) as average_salary from Employee
        group by department_id
        having total_employees>1 and average_salary>55000;

-- 59. Select employees hired in the last 2 years, ordered by their hire date.
        select * from Employee
        where hire_date>=date_sub(curdate(),interval 2 year)
        order by hire_date;

-- 60. Select the total number of employees and the average salary for departments with more than 2 employees.
        select department_id,count(*) as total_employees,avg(salary) as average_salary from Employee
        group by department_id
        having total_employees>2;

-- 61. Select the name and salary of employees whose salary is above the average salary of their department.
        select name,salary from Employee
        where salary>(
            select avg(e.salary) from Employee e
            where department_id=e.department_id
        );
-- 62. Select the names of employees who are hired on the same date as the oldest employee in company.
        select name from Employee
        where hire_date in (
        select hire_date from Employee
        where age=(select max(age) from Employee)
        );

-- 63. Select the department names along with the total number of projects they are working on ordered by the number of projects.
        select d.name,count(*) as total_projects from Department d
        left join Project p
        on d.department_id=p.department_id
        group by d.department_id,d.name
        order by total_projects;

-- 64. Select the employee name with the highest salary in each department.
        SELECT name, department_id, salary
        FROM Employee e1
        WHERE salary = (SELECT MAX(salary) FROM Employee e2 WHERE e2.department_id = e1.department_id);

-- 65. Select the names and salaries of employees who are older than the average age of employees in their department.
        select name,salary from Employee
        where age>(
            select avg(e.age) from Employee e
            where department_id=e.department_id
        );

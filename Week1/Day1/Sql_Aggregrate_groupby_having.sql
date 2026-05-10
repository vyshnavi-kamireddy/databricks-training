-- Aggregate Queries

-- 16. Select the total salary of all employees.
        select sum(salary) as total_salary from Employee;

-- 17. Select the average salary of employees.
        select avg(salary) as average_salary from Employee;

-- 18. Select the minimum salary in the Employee table.
        select min(salary) as minimum_salary from Employee;

-- 19. Select the number of employees in each department.
        select department_id,count(*) as total_employees from Employee
        where department_id is not null
        group by department_id;

-- 20. Select the average salary of employees in each department.
        select department_id,avg(salary) as average_salary from Employee
        where department_id is not null
        group by department_id;

-- Group By Queries

-- 21. Select the total salary for each department.
        select department_id,sum(salary) as total_salary from Employee
        where department_id is not null
        group by department_id;

-- 22. Select the average age of employees in each department.
        select department_id,avg(age) as average_age from Employee
        where department_id is not null
        group by department_id;

-- 23. Select the number of employees hired in each year.
        select year(hire_date),count(*) as total_employees from Employee
        group by year(hire_date);

-- 24. Select the highest salary in each department.
        select department_id,max(salary) as highest_salary from Employee
        where department_id is not null
        group by department_id;

-- 25. Select the department with the highest average salary.
        select department_id,avg(salary) as highest_average_salary from Employee
        group by department_id
        order by highest_average_salary desc
        limit 1;

-- Having Queries

-- 26. Select departments with more than 2 employees.
        select department_id,count(*) as total_employees from Employee
        group by department_id
        having count(*)>2;

-- 27. Select departments with an average salary greater than 55000.
        select department_id,avg(salary) as average_salary from Employee
        group by department_id
        having avg(salary)>55000;

-- 28. Select years with more than 1 employee hired.
        select year(hire_date) as hire_year,count(*) as total_employees from Employee
        group by hire_year
        having total_employees>1;
-- 29. Select departments with a total salary expense less than 100000.
        select department_id,sum(salary) as total_salary from Employee
        where department_id is not null
        group by department_id
        having total_salary<100000;
-- 30. Select departments with the maximum salary above 75000.
        select department_id,max(salary) as maximum_salary from Employee
        where department_id is not null
        group by department_id
        having maximum_salary>75000;



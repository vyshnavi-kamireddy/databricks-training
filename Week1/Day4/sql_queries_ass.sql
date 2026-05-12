## SELECT

-- 1. Display all employee details.
        select * from Employees;

-- 2. Display only employee names and salaries.
        select emp_name,salary from Employees;

-- 3. Display employee names and departments.
        select emp_name,department from Employees;

-- 4. Display all employees from the IT department.
        select * from Employees
        where department='IT';

-- 5. Display employee names and experience.
        select emp_name,experience from Employees;

## WHERE

-- 6. Find employees with salary greater than 70000.
        select * from Employees
        where salary>70000;

-- 7. Find employees working in Hyderabad.
        select * from Employees
        where city='Hyderabad';

-- 8. Find employees with experience less than 4 years.
        select * from Employees
        where experience<4;

-- 9. Find employees from Finance department.
        select * from Employees
        where department='Finance';

-- 10. Find employees whose salary is equal to 52000.
        select * from Employees
        where salary=52000;


## GROUP BY

-- 11. Find total salary department-wise.
        select department,sum(salary) as total_salary from Employees
        group by department;

-- 12. Find average salary in each department.
        select department,avg(salary) as average_salary from Employees
        group by department;

-- 13. Count employees in each city.
        select city,count(emp_id) as no_of_employees from Employees
        group by city;

-- 14. Find maximum salary in each department.
        select department,max(salary) as maximum_salary from Employees
        group by department;

-- 15. Find minimum experience department-wise.
        select department,min(experience) as minimum_experience from Employees
        group by department;


## HAVING

-- 16. Find departments having more than 3 employees.
        select department,count(*) as no_of_employees from Employees
        group by department
        having count(*)>3;

-- 17. Find departments where average salary is greater than 60000.
        select department,avg(salary) as average_salary from Employees
        group by department
        having avg(salary)>60000;

-- 18. Find cities having more than 2 employees.
        select city,count(*) as no_of_employees from Employees
        group by city
        having count(*)>2;

-- 19. Find departments where total salary is greater than 200000.
        select department,sum(salary) as total_salary from Employees
        group by department
        having sum(salary)>200000;

-- 20. Find departments where maximum salary is above 90000.
        select department,max(salary) as maximum_salary from Employees
        group by department
        having max(salary)>90000;



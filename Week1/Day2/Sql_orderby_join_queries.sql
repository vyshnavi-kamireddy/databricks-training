-- Order By Queries

-- 31. Select all employees ordered by their salary in ascending order.
        select * from Employee
        order by salary asc;

-- 32. Select all employees ordered by their age in descending order.
        select * from Employee
        order by age desc;

-- 33. Select all employees ordered by their hire date in ascending order.
        select * from Employee
        order by hire_date asc;

-- 34. Select employees ordered by their department and then by their salary.
        select * from Employee
        order by department_id,salary asc;

-- 35. Select departments ordered by the total salary of their employees.
        select d.*,sum(salary) as total_salary from Department d
        left join Employee e
        on d.department_id=e.department_id
        group by d.department_id,d.name
        order by sum(e.salary);

-- Join Queries

-- 36. Select employee names along with their department names.
        select e.name as employee_name,d.name as department_name from Employee e
        left join Department d
        on e.department_id=d.department_id;

-- 37. Select project names along with the department names they belong to.
        select p.name as Project_name,d.name as department_name from Project p
        left join Department d
        on p.department_id=d.department_id;

-- 38. Select employee names and their corresponding project names.
        select e.name as Employee_name,p.name as project_name from Employee e
        left join Project p
        on e.department_id=p.department_id;

-- 39. Select all employees and their departments, including those without a department.
        select e.*,d.* from Employee e
        left join Department d
        on e.department_id=d.department_id;

-- 40. Select all departments and their employees, including departments without employees.
        select d.*,e.* from Department d
        left join Employee e
        on d.department_id=e.department_id;

-- 41. Select employees who are not assigned to any project.
        select  e.* from Employee e
        left join Project p
        on e.department_id=p.department_id
        where p.project_id is null;

-- 42. Select employees and the number of projects their department is working on.
        select e.name,count(p.project_id) as no_of_projects from Employee e
        left join Project p
        on e.department_id=p.department_id
        group by e.department_id,e.name;

-- 43. Select the departments that have no employees.
        select d.*,count(e.emp_id) as total_employees from Department d
        left join Employee e
        on d.department_id=e.department_id
        group by d.department_id,d.name
        having total_employees=0;

-- 44. Select employee names who share the same department with 'John Doe'.
        select name from Employee
        where department_id=(
            select department_id from Employee
            where name='John Doe'
        );
-- 45. Select the department name with the highest average salary.
        select d.name,avg(e.salary) as highest_average_salary from Department d
        left join Employee e
        on d.department_id=e.department_id
        group by d.name
        order by highest_average_salary desc
        limit 1;

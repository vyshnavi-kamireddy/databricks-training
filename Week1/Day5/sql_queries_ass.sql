## TOP

-- 21. Display top 5 highest paid employees.
        select top 5  *  from Employees
        order by salary desc;

        select * from Employees
        order by salary desc
        limit 5;

-- 22. Display top 3 employees with highest experience.
        select top 3  *  from Employees
        order by experience desc;

        select * from Employees
        order by experience desc
        limit 3;

-- 23. Display top 2 salaries from Finance department.
        select top 2  *  from Employees
        where department='Finance'
        order by salary desc;

        select * from Employees
        where department='Finance'
        order by salary desc
        limit 2;

-- 24. Display top 4 employees from Hyderabad.
        select top 4  *  from Employees
        where city='Hyderabad';

        select * from Employees
        where city='Hyderabad'
        limit 4;

-- 25. Display top 1 highest salary employee.
        select top 1  *  from Employees
        order by salary desc;

        select * from Employees
        order by salary desc
        limit 1;



## DISTINCT

-- 26. Display distinct department names.
        select distinct department from Employees;

-- 27. Display distinct city names.
        select distinct city from Employees;

-- 28. Display distinct salary values.
        select distinct salary from Employees;

-- 29. Display distinct combinations of department and city.
        select distinct department,city from Employees;

-- 30. Display distinct experience values.
        select distinct experience from Employees;


## COMPARISON OPERATORS

-- 31. Find employees with salary >= 80000.
        select * from Employees
        where salary>=80000;

-- 32. Find employees with experience <= 3.
        select * from Employees
        where experience<=3;

-- 33. Find employees whose salary <> 45000.
        select * from Employees
        where salary<>45000;

-- 34. Find employees with salary < 50000.
        select * from Employees
        where salary<50000;

-- 35. Find employees with experience > 5.
        select * from Employees
        where experience>5;


## LOGICAL OPERATORS

-- 36. Find employees from IT department AND salary greater than 70000.
        select * from Employees
        where department='IT' and salary>70000;

-- 37. Find employees from Hyderabad OR Bangalore.
        select * from Employees
        where city='Hyderabad' or city='Bangalore';

-- 38. Find employees from HR department AND experience less than 3.
        select * from Employees
        where department='HR' and experience<3;

-- 39. Find employees with salary greater than 60000 OR experience greater than 6.
        select * from Employees
        where salary>60000 or experience>6;

-- 40. Find employees NOT from Sales department.
        select * from Employees
        where department !='Sales';


## IN AND NOT IN

-- 41. Find employees working in ('Hyderabad', 'Mumbai').
        select * from Employees
        where city in ('Hyderabad','Mumbai');

-- 42. Find employees whose department IN ('IT', 'Finance').
        select * from Employees
        where department in ('IT','Finance');

-- 43. Find employees whose city NOT IN ('Chennai', 'Pune').
        select * from Employees
        where city not in ('Chennai','Pune');

-- 44. Find employees whose salary IN (45000, 75000, 91000).
        select * from Employees
        where salary in (45000,75000,91000);

-- 45. Find employees whose department NOT IN ('HR', 'Sales').
        select * from Employees
        where department not in ('HR','Sales');


## BETWEEN

-- 46. Find employees with salary BETWEEN 50000 AND 80000.
        select * from Employees
        where salary between 50000 and 80000;

-- 47. Find employees with experience BETWEEN 3 AND 6.
        select * from Employees
        where experience between 3 and 6;

-- 48. Find employees whose emp_id BETWEEN 105 AND 112.
        select * from Employees
        where emp_id between 105 and 112;

-- 49. Find employees with salary NOT BETWEEN 40000 AND 60000.
        select * from Employees
        where salary not between 40000 and 60000;

-- 50. Find employees with experience BETWEEN 2 AND 4.
        select * from Employees
        where experience between 2 and 4;


## LIKE OPERATOR

-- 51. Find employees whose names start with 'R'.
        select * from Employees
        where emp_name like 'R%';

-- 52. Find employees whose names end with 'a'.
        select * from Employees
        where emp_name like '%a';

-- 53. Find employees whose names contain 'v'.
        select * from Employees
        where emp_name like '%v%';

-- 54. Find employees whose city starts with 'B'.
        select * from Employees
        where city like 'B%';

-- 55. Find employees whose department ends with 's'.
        select * from Employees
        where department like '%s';


-- 11. Find the difference between the current order amount and previous order amount.
        select order_id,order_date,total_amount,
        LAG(total_amount) OVER(order by order_date) as previous_amount,
        total_amount-(LAG(total_amount) OVER(order by order_date)) as difference
        from orders;

-- 12. Calculate a moving average of the last 3 orders.
        select order_id,order_date,total_amount,
        AVG(total_amount) OVER(order by order_date rows between 2 preceding and current row) as moving_average 
        from orders;

-- 13. Use NTILE(4) to divide employees into salary quartiles.
        select employee_id,salary,
        NTILE(4) OVER(order by salary DESC) as salary_quartile
        from employees;

-- 14. Find the first order placed by each customer using ROW_NUMBER().
        select * from 
        (
            select order_id,customer_id,order_date,
            ROW_NUMBER() OVER(partition by customer_id order by order_date) as rownumber from orders
        ) t
        where rownumber=1;

-- 15. Find the latest order placed by each customer.
        select * from 
        (
            select order_id,customer_id,order_date,
            ROW_NUMBER() OVER(partition by customer_id order by order_date DESC) as rownumber
            from orders
        ) t
        where rownumber=1;

-- 16. Display employee salaries along with department average salary.
        select employee_id,employee_name,department,salary,
        AVG(salary) OVER(partition by department) as dept_average_salary
        from employees;

-- 17. Find employees earning above their department average salary.
        select * from (
            select employee_id,employee_name,department,salary,
            AVG(salary) OVER(partition by department) as dept_average_salary
            from employees
        ) t
        where salary>dept_average_salary;

-- 18. Use SUM() OVER(PARTITION BY department) to calculate department payroll.
        select employee_id,employee_name,department,
        salary,
        SUM(salary) OVER(partition by department) as dept_payroll 
        from employees;

-- 19. Find the percentage contribution of each employee salary within their department.
        select *,(salary/dept_payroll)*100.0 as perc from
        (
                select employee_id,employee_name,department,salary,SUM(salary) OVER(partition by department) as dept_payroll
                from employees
        )t ;

-- 20. Use COUNT() OVER() to show total number of employees alongside each row.
        select employee_id,employee_name,
        COUNT(employee_id) OVER() as total_employees
        from employees;
        
-- 21. Create a CTE to calculate total sales per employee.

-- 22. Use a CTE to find employees whose sales exceed the company average.

-- 23. Create multiple CTEs to calculate customer total spending and rankings.

-- 24. Write a recursive CTE to generate numbers from 1 to 10.

-- 25. Use a recursive CTE to display employee hierarchy data.

-- 26. Create a CTE that filters orders above the average order amount.

-- 27. Use a CTE and window function together to rank customers by total spending.

-- 28. Find the second-highest salary in each department.

-- 29. Display the difference between each employee salary and the department maximum salary.

-- 30. Combine CTEs and window functions to find the top-performing employee in each department based on total sales.

-- Bonus Challenge: Create a report showing monthly sales trends using CTEs, running totals, LAG(), and percentage growth calculation.

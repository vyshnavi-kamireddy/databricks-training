-- 1. Use ROW_NUMBER() to assign a row number to employees ordered by salary descending.
        select *,
        ROW_NUMBER() OVER(order by salary DESC) as row_num
        from employees;

-- 2. Use RANK() to rank employees by salary.
        select *,
        RANK() OVER(order by salary DESC) as emp_rank
        from employees;

-- 3. Use DENSE_RANK() to rank employees by salary.
        select *,
        DENSE_RANK() OVER(order by salary DESC) as emp_rank
        from employees;

-- 4. Find the top 3 highest-paid employees using a window function.
        select * from 
        (
            select *,
            RANK() OVER(order by salary DESC) as emp_rank
            from employees
        ) t 
        where emp_rank<=3;

-- 5. Rank employees within each department using PARTITION BY.
        select *,
        RANK() OVER(partition by department order by salary DESC) as dept_rank
        from employees;

-- 6. Display the highest salary in each department using a window function.
        select * from
        (
        select *,
        RANK() OVER(partition by department order by salary DESC) as dept_rank
        from employees
        ) t
        where dept_rank=1;

        select *,
        MAX(Salary) OVER(partition by department) as highest_salary
        from employees;

-- 7. Calculate the running total of order amounts ordered by order_date.
        select *,
        SUM(total_amount) OVER(order by order_date) as Running_total
        from orders;

-- 8. Calculate the cumulative sales amount for each employee.
        select *,
        SUM(total_amount) OVER(partition by employee_id order by order_date) as Cumulative_Sales
        from orders;


-- 9. Use LAG() to show the previous order amount for each customer.
        select *,
        LAG(total_amount) OVER(partition by customer_id order by order_date) as previous_amount
        from orders;

-- 10. Use LEAD() to show the next order amount for each customer.
        select *,
        LEAD(total_amount) OVER(partition by customer_id order by order_date) as next_order_amount
        from orders;


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
        WITH CTE_total_sales AS
        (
            select employee_id,
            SUM(total_amount) as total_sales from orders
            group by employee_id
        )

        select e.employee_id,e.employee_name,COALESCE(es.total_sales,0) as total_employee_sales from employees e
        LEFT JOIN CTE_total_sales es
        ON e.employee_id=es.employee_id;

-- 22. Use a CTE to find employees whose sales exceed the company average.
        WITH CTE_total_sales AS
        (
            select employee_id,
            SUM(total_amount) as total_sales
            from orders
            group by employee_id
        )
        ,CTE_company_average AS
        (
            select AVG(total_sales) as company_average 
            from CTE_total_sales
        )

        select e.employee_id,e.employee_name,es.total_sales
        from employees e
        INNER JOIN CTE_total_sales es
        ON e.employee_id=es.employee_id
        INNER JOIN CTE_company_average ca
        ON es.total_sales>ca.company_average;

-- 23. Create multiple CTEs to calculate customer total spending and rankings.
        WITH CTE_Total_spending AS
        (
            select customer_id,
            SUM(total_amount) as total_spending
            from orders
            group by customer_id
        )
        , CTE_customer_ranking AS
        (
            select *,RANK() OVER(order by total_spending DESC) as customer_rank
            from CTE_Total_spending
        )

        select c.customer_id,c.customer_name,
        cr.total_spending,cr.customer_rank from customers c
        LEFT JOIN CTE_customer_ranking cr
        ON c.customer_id=cr.customer_id

-- 24. Write a recursive CTE to generate numbers from 1 to 10.
        WITH RECURSIVE CTE_Numbers AS
        (
            SELECT 1 as Number

            UNION ALL

            SELECT Number+1
            FROM CTE_Numbers
            WHERE Number<10
        )

        select * from CTE_Numbers;

-- 25. Use a recursive CTE to display employee hierarchy data.
        WITH RECURSIVE CTE_employee AS
        (
            select employee_id,employee_name,manager_id,1 as level from employees
            where manager_id is NULL

            UNION ALL

            select e.employee_id,e.employee_name,e.manager_id,ce.level+1   
            from employees e
            INNER JOIN CTE_employee ce
            ON ce.employee_id=e.manager_id
        )

        select * from CTE_employee;

-- 26. Create a CTE that filters orders above the average order amount.
        WITH CTE_Average_Amount AS
        (
            select AVG(total_amount) as average_amount
            from orders
        )

        select * from orders
        WHERE total_amount> (select average_amount from CTE_Average_Amount);

-- 27. Use a CTE and window function together to rank customers by total spending.
        WITH CTE_customer_spending AS
        (
            select customer_id,
            SUM(total_amount) as total_spending
            from orders
            group by customer_id
        )

        select c.customer_id,c.customer_name,total_spending,
        RANK() OVER(order by cs.total_spending DESC) as customer_rank
        from customers c
        INNER JOIN CTE_customer_spending cs
        ON c.customer_id=cs.customer_id

-- 28. Find the second-highest salary in each department.
        WITH CTE_ranking AS
        (
            select employee_id,employee_name,department,salary,
            DENSE_RANK() OVER(partition by department order by salary DESC) as employee_rank 
            from employees
        )

        select * from CTE_ranking
        where employee_rank=2;

-- 29. Display the difference between each employee salary and the department maximum salary.
        WITH CTE_dept_max_salaries AS
        (
            select department,MAX(salary) as max_salary from employees
            group by department
        )

        select e.employee_id,e.employee_name,e.department,e.salary,ds.max_salary-e.salary as diff
        from employees e
        LEFT JOIN CTE_dept_max_salaries ds
        ON e.department=ds.department;

-- 30. Combine CTEs and window functions to find the top-performing employee in each department based on total sales.
        WITH employee_sales AS (
            SELECT 
                e.employee_id,
                e.employee_name,
                e.department,
                SUM(o.total_amount) AS total_sales
            FROM employees e
            JOIN orders o
            ON e.employee_id = o.employee_id
            GROUP BY e.employee_id, e.employee_name, e.department
        ),
        ranked_employees AS (
            SELECT *,
                RANK() OVER(
                    PARTITION BY department
                    ORDER BY total_sales DESC
                ) AS ranking
            FROM employee_sales
        )
        SELECT *
        FROM ranked_employees
        WHERE ranking = 1;

-- Bonus Challenge: Create a report showing monthly sales trends using CTEs, running totals, LAG(), and percentage growth calculation.
        WITH monthly_sales AS (
        SELECT 
            DATE_FORMAT(order_date,'%Y-%m') AS month,
            SUM(total_amount) AS monthly_total
        FROM orders
        GROUP BY DATE_FORMAT(order_date,'%Y-%m')
            ),

        sales_analysis AS (
            SELECT 
                month,
                monthly_total,

                SUM(monthly_total) OVER(
                    ORDER BY month
                ) AS running_total,

                LAG(monthly_total) OVER(
                    ORDER BY month
                ) AS previous_month_sales

            FROM monthly_sales
        )

        SELECT 
            month,
            monthly_total,
            running_total,
            previous_month_sales,

            ROUND(
                ((monthly_total - previous_month_sales)
                * 100.0 / previous_month_sales),
                2
            ) AS percentage_growth

        FROM sales_analysis;

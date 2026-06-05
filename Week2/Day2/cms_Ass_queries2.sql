-- 26. Find the city with the maximum number of students.
        with cte_students AS
        (
            select city,count(student_id) as no_of_students from Student
            group by city
        )

        , cte_max AS
        (
            select max(no_of_students) as max_count from cte_students
        )

        select * from cte_students
        Join cte_max
        ON no_of_students=max_count

-- 27. Display all departments and their staff count, including empty departments.
        select d.department_id,d.department_name,count(s.staff_id) as staff_count from Department d
        Left Join Staff s
        ON d.department_id=s.department_id
        group by d.department_id,d.department_name;

-- 28. Find students who have failed in at least one subject (marks < 50).
        select s.student_id,s.student_name,m.subject_id,m.marks from Student s
        Left Join Mark m
        ON s.student_id=m.student_id
        where m.marks<50;

-- 29. Display staff hired before 2018.
        select * from Staff
        where year(hire_date)<2018;

-- 30. Find departments where no staff salary is recorded as NULL.
        select d.department_id,d.department_name from Department d
        Left Join Staff s
        ON d.department_id=s.department_id
        group by d.department_id,d.department_name
        having count(*)=count(s.salary);

-- 31. Assign a row number to students ordered by CGPA.
        select ROW_NUMBER() OVER(order by cgpa DESC) as Rownumber,
        student_id,student_name,cgpa 
        from Student;

-- 32. Rank students based on their CGPA.
        select Rank() OVER(order by cgpa DESC) as Student_rank,
        student_id,student_name,cgpa 
        from Student;

-- 33. Display dense rank of staff salaries.
        select staff_id,staff_name,salary,
        DENSE_RANK() OVER(Order by salary DESC) as denseRank 
        from Staff;

-- 34. Find the top 3 highest scoring students using window functions.
        with CTE_s_ranks AS
        (
            select s.student_id,s.student_name,sum(m.marks) as total_marks,
            RANK() OVER(Order by sum(m.marks) DESC) as s_rank 
            from Student s
            Left join Mark m
            ON s.student_id=m.student_id
            group by s.student_id,s.student_name
        )

        select * from CTE_s_ranks
        having s_rank<=3;

-- 35. Display running total of marks for each student.
        select s.student_id,s.student_name,
        sum(m.marks) OVER(partition by s.student_id order by exam_date) as total_marks 
        from Student s
        Left join Mark m
        ON s.student_id=m.student_id;

-- 36. Find the average marks for each subject using window functions.
        select DISTINCT s.subject_id,s.subject_name,
        avg(m.marks) OVER(partition by s.subject_id) 
        from Subject s
        Left Join Mark m
        ON s.subject_id=m.subject_id

-- 37. Display previous exam marks for each student using LAG().
        select student_id,marks,exam_date,
        lag(marks) OVER(partition by student_id order by exam_date) as s_LAG 
        from Mark;

-- 38. Display next exam marks for each student using LEAD().
        select student_id,marks,exam_date,
        LEAD(marks) OVER(partition by student_id order by exam_date) as s_LEAD 
        from Mark;

-- 39. Find the highest marks within each subject using MAX() OVER().
        select subject_id,marks,
        max(marks) OVER(partition by subject_id) as max_marks 
        from Mark;

-- 40. Display cumulative average marks ordered by exam date.
        select marks,exam_date,
        AVG(marks) OVER(order by exam_date) as cumulative_average 
        from Mark;

-- 41. Find the first student admitted in each department.
        with CTE_data AS
        (
            select student_id,student_name,admission_year,department_id,
            ROW_NUMBER() OVER(partition by department_id order by admission_year)  as a_year 
            from Student
            where department_id is not NULL
        )

        select * from CTE_data
        where a_year=1;

-- 42. Display the latest hired staff member in each department.
        WITH CTE_x AS
        (
            select staff_id,staff_name,hire_date,department_id,
            ROW_NUMBER() OVER(partition by department_id order by hire_date DESC) as S_Row_Number 
            from Staff
            where department_id is NOT NULL
        )
        
        select * from CTE_x
        where S_Row_Number=1;

-- 43. Divide students into 4 CGPA quartiles using NTILE().
        select *,NTILE(4) OVER(order by cgpa DESC) as ntile_quartiles 
        from Student;

-- 44. Find percentage rank of students based on CGPA.
        select *,PERCENT_RANK() OVER(order by cgpa ) as P_rank 
        from Student;

-- 45. Display cumulative distribution of salaries.
        select *,CUME_DIST() OVER(order by salary) as C_Dist 
        from Staff;

-- 46. Find subjects where a student's marks are above the subject average.
        select * from
        (
            select student_id,subject_id,marks,
            avg(marks) OVER(partition by subject_id) as avg_marks 
            from Mark
        ) t
        where marks>avg_marks

-- 47. Find departments whose average staff salary is higher than overall average salary.
        select DISTINCT * from 
        (
            select department_id,avg(salary) OVER(partition by department_id) as dept_avg,
            avg(salary) OVER() as overall_avg 
            from Staff
            where department_id is NOT NULL
        )t
        where dept_avg>overall_avg;

-- 48. Display students who scored above department average marks.
        select * from
        (
            select s.student_id,s.student_name,m.marks,s.department_id,
            AVG(m.marks) OVER(partition by s.department_id) as dept_avg 
            from Student s
            Left Join Mark m
            ON s.student_id=m.student_id
            where department_id is NOT NULL
        )t
        where marks>dept_avg;

-- 49. Find the 3rd highest mark using DENSE_RANK().
        select * from 
        (
            select marks,DENSE_RANK() OVER(order by marks DESC) as d_rank from Mark
        )t
        where d_rank=3;

-- 50. Generate a report showing student name, department, subject, exam type,
--     marks, department average, and overall rank.
        select s.student_id,s.student_name,d.department_name,su.subject_name,m.exam_type,m.marks,
        AVG(m.marks) OVER(partition by d.department_id) as dept_avg,
        RANK() OVER(order by m.marks DESC) as s_rank 
        from Student s
        Join Department d
        ON s.department_id=d.department_id
        JOIN Mark m
        ON s.student_id=m.student_id
        JOIN Subject su
        ON m.subject_id=su.subject_id

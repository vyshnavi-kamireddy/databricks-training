-- 1. List all students along with their department names.
        select s.*,d.department_name 
        from Student s
        Left Join Department d
        ON s.department_id=d.department_id;

-- 2. Display all staff members and their department names, including staff without departments.
        select s.*,d.department_name 
        from Staff s
        Left Join Department d
        ON s.department_id=d.department_id;

-- 3. Find all departments that currently have no students assigned.
        select d.* from Department d
        Left Join Student s
        ON d.department_id=s.department_id
        Where s.student_id is NULL;

-- 4. Show students who do not have any marks recorded.
        select s.* from Student s
        Left Join Mark m
        ON s.student_id=m.student_id
        Where m.student_id is NULL;

-- 5. Display subjects that are not assigned to any staff member.
        select * from Subject
        where staff_id is NULL;

-- 6. Find the average CGPA department-wise.
        select d.department_id,d.department_name,avg(s.cgpa) from Department d
        Left Join Student s
        ON d.department_id=s.department_id
        group by d.department_id,d.department_name;

-- 7. Display departments where the average CGPA is greater than 8.0.
        select d.department_id,d.department_name,avg(s.cgpa) as avg_cgpa from Department d
        Left Join Student s
        ON d.department_id=s.department_id
        group by d.department_id,d.department_name
        having avg_cgpa>8.0;

-- 8. Find the total number of students in each department.
        select d.department_id,d.department_name,count(s.student_id) as no_of_students from Department d
        Left Join Student s
        ON d.department_id=s.department_id
        group by d.department_id,d.department_name;

-- 9. Display the highest and lowest marks scored in each subject.
        select s.subject_id,s.subject_name,
        Max(m.marks) as Highest_marks,Min(m.marks) as Lowest_Marks from Subject s
        Left join Mark m
        ON s.subject_id=m.subject_id
        group by s.subject_id,s.subject_name;

-- 10. Find students who scored more than 90 in any exam.
        select s.student_id,s.student_name from Student s
        Left Join Mark m
        ON s.student_id=m.student_id
        where m.marks>90
        group by s.student_id,s.student_name;

-- 11. Display the names of students who belong to the Computer Science department.
        select s.student_id,s.student_name,d.department_name from Student s
        Left Join Department d
        ON s.department_id=d.department_id
        where d.department_name='Computer Science';

-- 12. Find the number of subjects handled by each staff member.
        select st.staff_id,st.staff_name,count(s.subject_id) as no_of_subjects from Staff st
        Left Join Subject s
        ON st.staff_id=s.staff_id
        group by st.staff_id;

-- 13. Display students along with the total marks they obtained across all subjects.
        select s.*,SUM(m.marks) as total_marks from Student s
        Left Join Mark m
        ON s.student_id=m.student_id
        group by s.student_id;

-- 14. Find departments with more than 2 staff members.
        select d.*,count(s.staff_id) as staff_count from Department d
        Left Join Staff s
        ON d.department_id=s.department_id
        group by d.department_id
        having staff_count>2;

-- 15. Display students whose CGPA is above the average CGPA.
        select * from Student
        where cgpa>(
        select avg(cgpa) as avg_cgpa from Student
        );

-- 16. Find staff members earning more than the average salary of their department.
        select s.* from Staff s
        where s.salary>
        (
            select avg(st.salary) from  Staff st
            where st.department_id=s.department_id
        );

-- 17. Display the second highest salary among staff members.
        select max(salary) as second_highest from Staff
        where salary <
        (
        select max(salary) from Staff
        );

-- 18. Find students who scored the highest marks in each subject.
        select s.student_id,s.student_name,m.subject_id,m.marks from Student s
        Inner Join Mark m
        ON s.student_id=m.student_id
        where m.marks=(
        select max(m2.marks) from Mark m2
        where m2.subject_id=m.subject_id
        
        )
        order by m.subject_id;

-- 19. Display all students and their marks, including students without marks.
        select s.student_id,s.student_name,m.subject_id,m.exam_type,m.marks as total_marks from Student s
        Left Join Mark m
        ON s.student_id=m.student_id;

-- 20. Find subjects where the average marks are below 70.
        select s.subject_id,s.subject_name,avg(m.marks) as avg_marks from Subject s
        Left join Mark m
        ON s.subject_id=m.subject_id
        group by s.subject_id,s.subject_name
        having avg_marks<70;

-- 21. Display students ordered by CGPA in descending order.
        select * from Student
        order by cgpa DESC;

-- 22. Find the total salary expenditure department-wise.
        select d.department_id,d.department_name,sum(s.salary) as total_salary from Department d
        Left Join Staff s
        ON d.department_id=s.department_id
        group by d.department_id,d.department_name;

-- 23. Display departments where the total salary exceeds 200000.
        select d.department_id,d.department_name,sum(s.salary) as total_salary from Department d
        Left Join Staff s
        ON d.department_id=s.department_id
        group by d.department_id,d.department_name
        having total_salary>200000;

-- 24. Find students admitted after 2021 and having CGPA above 7.5.
        select * from Student
        where admission_year>2021 and cgpa>7.5;

-- 25. Display the number of students admitted each year.
        select admission_year,count(student_id) as no_of_students from Student
        group by admission_year
        order by admission_year;


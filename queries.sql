-- 1. Find the Total Number of Students in Each Department
SELECT 
    d.department_name,
    COUNT(s.student_id) AS total_students
FROM 
    Students s
JOIN 
    Departments d ON s.department_id = d.department_id
GROUP BY 
    d.department_name;

-- 2. List All Courses Taught by a Specific Professor
SELECT 
    c.course_name
FROM 
    Courses c
WHERE 
    c.professor_id = 1; -- Replace 1 with the specific professor's ID

-- 3. Find the Average Grade of Students in Each Course
SELECT 
    c.course_name,
    AVG(CASE 
        WHEN e.grade = 'A' THEN 4
        WHEN e.grade = 'B' THEN 3
        WHEN e.grade = 'C' THEN 2
        WHEN e.grade = 'D' THEN 1
        ELSE 0
    END) AS average_grade
FROM 
    Enrollments e
JOIN 
    Courses c ON e.course_id = c.course_id
GROUP BY 
    c.course_name;

-- 4. List All Students Who Have Not Enrolled in Any Courses
SELECT 
    s.student_id,
    s.first_name,
    s.last_name
FROM 
    Students s
LEFT JOIN 
    Enrollments e ON s.student_id = e.student_id
WHERE 
    e.student_id IS NULL;

-- 5. Find the Number of Courses Offered by Each Department
SELECT 
    d.department_name,
    COUNT(c.course_id) AS total_courses
FROM 
    Courses c
JOIN 
    Departments d ON c.department_id = d.department_id
GROUP BY 
    d.department_name;

-- 6. List All Students Who Have Taken a Specific Course (e.g., 'Database Systems')
SELECT 
    s.student_id,
    s.first_name,
    s.last_name
FROM 
    Enrollments e
JOIN 
    Students s ON e.student_id = s.student_id
JOIN 
    Courses c ON e.course_id = c.course_id
WHERE 
    c.course_name = 'Database Systems';

-- 7. Find the Most Popular Course Based on Enrollment Numbers
SELECT 
    c.course_name,
    COUNT(e.enrollment_id) AS total_enrollments
FROM 
    Enrollments e
JOIN 
    Courses c ON e.course_id = c.course_id
GROUP BY 
    c.course_name
ORDER BY 
    total_enrollments DESC
LIMIT 1;

-- 8. Find the Average Number of Credits Per Student in a Department
SELECT 
    d.department_name,
    AVG(c.credits) AS average_credits
FROM 
    Students s
JOIN 
    Enrollments e ON s.student_id = e.student_id
JOIN 
    Courses c ON e.course_id = c.course_id
JOIN 
    Departments d ON s.department_id = d.department_id
GROUP BY 
    d.department_name;

-- 9. List All Professors Who Teach in More Than One Department
SELECT 
    p.professor_id,
    p.first_name,
    p.last_name
FROM 
    Professors p
JOIN 
    Courses c ON p.professor_id = c.professor_id
GROUP BY 
    p.professor_id, p.first_name, p.last_name
HAVING 
    COUNT(DISTINCT c.department_id) > 1;

-- 10. Get the Highest and Lowest Grade in a Specific Course (e.g., 'Operating Systems')
SELECT 
    c.course_name,
    MAX(e.grade) AS highest_grade,
    MIN(e.grade) AS lowest_grade
FROM 
    Enrollments e
JOIN 
    Courses c ON e.course_id = c.course_id
WHERE 
    c.course_name = 'Operating Systems'
GROUP BY 
    c.course_name;

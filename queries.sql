-- 1. List all students
SELECT * FROM Students;

-- 2. Highest marks in each subject
SELECT subject_name, MAX(marks)
FROM Marks JOIN Subjects USING(subject_id)
GROUP BY subject_id;

-- 3. Average marks of each student
SELECT Students.name, AVG(marks) AS avg_marks
FROM Marks JOIN Students USING(student_id)
GROUP BY student_id;

-- 4. Department-wise average marks
SELECT department, AVG(marks)
FROM Marks JOIN Students USING(student_id)
GROUP BY department;

-- 5. Top scoring student
SELECT Students.name, SUM(marks) AS total
FROM Marks JOIN Students USING(student_id)
GROUP BY student_id
ORDER BY total DESC
LIMIT 1;

-- 6. Pass/Fail (pass = marks >= 40)
SELECT Students.name, subject_name,
CASE WHEN marks >= 40 THEN 'Pass' ELSE 'Fail' END AS result
FROM Marks 
JOIN Students USING(student_id)
JOIN Subjects USING(subject_id);

-- 7. Count how many passed each subject
SELECT subject_name, COUNT(*) AS pass_count
FROM Marks JOIN Subjects USING(subject_id)
WHERE marks >= 40
GROUP BY subject_id;

-- 8. Lowest marks in each subject
SELECT subject_name, MIN(marks)
FROM Marks JOIN Subjects USING(subject_id)
GROUP BY subject_id;

-- 9. Students scoring above 80
SELECT DISTINCT Students.name
FROM Marks JOIN Students USING(student_id)
WHERE marks > 80;

-- 10. Total marks of each department
SELECT department, SUM(marks)
FROM Marks JOIN Students USING(student_id)
GROUP BY department;

-- 11. Subject-wise average
SELECT subject_name, AVG(marks)
FROM Marks JOIN Subjects USING(subject_id)
GROUP BY subject_id;

-- 12. Ranking students by total marks
SELECT Students.name, SUM(marks) AS total_marks
FROM Marks JOIN Students USING(student_id)
GROUP BY student_id
ORDER BY total_marks DESC;

-- 13. Students who failed at least one subject
SELECT DISTINCT Students.name
FROM Marks JOIN Students USING(student_id)
WHERE marks < 40;

-- 14. Count failed subjects per student
SELECT Students.name, COUNT(*) AS failed_subjects
FROM Marks JOIN Students USING(student_id)
WHERE marks < 40
GROUP BY student_id;

-- 15. Best performing department
SELECT department, AVG(marks) AS dept_avg
FROM Marks JOIN Students USING(student_id)
GROUP BY department
ORDER BY dept_avg DESC
LIMIT 1;

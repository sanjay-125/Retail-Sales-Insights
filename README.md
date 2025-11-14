# 🎓 Student Performance SQL Analysis

This project is a simple and clean SQL-based analysis system designed to explore student marks, subject performance, and department-level insights.  
It demonstrates SQL fundamentals such as joins, grouping, aggregate functions, constraints, and analytics queries.  
Perfect for interviews, portfolios, or academic demonstrations.

---

## 📂 Project Structure

```
Student-Performance-SQL/
 ┣ 📄 README.md
 ┣ 📄 schema.sql
 ┣ 📄 sample_data.sql
 ┗ 📄 queries.sql
```

---

## 🛠 Tech Stack
- SQL (SQLite / MySQL / PostgreSQL — works with any)
- DB Browser / MySQL Workbench
- Any ER diagram tool (optional)

---

## 🧩 Database Design

### **Tables**
1. **Students** — student details  
2. **Subjects** — list of subjects  
3. **Marks** — marks scored by each student in each subject  

### **ER Diagram (Text Version)**  
```
Students (student_id PK, name, department)
|
|----< Marks (student_id FK, subject_id FK, marks)
|
Subjects (subject_id PK, subject_name)
```

---

## 🗄 SQL Schema (schema.sql)

```sql
CREATE TABLE Students (
    student_id INTEGER PRIMARY KEY,
    name TEXT,
    department TEXT
);

CREATE TABLE Subjects (
    subject_id INTEGER PRIMARY KEY,
    subject_name TEXT
);

CREATE TABLE Marks (
    student_id INTEGER,
    subject_id INTEGER,
    marks INTEGER,
    PRIMARY KEY (student_id, subject_id),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (subject_id) REFERENCES Subjects(subject_id)
);
```

---

## 📥 Sample Data (sample_data.sql)

```sql
INSERT INTO Students VALUES
(1,'Arun','CSE'),
(2,'Priya','ECE'),
(3,'Ravi','IT');

INSERT INTO Subjects VALUES
(1,'Maths'),
(2,'Physics'),
(3,'DSA');

INSERT INTO Marks VALUES
(1,1,90),
(1,2,88),
(1,3,95),
(2,1,76),
(2,2,81),
(2,3,79),
(3,1,65),
(3,2,72),
(3,3,70);
```

---

## 📊 Analysis Queries (queries.sql)

Below are **15 real-world SQL queries** included in the project:

```sql
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

-- 6. Pass/Fail result
SELECT Students.name, subject_name,
CASE WHEN marks >= 40 THEN 'Pass' ELSE 'Fail' END AS result
FROM Marks 
JOIN Students USING(student_id)
JOIN Subjects USING(subject_id);

-- 7. Pass count per subject
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

-- 11. Subject-wise average marks
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

-- 14. Failed subjects count per student
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
```

---

## 📌 Key Insights You Can Generate
- Highest scoring students  
- Best and worst performing subjects  
- Department-wise ranking  
- Pass/fail classification  
- Overall topper  
- Subject-wise average and extremes  

---

## ▶️ How to Run the Project

1. Create a new SQL database  
2. Run `schema.sql`  
3. Run `sample_data.sql`  
4. Execute the queries from `queries.sql`  

---

## 🎯 Skills Demonstrated
- SQL Joins  
- Aggregates (SUM, AVG, MAX, MIN)  
- GROUP BY & HAVING  
- CASE statements  
- Primary & foreign keys  
- Data modeling  

---

## 👤 Author
**Sanjay R**  
SQL & Data Analytics Enthusiast  

MIT License  

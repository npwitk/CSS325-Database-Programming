# CSS325 Database Systems — Final Exam (2025)

This summary is written from memory after leaving the exam room.
It may not be 100% accurate, but it reflects what I personally remember from the test.

---

# **Question 1 — Keys**

### **Tasks**

* Identify at least **5 superkeys**
* From those superkeys, identify **candidate keys**
* Choose the **best primary key**
* Identify **secondary keys**
* Show **5 functional dependencies (FDs)**
* Draw an **FD diagram**

*(No answers shown — question only, as requested.)*

---

# **Question 2 — Normalization**

### **Tasks**

* Given 4 FDs:

  * 2 Partial functional dependencies
  * 1 Transitive dependency
  * 1 Full functional dependency
* Perform **1NF**, **2NF**, and **3NF**
* Show the decomposition at each step

---

# **Question 3 — DDL + DML**

### **Tasks**

* Write `CREATE TABLE` for a given schema (choose appropriate data types)
* Write another `CREATE TABLE` using **CONSTRAINT** (Composite PK, Foreign Key)
* Use `ALTER TABLE` to add a new column
* Use `UPDATE ... CASE` to fill that column:

  * If score < 50 → `'Fail'`
  * If score ≥ 50 → `'Pass'`

---

# **Question 4 — DQL**

## **1. Top 10 students with highest GPA**

Return: `stu_num`, `stu_fname`, `stu_lname`, `username`
Username format:
`lowercase(firstname).lowercase(first 3 chars of lastname)`

```sql
SELECT
    stu_num,
    stu_fname,
    stu_lname,
    gpa,
    CONCAT(LOWER(stu_fname), '.', LOWER(LEFT(stu_lname, 3))) AS username
FROM Student
ORDER BY gpa DESC
LIMIT 10;
```

---

## **2. List of departments with more than 2 student having GPA ≥ 2.0**

```sql
SELECT
    dept_code,
    COUNT(*) AS num_stu
FROM Student
WHERE gpa >= 2.0
GROUP BY dept_code
HAVING COUNT(*) > 2;
```

---

## **3. Virtual View: Courses with no classes**

```sql
CREATE VIEW CoursesWithoutClass AS
SELECT 
    c.course_code, 
    c.course_name
FROM Course c
LEFT JOIN Class cl
    ON c.course_code = cl.course_code
WHERE cl.course_code IS NULL;
```

---

## **4. Materialized View: Students with GPA lower than lowest GPA in “CIS”**

```sql
CREATE TABLE LowGPA_MatView AS
SELECT
    stu_num,
    stu_fname,
    stu_lname,
    gpa,
    dept_code
FROM Student
WHERE gpa < (
    SELECT MIN(gpa)
    FROM Student
    WHERE dept_code = 'CIS'
)
ORDER BY gpa ASC;
```

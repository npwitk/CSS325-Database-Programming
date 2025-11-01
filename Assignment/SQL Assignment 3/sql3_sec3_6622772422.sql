CREATE DATABASE IF NOT EXISTS activity12;
USE activity12;
-- This activity is just BASIC QUERY!!

-- PART 1: First we have to do 8-step transformation!

CREATE TABLE department(
    DNumber INT PRIMARY KEY AUTO_INCREMENT,
    DName VARCHAR(50),
    Location VARCHAR(50)
);

CREATE TABLE project(
    PNumber INT PRIMARY KEY AUTO_INCREMENT,
    PName VARCHAR(50),
    DNumber INT,
    FOREIGN KEY (DNumber) REFERENCES department(DNumber)
);

-- PART 2: Insert records
INSERT INTO department (DNumber, DName, Location) VALUES
(1, 'Administration', 'Houston'),
(4, 'Headquarters', 'Stafford'),
(5, 'Research', 'Irvine');

INSERT INTO project (PNumber, PName, DNumber) VALUES
(1, 'ProductX', 5),
(2, 'ProductY', 5),
(10, 'Computerization', 4),
(20, 'Recognization', 1);

-- PART 3: Query

-- Q1: Show name and location of all departments
SELECT DName, Location FROM department;

-- Q2: Show number and name of all projects
SELECT Pnumber, Pname FROM project;

-- Q3: Select name and location of department's number 5
SELECT DName, Location FROM department
WHERE DNumber = 5;

-- Q4: Select name of all departments located in Irvine
SELECT DName FROM department
WHERE Location = 'Irvine';

-- Q5: Select name of all projects in department's number 5
SELECT p.PName FROM project p
JOIN department d on p.DNumber = d.DNumber
WHERE d.DNumber = 5;

-- Q6: Select name of all projects in department's number 5 OR project number is larger than 15
SELECT p.PName, d.DName
FROM project p
JOIN department d ON p.DNumber = d.DNumber
WHERE p.DNumber = 5 OR p.PNumber > 15;

-- or you can do this way!
SELECT p.PName, d.DName
FROM project p
JOIN department d ON p.DNumber = d.DNumber
WHERE p.DNumber = 5

UNION

SELECT p.PName, d.DName
FROM project p
JOIN department d ON p.DNumber = d.DNumber
WHERE p.PNumber > 15;


-- Q7: Select name of all projects in department's number 5. The result should be sorted by name alphabetically
SELECT p.PName, d.DName
FROM project p
JOIN department d ON p.DNumber = d.DNumber
WHERE p.DNumber = 5
ORDER BY p.PName ASC;

-- Q8: Select project's name and department's name of all projects.
SELECT p.PName, d.DName
FROM project p
JOIN department d ON p.DNumber = d.DNumber;
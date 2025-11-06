-- Use tinycompany
USE tinycompany;

-- Bonus 1: Create virtual view for showing the top salary for M and F
-- Example of Final Exam (Easy Query)
CREATE VIEW vw_EmpTopSalary AS
SELECT
    sex,
    MAX(salary) AS maxSalary
FROM employee
GROUP BY sex
ORDER BY maxSalary DESC;

-- Bonus 2:
-- Create a stored procedure with input and output parameters
-- that returns the maximum salary of employees in each department.
CREATE PROCEDURE HighestSalaryInDept(IN DeptNo INTEGER, OUT TopSalary DECIMAL(12,2))
SELECT ROUND(salary, 2) INTO TopSalary
FROM employee
WHERE dept_no = DeptNo
ORDER BY salary DESC
LIMIT 1;

CALL HighestSalaryInDept(1, @High1);
SELECT @High1;
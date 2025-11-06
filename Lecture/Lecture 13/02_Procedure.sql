-- Use tinycompany
USE tinycompany;

-- PSM: Stored Procedure
CREATE PROCEDURE EmpDetail (IN DeptNo INTEGER) -- using INPUT parameter
SELECT CONCAT(fname, " ", lname) AS fullname,
       YEAR(CURDATE()) - YEAR(bdate) AS age
FROM employee
WHERE dept_no = DeptNo;

CALL EmpDetail(2);

-- Procedure with INPUT and OUTPUT value (Special case)
CREATE PROCEDURE DeptSize (IN DeptNo INTEGER, OUT TOTs INT)
SELECT COUNT(ssn) INTO TOTs
FROM employee
WHERE dept_no = DeptNo;

CALL DeptSize(1, @TOT_Get); -- Assign variable to accept the output
SELECT @TOT_Get;
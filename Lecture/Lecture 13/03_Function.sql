-- Use tinycompany
USE tinycompany;

-- Basic Stored Function
CREATE FUNCTION Hello(str CHAR(100))
RETURNS CHAR(100) DETERMINISTIC
RETURN CONCAT('Hello', ' ', str);

SELECT Hello('Google');

-- Stored Function
DELIMITER //
CREATE FUNCTION DeptSize(DeptNo INTEGER)
RETURNS INTEGER DETERMINISTIC
BEGIN
    DECLARE TOTEmp INT DEFAULT 0;
        SELECT COUNT(ssn) INTO TOTEmp
        FROM employee
        WHERE dept_no = DeptNo;
    RETURN TOTEmp;
END;
//
DELIMITER ;

SELECT DeptSize(2);

-- Function with Condition Construct
-- Example of Final Exam
DELIMITER //
CREATE FUNCTION DeptSize2(DeptNo INTEGER)
RETURNS VARCHAR(100) DETERMINISTIC
BEGIN
    DECLARE TOTEmp INT DEFAULT 0;
        SELECT COUNT(ssn) INTO TOTEmp
        FROM employee
        WHERE dept_no = DeptNo;
        IF TOTEmp > 10 THEN
            RETURN 'Big Department';
        ELSE
            RETURN 'Small Department';
        END IF;
END
//
DELIMITER ;

SELECT DeptSize2(2);
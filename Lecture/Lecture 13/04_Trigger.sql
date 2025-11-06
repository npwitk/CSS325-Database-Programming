-- Use tinycompany
USE tinycompany;

CREATE TABLE Student(
    SID INT NOT NULL,
    Name VARCHAR(100) NOT NULL
);

CREATE TABLE Student_BK(
    SID INT NOT NULL,
    Name VARCHAR(100) NOT NULL,
    Status VARCHAR(50) NOT NULL,
    PRIMARY KEY (SID, Name, Status)
);

-- Trigger
CREATE TRIGGER StudentBK
    AFTER INSERT
    ON Student
    FOR EACH ROW
    INSERT INTO Student_BK VALUES(NEW.SID, NEW.Name, 'After Inserted');

INSERT INTO Student VALUES(101, 'Mr.Ake');

-- Check
SELECT * FROM Student;
SELECT * FROM Student_BK;

-- Trigger (Before Delete)
CREATE TRIGGER StudentBK_Delete
    BEFORE DELETE
    ON Student
    FOR EACH ROW
    INSERT INTO Student_BK VALUES(OLD.SID, OLD.Name, 'After Deleted');


DELETE FROM Student WHERE SID = 101;

-- Check
SELECT * FROM Student_BK;
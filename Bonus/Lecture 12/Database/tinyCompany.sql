DROP DATABASE IF EXISTS tinycompany;
CREATE DATABASE IF NOT EXISTS tinycompany;
USE tinycompany;

-- Department Table
CREATE TABLE department(
	dnumber INT PRIMARY KEY, -- dnumber is a primary key
	dname VARCHAR(100) NOT NULL,
	location VARCHAR(100), -- location is nullable
	CONSTRAINT chk_dnumber CHECK (dnumber >= 1 AND dnumber <=20 )
	 -- dnumber range from 1 to 20
);

-- Project Table
CREATE TABLE project(
pnumber INT PRIMARY KEY, -- dnumber is a primary key
pname VARCHAR(50) NOT NULL,
dept_no INT NOT NULL,
CONSTRAINT FK_DeptProj FOREIGN KEY (dept_no)
 REFERENCES department(dnumber)
);
-- Employee Table
CREATE TABLE employee(
fname VARCHAR(20) NOT NULL,
lname VARCHAR(20) NOT NULL,
ssn CHAR(9) PRIMARY KEY,
bdate DATE NOT NULL,
sex CHAR(1) NOT NULL,
salary DECIMAL(12,2), -- salary is nullable
dept_no INT, -- dept_no is nullable
CONSTRAINT FK_EmpDept FOREIGN KEY (dept_no)
 REFERENCES department(dnumber)
);
-- Add a CHECK constraint for sex: only value 'M' or 'F' allowed
ALTER TABLE employee
ADD CONSTRAINT CHK_Gender CHECK (sex in ('M', 'F'));

-- Assignment Table
CREATE TABLE assignment(
	essn CHAR(9) NOT NULL,
	projno INT NOT NULL,
	hours DECIMAL(9,2), -- hours is nullable
	hourlyrate DECIMAL(9,2), -- hourlyrate is nullable
	CONSTRAINT FK_AsmEmp FOREIGN KEY (essn) REFERENCES employee(ssn),
	CONSTRAINT FK_AsmPrj FOREIGN KEY (projno)
	 REFERENCES project(pnumber),
	PRIMARY KEY (essn, projno)
);


-- DML Insert Data to all tables sequentially
INSERT INTO Department
VALUES 	
(1, "Accounting", "2A101 Fl.1"),
(2, "Human Resources", "2A104 Fl.1"),
(3, "Research and Development", "2B401 Fl.4"),
(4, "Information Technology", "2A404 Fl.4"),
(5, "Public Relations", "2B201 Fl.2"),
(6, "Administration", "2B301 Fl.3"),
(7, "Academic Services", "2B302 Fl.3");
 
INSERT INTO Employee 
VALUES 
("MaryJane", "Watson", 	"103849237", "1983-08-19", "F", 3400.40, 1),
("Peter", "Parker", 	"110033445", "1985-05-04", "M", 1800.50, 3), 
("Miles", "Morales", 	"230563445", "1990-08-31", "M", NULL, NULL),
("Jonah", "Jameson", 	"679373346", "1973-11-23", "M", NULL, NULL),
("Norman", "Osborn", 	"830384453", "1964-05-04", "M", 4000.50, 2),
("Harry", "Osborn", 	"834940344", "1990-08-31", "M", NULL, 3); 
  

INSERT INTO Project
VALUES 
(1, "APTX4869" , 3),
(2, "APTX4742" , 2),
(3, "APTX3948" , 3),
(4, "APTX0007" , 2),
(5, "APTX1412" , 1),
(6, "APTX1919" , 1),
(7, "APTX8383" , 4);


INSERT INTO Assignment
VALUES
("103849237", 1, 10, 55.00),
("103849237", 2, 10, 58.00),
("110033445", 1, 10, 50.50);



/* --------------------------------------------------------------
--   Please fill in your details in this comment block --  
--   Student ID: 6622772422
--   Fullname: Nonprawich Intakaew
--   Section: 3
------------------------------------------------------------- */

-- Drop and create the database
DROP DATABASE IF EXISTS tinycompany;
CREATE DATABASE IF NOT EXISTS tinycompany;
USE tinycompany;

-- Department Table
CREATE TABLE department (
    dnumber     INT PRIMARY KEY,                 -- Department number (PK)
    dname       VARCHAR(20) NOT NULL,            -- Department name
    location    VARCHAR(100),                    -- Nullable location
    CONSTRAINT chk_dnumber CHECK (dnumber >= 1 AND dnumber <= 20)
);

-- Project Table
CREATE TABLE project (
    pnumber     INT PRIMARY KEY,                 -- Project number (PK)
    pname       VARCHAR(50) NOT NULL,            -- Project name
    dept_no     INT NOT NULL,                    -- Department number (FK)
    CONSTRAINT FK_DeptProj FOREIGN KEY (dept_no)
        REFERENCES department(dnumber)
);

-- Employee Table
CREATE TABLE employee (
    fname       VARCHAR(20) NOT NULL,            -- First name
    lname       VARCHAR(20) NOT NULL,            -- Last name
    ssn         CHAR(9) PRIMARY KEY,             -- Social security number
    bdate       DATE NOT NULL,                   -- Birth date
    sex         CHAR(1) CHECK (sex IN ('M', 'F')),
    salary      DECIMAL(12,2),                   -- Salary
    dept_no     INT,                             -- Department number (FK)
    CONSTRAINT FK_DeptEmp FOREIGN KEY (dept_no)
        REFERENCES department(dnumber)
);

-- Assignment Table
CREATE TABLE assignment (
    essn        CHAR(9),                         -- Employee SSN (FK)
    proj_no     INT,                             -- Project number (FK)
    hours       DECIMAL(9,2),                    -- Hours worked
    hourly_rate DECIMAL(9,2),                    -- Hourly rate
    PRIMARY KEY (essn, proj_no),
    CONSTRAINT FK_AssEmp FOREIGN KEY (essn)
        REFERENCES employee(ssn),
    CONSTRAINT FK_AssProj FOREIGN KEY (proj_no)
        REFERENCES project(pnumber)
);



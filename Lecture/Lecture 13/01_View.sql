-- Use tinycompany
USE tinycompany

-- Type 1: Virtual View
CREATE VIEW vw_EmpAge AS
SELECT CONCAT(fname, " ", lname) AS fullname,
       YEAR(CURDATE()) - YEAR(bdate) AS age
FROM employee
ORDER BY age;


-- Type 2: Materialized View
CREATE TABLE mVW_EmpAge AS
SELECT CONCAT(fname, " ", lname) AS fullname,
       YEAR(CURDATE()) - YEAR(bdate) AS age
FROM employee
ORDER BY age;

-- Data Warehouse Concept:
-- The DBMS (operational database) contains the current, up-to-date data used in daily operations.
-- When new data is added or existing data changes, it is stored in the operational database.
-- A Data Warehouse (DW), on the other hand, stores historical data — for example,
-- if an employee graduates or leaves the company, their records may be archived in the DW.
-- The DW is used mainly for analysis, reporting, and long-term data storage.

-- Materialized View:
-- A Materialized View can be used when combining (joining) data from the Data Warehouse (DW)
-- with data from the operational database. It stores the query result physically,
-- so accessing combined or precomputed data is much faster.

-- Star Schema:
-- A Star Schema is a common structure used in Data Warehouses.
-- It consists of one central "Fact Table" that stores measurable, numeric data (e.g., sales, revenue),
-- and multiple surrounding "Dimension Tables" that store descriptive attributes (e.g., time, product, customer).
-- The schema looks like a star — the Fact Table is at the center, and the Dimension Tables branch out like points.

-- Implementation:
-- When using summarized data, you can apply aggregation functions (e.g., SUM, AVG, COUNT)
-- to generate a new summarized table.
-- This summarized table can also be implemented as a Materialized View,
-- allowing you to store and reuse the precomputed results efficiently.

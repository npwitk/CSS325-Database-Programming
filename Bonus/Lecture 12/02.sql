-- Use tinycompany

-- Find all employees and their cooresponding assigned project
SELECT * FROM employee e
INNER JOIN assignment a on e.ssn = a.essn
INNER JOIN project p on a.projno = p.pnumber;

-- Find all projects that do not have any employee assigned
SELECT p.pnumber, p.pname
FROM project p
LEFT JOIN assignment a
    ON p.pnumber = a.projno
WHERE a.projno IS NULL;

-- Find all male employee that do not have any project assigned
SELECT e.fname, e.lname, e.sex
FROM employee e
LEFT JOIN assignment a
    ON e.ssn = a.essn
WHERE e.sex = 'M'
  AND a.essn IS NULL;

-- Find all employee and the number of projects (if any)
SELECT e.fname, e.lname, COUNT(DISTINCT a.projno) AS numproj FROM employee e
LEFT OUTER JOIN assignment a on e.ssn = a.essn
GROUP BY e.fname, e.lname
ORDER BY numproj DESC;

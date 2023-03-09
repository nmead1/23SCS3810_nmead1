-- CS3810: Principles of Database Systems
-- Instructor: Thyago Mota
-- Description: The employees database

-- TODO: create database employees

CREATE DATABASE employees;

\c employees

-- TODO: create table departments

CREATE TABLE departments (
    code VARCHAR(2) primary key,
    "desc" VARCHAR(25)
);

-- TODO: populate table departments

INSERT INTO departments VALUES
    ('HR', 'Human Resources'),
    ('IT', 'Information Technology'),
    ('SL', 'Sales');

INSERT INTO departments VALUES
    ('MK', 'Marketing');

-- TODO: create table employees

CREATE TABLE employees (
    id serial primary key,
    name VARCHAR(100),
    sal INT,
    deptCode VARCHAR(2),
    FOREIGN KEY (deptCode) REFERENCES
    departments(code)
);

-- TODO: populate table Employees

INSERT INTO employees (name, sal, deptCode) VALUES
('Sam Mai Tai', 50000, 'HR'),
('James Brandy', 55000, 'HR'),
('Whisky Strauss', 60000, 'HR'),
('Romeo Curacau', 65000, 'IT'),
('Jose Caipirinha', 65000, 'IT'),
('Tony Gin and Tonic', 80000, 'SL'),
('Debby Derby', 85000, 'SL'),
('Morbid Mojito', 150000, NULL);


-- TODO: a) list all rows in Departments.

SELECT * FROM departments;

-- TODO: b) list only the codes in Departments.

SELECT code FROM departments;

-- TODO: c) list all rows in Employees.

SELECT * FROM  employees;

-- TODO: d) list only the names in Employees in alphabetical order.

SELECT name FROM employees
ORDER BY name;

-- TODO: e) list only the names and salaries in Employees, from the highest to the lowest salary.

SELECT name, sal FROM employees
ORDER BY sal DESC;

-- TODO: f) list the cartesian product of Employees and Departments.

SELECT * FROM employees, departments;

-- TODO: g) do the natural join of Employees and Departments; the result should be exactly the same as the cartesian product; do you know why?

SELECT * FROM employees E
NATURAL JOIN departments D;

-- TODO: i) do an equi join of Employees and Departments matching the rows by Employees.deptCode and Departments.code (hint: use JOIN and the ON clause).

-- Theta Join
SELECT * FROM employees E, departments d
WHERE E.deptCode = D.code;

-- Inner Join
SELECT * FROM employees E
JOIN departments D
ON E.deptCode = D.code;

-- TODO: j) same as previous query but project name and salary of the employees plus the description of their departments.

SELECT E.name, E.sal, D.desc FROM employees E
JOIN departments D
ON E.deptCode = D.code;

-- TODO: k) same as previous query but only the employees that earn less than 60000.

SELECT E.name, E.sal, D.desc FROM employees E
INNER JOIN departments D
ON E.deptCode = D.code
WHERE sal < 60000;

-- TODO: l) same as query ‘i’  but only the employees that earn more than ‘Jose Caipirinha’.

SELECT * FROM employees E
JOIN departments D
ON E.deptCode = D.code
WHERE sal > (SELECT sal FROM employees E where name = 'Jose Caipirinha');

-- TODO: m) list the left outer join of Employees and Departments (use the ON clause to match by department code); how does the result of this query differs from query ‘i’?

SELECT * FROM employees E
LEFT JOIN departments D
ON E.deptCode = D.code;

-- TODO: n) from query ‘m’, how would you do the left anti-join?

SELECT * FROM employees E
WHERE deptCode IS NULL;

-- TODO: o) show the number of employees per department.

SELECT 
CASE
    WHEN E.deptCode IS NULL THEN 'NULL' 
    ELSE E.deptCode
    END code,
COUNT(*) FROM employees E
LEFT OUTER JOIN departments D
ON E.deptCode = D.code
GROUP BY E.deptCode
ORDER BY E.deptCode;

-- TODO: p) same as query ‘o’ but I want to see the description of each department (not just their codes).

SELECT 
CASE
    WHEN E.deptCode IS NULL THEN 'NULL' 
    ELSE E.deptCode
    END code,
CASE
    WHEN E.deptCode IS NULL THEN 'NULL' 
    ELSE D.desc
    END,
COUNT(*) FROM employees E
LEFT OUTER JOIN departments D
ON E.deptCode = D.code
GROUP BY E.deptCode, D.desc
ORDER BY E.deptCode;

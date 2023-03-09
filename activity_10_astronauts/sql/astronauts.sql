-- CS3810: Principles of Database Systems
-- Instructor: Thyago Mota
-- Description: The astronauts database

CREATE DATABASE astronauts;

\c astronauts

CREATE TABLE Astronauts (
    id SERIAL primary key,
    lastName VARCHAR(30) NOT NULL,
    firstName VARCHAR(30) NOT NULL,
    suffix VARCHAR(4),
    gender VARCHAR(1) NOT NULL,
    birth DATE NOT NULL,
    city VARCHAR(16), 
    state VARCHAR(20),
    country VARCHAR(11),
    status VARCHAR(7),
    daysInSpace INT NOT NULL,
    Flights INT NOT NULL
);

\copy astronauts 
    (lastName,firstName,suffix,gender,birth,city,state,country,status,daysInSpace,Flights)
     from /var/lib/postgresql/data/astronauts.csv DELIMITER ',' CSV HEADER;

-- a) the total number of astronauts. 
SELECT COUNT(*) FROM Astronauts;

-- b) the total number of American astronauts. 
SELECT COUNT(*) FROM Astronauts
WHERE country = 'USA';

-- c) the list of nationalities of all astronauts in alphabetical order. 
SELECT DISTINCT country FROM Astronauts ORDER BY country;

-- d) all astronaut names ordered by last name (use the format Last Name, First Name, Suffix to display the names). 
SELECT CONCAT(lastName, ', ', firstName, ', ', suffix) as name FROM Astronauts
ORDER BY lastName;

-- e) the total number of astronauts by gender. 
SELECT gender, COUNT(*) FROM Astronauts
GROUP BY gender;

-- f) the total number of female astronauts that are still active. 
SELECT COUNT(*) FROM Astronauts
WHERE gender = 'F' AND status = 'Active';

-- g) the total number of American female astronauts that are still active. 

SELECT COUNT(*) FROM Astronauts
WHERE gender = 'F' AND country = 'USA' AND status = 'Active';

-- h) the list of all American female astronauts that are still active ordered by last name (use the same name format used in d). 
SELECT CONCAT(lastName, ', ', firstName, ', ', suffix) as name FROM Astronauts
WHERE gender = 'F' AND country = 'USA' AND status = 'Active'
ORDER BY lastName;

-- i) the list of Chinese astronauts, displaying only their names and ages (use the same name format used in d). 
SELECT CONCAT(lastName, ', ', firstName, ', ', suffix) as name, birth, DATE_PART('year', AGE(birth)) AS age FROM Astronauts
WHERE country = 'China'
ORDER BY lastName;

-- j) the total number of astronauts by country. 

SELECT Country, COUNT(*) FROM Astronauts
GROUP BY COUNTRY
ORDER BY COUNTRY;

-- k) the total number of American astronauts per state ordered by the totals in
-- descending order. 

SELECT state, Count(*) as totals FROM Astronauts
WHERE country = 'USA'
GROUP BY state
ORDER BY totals DESC;

-- l) the total number of astronauts by statuses (i.e., active or retired). 

SELECT status, COUNT(*) AS totals FROM astronauts
GROUP BY status;

-- m) name and age of all non-American astronauts in alphabetical order (use the same name format used in d). 

SELECT CONCAT(lastName, ', ', firstName) as name, birth, DATE_PART('year', AGE(birth)) AS age FROM Astronauts
WHERE country != 'USA'
ORDER BY lastName;

-- n) the average age of all American astronauts that are still active.
SELECT TRUNC(AVG(DATE_PART('year', AGE(birth)))) as "avg age" FROM Astronauts
WHERE status = 'Active' AND country = 'USA';
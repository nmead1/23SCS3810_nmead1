-- CS3810: Principles of Database Systems
-- Instructor: Thyago Mota
-- Student: Nathan Mead
-- Description: a database of occupations

CREATE DATABASE occupations;

\c occupations

DROP TABLE IF EXISTS Occupations;

-- TODO: create table Occupations

CREATE TABLE Occupations (
    code VARCHAR(10) primary key,
    occupation VARCHAR(110),
    jobFamily VARCHAR(50)
);

-- TODO: populate table Occupations

\copy occupations (code, occupation, jobFamily) from /var/lib/postgresql/data/occupations.csv DELIMITER ',' CSV HEADER;

-- TODO: a) the total number of occupations (expect 1016).

SELECT COUNT(*) as Total FROM occupations;

-- TODO: b) a list of all job families in alphabetical order (expect 23).

SELECT DISTINCT jobFamily FROM occupations
    ORDER BY jobFamily;

-- TODO: c) the total number of job families (expect 23)

SELECT COUNT(DISTINCT jobFamily) FROM occupations;

-- TODO: d) the total number of occupations per job family in alphabetical order of job family.

SELECT DISTINCT jobFamily, COUNT(*) as TOTAL FROM occupations
    GROUP BY jobFamily
    ORDER BY jobFamily;

-- TODO: e) the number of occupations in the "Computer and Mathematical" job family (expect 38)

SELECT DISTINCT jobFamily, COUNT(*) as TOTAL FROM occupations
    WHERE jobFamily = 'Computer and Mathematical'
    GROUP BY jobFamily;

-- BONUS POINTS

-- TODO: f) an alphabetical list of occupations in the "Computer and Mathematical" job family.

SELECT * FROM Occupations
WHERE jobFamily = 'Computer and Mathematical'
ORDER BY occupation;

-- TODO: g) an alphabetical list of occupations in the "Computer and Mathematical" job family that begins with the word "Database"


SELECT * FROM Occupations
WHERE jobFamily = 'Computer and Mathematical' AND occupation LIKE 'Database%'
ORDER BY occupation;
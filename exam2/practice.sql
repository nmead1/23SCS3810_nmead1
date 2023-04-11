CREATE DATABASE Exam2;

\c exam2

CREATE TABLE Manufacturers (
    code INT PRIMARY KEY,
    description VARCHAR(100) NOT NULL
);

INSERT INTO Manufacturers VALUES
(101, 'Ford'),
(202, 'Honda');

CREATE TABLE Models (
    manufactureCode INT,
    number SERIAL NOT NULL,
    name VARCHAR(100) NOT NULL,
    FOREIGN KEY (ManufactureCode) REFERENCES Manufacturers(code),
    PRIMARY KEY(ManufactureCode, number)
);

INSERT INTO Models VALUES
(101, 1, 'F1-150'),
(101, 2, 'Ranger'),
(202, 1, 'Pilot');

SELECT COUNT(*) FROM Models;

SELECT Mo.name, Mu.description FROM Models as MO
INNER JOIN Manufacturers as MU
ON Mo.manufactureCode = Mu.code;

SELECT Mu.description, COUNT(Mo.name) AS models FROM Manufacturers AS MU
INNER JOIN Models AS Mo
ON Mu.code = Mo.manufactureCode
GROUP BY Mu.code;


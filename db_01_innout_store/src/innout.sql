-- CS3810: Principles of Database Systems
-- Instructor: Thyago Mota
-- Student(s): Nathan Mead, Mitchell Thompson
-- Description: SQL for the In-N-Out Store

DROP DATABASE innout;

CREATE DATABASE innout;

\c innout

-- TODO: table create statements

CREATE TABLE Customers (
    id SERIAL PRIMARY KEY NOT NULL,
    name VARCHAR(100) NOT NULL,
    gender CHAR(1) DEFAULT '?'
);

CREATE TABLE Categories (
    code CHAR(3) PRIMARY KEY NOT NULL,
    description VARCHAR(100) NOT NULL
);

CREATE TABLE Items (
    id SERIAL PRIMARY KEY,
    description VARCHAR(100) NOT NULL,
    price FLOAT NOT NULL,
    category_code VARCHAR(3) DEFAULT NULL,
    FOREIGN KEY (category_code) REFERENCES Categories(code)
);

CREATE TABLE Sales (
    id SERIAL Primary Key NOT NULL,
    quantity INT NOT NULL,
    total FLOAT NOT NULL,
    date DATE NOT NULL,
    time TIME NOT NULL,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customers(id)
);

CREATE TABLE Purchases (
    sales_id INT NOT NULL,
    FOREIGN KEY (sales_id) REFERENCES Sales(id),
    item_id INT NOT NULL,
    FOREIGN KEY (item_id) REFERENCES Items(id),
    qty INT,
    item_price FLOAT NOT NULL,
    PRIMARY KEY(sales_id, item_id)
);

-- TODO: table insert statements

INSERT INTO Customers (name, gender) VALUES
('Nathan', 'M'),
('Mitchell', 'M'),
('Brea', 'F'),
('Avery', 'M');

INSERT INTO Customers (name) VALUES
('Blorgen');

INSERT INTO Categories (code, description) VALUES
('BVR', 'Beverages'),
('DRY', 'Dairy'),
('PRD', 'Produce (Fruits and Vegetables)'),
('FRZ', 'Frozen'),
('BKY', 'Bakery'),
('MEA', 'Meat');

INSERT INTO Items (description, price, category_code) VALUES 
('Arizona Tea', 0.99, 'BVR'),
('Whole Milk Glon', 4.79, 'DRY'),
('Pepperoni Pizza', 8.49, 'FRZ'),
('Everything Bagels', 6.49, 'BKY'),
('Blueberry Yogurt', 3.39, 'DRY'),
('Sliced Ham', 5.49, 'MEA');

INSERT INTO Items(description, price) VALUES
('Gum', 1.99);

INSERT INTO Sales (quantity, total, date, time, customer_id) VALUES
(5, 24.15, '2023-3-15', '10:00', 1),
(2, 7.48, '2023-3-14', '13:00', 2),
(3, 17.37, '2023-2-28', '08:00', 4);

INSERT INTO Purchases (sales_id, item_id, item_price) VALUES
(1, 1, .99), (1, 2, 4.79), (1, 3, 8.49), (1, 4, 6.49), (1, 5, 3.39),
(2, 6, 5.49), (2, 7, 1.99),
(3, 3, 8.49), (3, 5, 3.39), (3, 6, 5.49);

-- TODO: SQL queries

-- a) all customer names in alphabetical order
SELECT name FROM Customers 
ORDER BY name ASC;

-- b) number of items (labeled as total_items) in the database 
SELECT COUNT(*) AS total_items FROM Items;

-- c) number of customers (labeled as number_customers) by gender

SELECT gender, count(gender) as number_customers from Customers
GROUP BY gender
ORDER BY gender;

-- d) a list of all item codes (labeled as code) and descriptions (labeled as description) followed by their category descriptions (labeled as category) in numerical order of their codes (items that do not have a category should not be displayed)

SELECT I.id, I.description, C.description as category FROM Items I
LEFT JOIN Categories C
ON I.category_code = C.code
WHERE C.description IS NOT NULL
ORDER BY I.id;

-- e) a list of all item codes (labeled as code) and descriptions (labeled as description) in numerical order of their codes for the items that do not have a category

SELECT I.id, I.description FROM Items I
WHERE I.category_code IS NULL
ORDER BY I.id;

-- f) a list of the category descriptions (labeled as category) that do not have an item in alphabetical order

SELECT C.description as category FROM Categories C
LEFT JOIN Items I
ON C.code = I.category_code
WHERE I.category_code IS NULL
ORDER BY C.description;

-- g) set a variable named "ID" and assign a valid customer id to it; then show the content of the variable using a select statement

\set ID 2

SELECT * FROM Customers
WHERE id = :'ID';

-- h) a list describing all items purchased by the customer identified by the variable "ID" (you must used the variable), showing, the date of the purchase (labeled as date), the time of the purchase (labeled as time and in hh:mm:ss format), the item's description (labeled as item), the quantity purchased (labeled as qtt), the item price (labeled as price), and the total amount paid (labeled as total_paid).

SELECT C.name, S.date, S.time, I.description as item, S.quantity as qtt, P.item_price as price, S.total as total_paid  FROM PURCHASES P
LEFT JOIN  Customers C
ON P.customer_id = C.id
LEFT JOIN Sales S
ON P.sales_id = S.id
LEFT JOIN Items I
ON P.item_id = I.id
WHERE P.customer_id = :'ID';

-- i) the total amount of sales per day showing the date and the total amount paid in chronological order

SELECT COUNT(id), date, SUM(total) FROM Sales
GROUP BY date
ORDER BY date;

-- j) the description of the top item (labeled as item) in sales with the total sales amount (labeled as total_paid)


-- k) the descriptions of the top 3 items (labeled as item) in number of times they were purchased, showing that quantity as well (labeled as total)

-- l) the name of the customers who never made a purchase 
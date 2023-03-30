CREATE DATABASE orders;

\c orders

CREATE TABLE Orders (
    number INT PRIMARY KEY,
    date date
);

CREATE TABLE Products (
    id SERIAL PRIMARY KEY,
    descr VARCHAR(25),
    price DECIMAL(10, 2) NOT NULL,
    CHECK (price >=0)
);

CREATE TABLE Items (
    orderNum INT NOT NULL,
    productId INT NOT NULL,
    PRIMARY KEY(orderNum, productId),
    qtt INT
);

INSERT INTO Products (descr, price) VALUES
('Ninja Sword', 250.00),
('Dummy', 50.00),
('Fake Blood', 5.00),
('Rubber Ducky', 1.00),
('Bathtub Soap', 3.00),
('Brazilian Coffee', 5.00),
('Runnying Shoes', 50.00);

INSERT INTO Orders (number, date) VALUES
use ecommerce;
select database();
create database ecommerce;
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    City VARCHAR(50)
);
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    Amount DECIMAL(10,2),
    FOREIGN KEY (CustomerID)
    REFERENCES Customers(CustomerID)
);
INSERT INTO Customers VALUES
(1,'John','New York'),
(2,'Alice','Chicago'),
(3,'Bob','Dallas');

INSERT INTO Orders VALUES
(101,1,'2024-01-10',500),
(102,2,'2024-01-15',300),
(103,1,'2024-02-01',700),
(104,3,'2024-02-10',200);
SELECT * FROM Customers;
SELECT * FROM Orders WHERE Amount > 300;
SELECT * FROM Orders
ORDER BY Amount DESC;
SELECT CustomerID ;
show tables;
SELECT Customers.CustomerName,
Orders.OrderID,
Orders.Amount
FROM Customers
INNER JOIN Orders
ON Customers.CustomerID = Orders.CustomerID;
SELECT *
FROM Orders
WHERE Amount >
(
SELECT AVG(Amount)
FROM Orders
);
SELECT SUM(Amount) AS TotalSales
FROM Orders;
SELECT AVG(Amount) AS AverageSales
FROM Orders;
CREATE VIEW CustomerSales AS
SELECT Customers.CustomerName,
SUM(Orders.Amount) AS TotalSales
FROM Customers
JOIN Orders
ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.CustomerName;
SELECT * FROM CustomerSales;
CREATE INDEX idx_customer
ON Orders(CustomerID);






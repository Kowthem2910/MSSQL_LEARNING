USE TechShop;

CREATE TABLE Customers(
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    Email VARCHAR(255)UNIQUE,
    Phone VARCHAR(20) ,
    Address VARCHAR(50) 
)

INSERT INTO Customers VALUES (1, 'John', 'Cena', 'johncena@example.com', '1770100', 'street')
INSERT INTO Customers VALUES(2, 'Mich', 'Smith', 'michsmith@example.com', '1760101', 'area')
INSERT INTO Customers VALUES(3, 'Michael', 'Johnson', 'michaeljohnson@example.com', '1110102', 'indore st')
INSERT INTO Customers VALUES(4, 'Elisa', 'Perry', 'elisa@example.com', '2120103', 'Maple St')
INSERT INTO Customers VALUES(5, 'Mark', 'Brown', 'markbrown@example.com', '7890104', 'Gotham St')
INSERT INTO Customers VALUES(6, 'Robert', 'Brown', 'robertbrown@example.com', '5550105', '987 Long St')
INSERT INTO Customers VALUES(7, 'David', 'Miller', 'davidmiller@example.com', '5550106', 'Small St')
INSERT INTO Customers VALUES(8, 'Tim', 'David', 'timdavid@example.com', '5550107', 'blue St')
INSERT INTO Customers VALUES(9, 'Dean', 'Ambrose', 'deanambrose@example.com', '5550108', ' white St')
INSERT INTO Customers VALUES(10, 'Roman', 'Reigns', 'romanreigns@example.com', '5522109',  'black St');

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(255),
    Description VARCHAR(50),
    Price INT
);

INSERT INTO Products VALUES (12, 'The Jungle Book', 'Interesting Novel', 180,3)
INSERT INTO Products VALUES (13, 'Computer Table', 'Easy to work', 1550,2)
INSERT INTO Products VALUES  (9, 'Smartphone', 'Latest smartphone', 999)
INSERT INTO Products VALUES (10, 'SmartWatch', 'World at your Wrist', 130);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
INSERT INTO Orders VALUES (5, 5, '2023-04-07', 900)
INSERT INTO Orders VALUES (6, 6, '2023-04-08', 1800)
INSERT INTO Orders VALUES  (11, 6, '2023-04-15', 13000,'PENDING')
INSERT INTO Orders VALUES (9, 9, '2024-03-21', 4999);


CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT REFERENCES Orders(OrderID),
    ProductID INT REFERENCES Products(ProductID),
    Quantity INT,
);

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity) VALUES
(1, 1, 1, 1),
(2, 1, 2, 2),
(3, 2, 3, 1),
(4, 2, 4, 3),
(5, 3, 5, 3),
(6, 4, 6, 2),
(7, 5, 7, 4),
(8, 6, 8, 2),
(9, 7, 9, 1),
(10, 8, 10, 1);
INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity) VALUES(11,3,8, 1)


CREATE TABLE Inventory (
    InventoryID INT PRIMARY KEY,
    ProductID INT REFERENCES Products(ProductID),
    QuantityInStock INT,
    LastStockUpdate DATE,
);

INSERT INTO Inventory (InventoryID, ProductID, QuantityInStock, LastStockUpdate) VALUES
(1, 1, 50, '2024-02-01'),
(2, 2, 100, '2024-03-01'),
(3, 3, 75, '2024-04-04'),
(4, 4, 35, '2024-02-14'),
(5, 5, 70, '2023-01-21'),
(6, 6, 20, '2024-01-11'),
(7, 7, 28, '2024-01-01'),
(8, 8, 55, '2024-03-20'),
(9, 9, 45, '2024-03-10'),
(10, 10, 100, '2024-02-11');

--TASK-2

--Write an SQL query to retrieve the names and emails of all customers.

SELECT CONCAT(FirstName,'',LastName) as Name,Email
FROM Customers;

--Write an SQL query to list all orders with their order dates and corresponding customer names.

SELECT CONCAT(c.FirstName,'',c.LastName) as Customer_Names, o.OrderDate
FROM Customers c INNER JOIN Orders o
ON c.CustomerID = o.CustomerID;

--Write an SQL query to insert a new customer record into the "Customers" table. Include
--customer information such as name, email, and address.

INSERT INTO Customers VALUES(11, 'Steve', 'Smith', 'steve@mail.com', '123456', ' aussie street');

--Write an SQL query to update the prices of all electronic gadgets in the "Products" table by
--increasing them by 10%.

UPDATE Products SET Price = Price * 1.10;

--Write an SQL query to delete a specific order and its associated order details from the
--"Orders" and "OrderDetails" tables. Allow users to input the order ID as a parameter.

DECLARE @InputOrderID INT; 
SET @InputOrderID = 1;
DELETE FROM OrderDetails
WHERE OrderID = @InputOrderID;
DELETE FROM Orders
WHERE OrderID = @InputOrderID;

--Write an SQL query to insert a new order into the "Orders" table. Include the customer ID,
--order date, and any other necessary information.

INSERT INTO Orders VALUES (11, 3, '2023-07-07', 7300);

--Write an SQL query to update the contact information (e.g., email and address) of a specific
--customer in the "Customers" table. Allow users to input the customer ID and new contact
--information.

DECLARE @InputCustomerID INT;
DECLARE @InputEmail VARCHAR(255);
DECLARE @InputAddress VARCHAR(255);
SET @InputCustomerID=7;
SET @InputEmail='dhoni@example.com';
SET @InputAddress='Ranchi St';
UPDATE Customers
SET 
Email=@InputEmail,
Address=@InputAddress
WHERE CustomerID=@InputCustomerID;

--Write an SQL query to recalculate and update the total cost of each order in the "Orders"
--table based on the prices and quantities in the "OrderDetails" table.

UPDATE Orders
SET TotalAmount = ( 
SELECT SUM(od.Quantity * p.Price)
FROM OrderDetails od
INNER JOIN Products p ON od.ProductID = p.ProductID
WHERE od.OrderID = Orders.OrderID
)

--Write an SQL query to delete all orders and their associated order details for a specific
--customer from the "Orders" and "OrderDetails" tables. Allow users to input the customer ID
--as a parameter.

DECLARE @InputCustomerID INT;
SET @InputCustomerID = 3;
DELETE FROM OrderDetails
WHERE OrderID IN (SELECT OrderID FROM Orders WHERE CustomerID = @InputCustomerID);
DELETE FROM Orders
WHERE CustomerID = @InputCustomerID;

--Write an SQL query to insert a new electronic gadget product into the "Products" table,
--including product name, category, price, and any other relevant details.

INSERT INTO Products VALUES (11, 'Speaker', 'Sound Quality', 1800)


--Write an SQL query to update the status of a specific order in the "Orders" table (e.g., from
--"Pending" to "Shipped"). Allow users to input the order ID and the new status.

SELECT * FROM Orders
ALTER TABLE Orders ADD Status VARCHAR(20)
UPDATE Orders SET status= 'SHIPPED' Where OrderID=10
UPDATE Orders SET CategoryID = 2 WHERE OrderID = 10
DECLARE @InputOrderID INT;
DECLARE @InputNewStatus VARCHAR(20);
SET @InputOrderID = 4
SET @InputNewStatus='SHIPPED'
UPDATE Orders 
SET status = @InputNewStatus WHERE OrderID=@InputOrderID;

--Write an SQL query to calculate and update the number of orders placed by each customer
--in the "Customers" table based on the data in the "Orders" table.


SELECT c.CustomerID,c.FirstName,c.LastName,COUNT(o.OrderID) AS NumberOfOrders
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName;

--TASK-3

--Write an SQL query to retrieve a list of all orders along with customer information (e.g.,
--customer name) for each order.

SELECT o.OrderID, CONCAT(FirstName,'',LastName) as Name,o.OrderDate, o.TotalAmount,c.CustomerID, c.Email
FROM Customers c
INNER JOIN Orders o ON o.CustomerID = c.CustomerID

--Write an SQL query to find the total revenue generated by each electronic gadget product.
--Include the product name and the total revenue.
	
SELECT p.ProductID,p.ProductName, p.Price,SUM(od.Quantity * p.Price) AS TotalRevenue
FROM OrderDetails od
INNER JOIN Products p ON od.ProductID = p.ProductID
INNER JOIN Orders o ON od.OrderID = o.OrderID
GROUP BY p.ProductName,p.ProductID,p.Price

--Write an SQL query to list all customers who have made at least one purchase. Include their
--names and contact information.

SELECT CONCAT(c.FirstName,' ',c.LastName) as Name, c.Email, c.Phone
FROM Customers c
INNER JOIN Orders o 
ON c.CustomerID = o.CustomerID;

--Write an SQL query to find the most popular electronic gadget, which is the one with the highest
--total quantity ordered. Include the product name and the total quantity ordered.

SELECT TOP 1 p.ProductID,p.ProductName, SUM(od.Quantity) AS "TotalQuantityOrdered"
FROM OrderDetails od
INNER JOIN Products p
ON od.ProductID = p.ProductID
GROUP BY p.ProductID,p.ProductName
ORDER BY TotalQuantityOrdered DESC;

--Write an SQL query to retrieve a list of electronic gadgets along with their corresponding categories.

CREATE TABLE Categories(CategoryID INT PRIMARY KEY, Category_Name VARCHAR(20))
INSERT INTO Categories VALUES(3,'Books')
ALTER TABLE Products ADD CategoryID INT REFERENCES Categories(CategoryID)
UPDATE Products SET CategoryID=1 WHERE ProductID=11
SELECT p.ProductName,c.Category_Name 
FROM Products p
INNER JOIN Categories c
ON p.CategoryID = c.CategoryID;

--Write an SQL query to calculate the average order value for each customer. Include the
--customer's name and their average order value.

SELECT c.FirstName, c.LastName, AVG(o.TotalAmount) AS Average_Order_Value
FROM Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName;

--Write an SQL query to find the order with the highest total revenue. Include the order ID,
--customer information, and the total revenue.

SELECT TOP 1 o.OrderID, c.FirstName, c.LastName, o.TotalAmount AS TotalRevenue
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
ORDER BY o.TotalAmount DESC;

--Write an SQL query to list electronic gadgets and the number of times each product has been
--ordered.

SELECT p.ProductName, COUNT(od.OrderDetailID) AS OrderCount
FROM Products p
LEFT JOIN OrderDetails od ON p.ProductID = od.ProductID
GROUP BY p.ProductID, p.ProductName;

--Write an SQL query to find customers who have purchased a specific electronic gadget product.
--Allow users to input the product name as a parameter.

DECLARE @ProductName VARCHAR(20);
SET @ProductName = 'SmartPhone';
SELECT c.CustomerID,c.FirstName,c.LastName,c.Email,c.Phone,c.Address
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
WHERE p.ProductName = @ProductName;

--Write an SQL query to calculate the total revenue generated by all orders placed within a
--specific time period. Allow users to input the start and end dates as parameters.

DECLARE @InputStartDate DATE;
SET @InputStartDate = '2023-04-01';
DECLARE @InputEndDate DATE;
SET @InputEndDate = '2023-04-07';
SELECT SUM(TotalAmount) AS TotalRevenue
FROM Orders
WHERE OrderDate>= @InputStartDate AND OrderDate <= @InputEndDate;

--TASK-4

--1. Write an SQL query to find out which customers have not placed any orders.

  SELECT c.FirstName,c.LastName,c.Address FROM Customers c
  WHERE c.CustomerID NOT IN(
      SELECT o.CustomerID
	  FROM Orders o
  )

--2. Write an SQL query to find the total number of products available for sale.

SELECT SUM(QuantityInStock) AS TotalProductsAvailable
FROM Inventory;

--3.Write an SQL query to calculate the total revenue generated by TechShop.


SELECT SUM(TotalAmount) AS TotalRevenue
FROM Orders;

--4.Write an SQL query to calculate the average quantity ordered for products in a specific category.
--Allow users to input the category name as a parameter.

DECLARE @Name VARCHAR(30);
SET @Name = 'ELECTRONICS';

SELECT AVG(od.Quantity) AS AVERGAGE_QUANTITY_ORDERED FROM OrderDetails od
WHERE od.ProductID IN
(SELECT p.ProductID FROM Products p
INNER JOIN Categories c on c.CategoryID=p.CategoryID
where c.Category_Name= @Name);

--5.Write an SQL query to calculate the total revenue generated by a specific customer. Allow users
--to input the customer ID as a parameter.

DECLARE @CustomerID INT;
SET @CustomerID = 5;

SELECT SUM(TotalAmount) AS Total_Revenue
FROM Orders
WHERE CustomerID = 
(
  SELECT CustomerID
  FROM Customers
  WHERE CustomerID = @CustomerID
);
SELECT * FROM Orders

--6.Write an SQL query to find the customers who have placed the most orders. List their names
--and the number of orders they've placed.

SELECT c.FirstName, c.LastName, 
(
	SELECT COUNT(o.OrderID)
	FROM Orders o
	WHERE o.CustomerID = c.CustomerID
	GROUP BY o.CustomerID
) AS NO_OF_ORDERS_PLACED
FROM Customers c
ORDER BY NO_OF_ORDERS_PLACED DESC;

--7.Write an SQL query to find the most popular product category, which is the one with the highest
--total quantity ordered across all orders.
SELECT TOP 1
Category_Name,
(
SELECT SUM(od.Quantity)
FROM OrderDetails od
INNER JOIN Products p ON p.ProductID = od.ProductID
INNER JOIN Categories ca ON ca.CategoryID = p.CategoryID
WHERE c.CategoryID = ca.CategoryID
GROUP BY ca.CategoryID
) AS TOTAL_QUANTITY
FROM Categories c
ORDER BY TOTAL_QUANTITY DESC;


--8. Write an SQL query to find the customer who has spent the most money (highest total revenue)
--on electronic gadgets. List their name and total spending.

SELECT TOP 1 c.FirstName,c.lastName,SUM(od.Quantity * p.Price) AS Money_Spent
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
JOIN Categories cat ON p.CategoryID = cat.CategoryID
WHERE cat.Category_Name = 'Electronics'
GROUP BY c.CustomerID, c.FirstName, c.LastName
ORDER BY Money_Spent DESC;

--OR--

SELECT  c.CustomerId,c.FirstName,c.LastName,
(
SELECT sum(TotalAmount) from Orders o
where o.CustomerID=c.CustomerId) as "Amount_Spent"
From Customers c
Order by "Amount_Spent" desc ;

--OR--
SELECT TOP 5
    c.CustomerId,
    c.FirstName,
    (
        SELECT SUM(o.TotalAmount) 
        FROM Orders o
        JOIN OrderDetails od ON o.OrderID = od.OrderID
        JOIN Products p ON od.ProductID = p.ProductID
        JOIN Categories ce ON p.CategoryId = ce.CategoryId
        WHERE ce.Category_Name = 'Electronics' AND o.CustomerId = c.CustomerId
    ) AS "Amount Spent"
FROM Customers c
ORDER BY "Amount Spent" DESC;



--9.Write an SQL query to calculate the average order value (total revenue divided by the number of
--orders) for all customers.


SELECT 
    AVG(TotalAmount) AS "Average Order Value"
FROM Orders;

--or --

SELECT c.CustomerId ,c.FirstName,
(SELECT 
    AVG(o.TotalAmount) FROM Orders o
   where c.CustomerId=o.CustomerID
   group by o.CustomerID) as "Average_Value"
from Customers c;

--10.Write an SQL query to find the total number of orders placed by each customer and list their
--names along with the order count.

SELECT c.CustomerID,c.FirstName,c.LastName,
(
  SELECT COUNT(o.OrderID)
  FROM Orders o
  WHERE c.CustomerID = o.CustomerID
) AS ORDER_PLACED
FROM Customers c
ORDER BY ORDER_PLACED;















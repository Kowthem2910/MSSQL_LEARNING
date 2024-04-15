CREATE DATABASE Courier_Management_System;

USE Courier_Management_System;

CREATE TABLE [User] (
  UserID INT PRIMARY KEY,
  Name VARCHAR(255),
  Email VARCHAR(255) UNIQUE,
  Password VARCHAR(255),
  ContactNumber VARCHAR(20),
  Address TEXT
);

INSERT INTO [User] (UserID, Name, Email, Password, ContactNumber, Address) VALUES
(1, 'Sachin Tendulkar', 'sachin.tendulkar@example.com', 'password123', '1234567890', '123 Main St, Anytown, USA'),
(2, 'Virat Kohli', 'virat.kohli@example.com', 'password124', '1234567891', '124 Main St, Anytown, USA'),
(3, 'Sir Don Bradman', 'don.bradman@example.com', 'password125', '1234567892', '125 Main St, Anytown, USA'),
(4, 'Brian Lara', 'brian.lara@example.com', 'password126', '1234567893', '126 Main St, Anytown, USA'),
(5, 'Ricky Ponting', 'ricky.ponting@example.com', 'password127', '1234567894', '127 Main St, Anytown, USA'),
(6, 'Jacques Kallis', 'jacques.kallis@example.com', 'password128', '1234567895', '128 Main St, Anytown, USA'),
(7, 'M.S. Dhoni', 'ms.dhoni@example.com', 'password129', '1234567896', '129 Main St, Anytown, USA'),
(8, 'Shane Warne', 'shane.warne@example.com', 'password130', '1234567897', '130 Main St, Anytown, USA'),
(9, 'Wasim Akram', 'wasim.akram@example.com', 'password131', '1234567898', '131 Main St, Anytown, USA'),
(10, 'AB de Villiers', 'ab.devilliers@example.com', 'password132', '1234567899', '132 Main St, Anytown, USA'),
(11, 'Kumar Sangakkara', 'kumar.sangakkara@example.com', 'password133', '1234567800', '133 Main St, Anytown, USA'),
(12, 'Imran Khan', 'imran.khan@example.com', 'password134', '1234567801', '134 Main St, Anytown, USA'),
(13, 'Glenn McGrath', 'glenn.mcgrath@example.com', 'password135', '1234567802', '135 Main St, Anytown, USA'),
(14, 'Chris Gayle', 'chris.gayle@example.com', 'password136', '1234567803', '136 Main St, Anytown, USA'),
(15, 'Ben Stokes', 'ben.stokes@example.com', 'password137', '1234567804', '137 Main St, Anytown, USA');

CREATE TABLE Courier (
  CourierID INT PRIMARY KEY,
  SenderName VARCHAR(255),
  SenderAddress TEXT,
  ReceiverName VARCHAR(255),
  ReceiverAddress TEXT,
  Weight DECIMAL(5, 2),
  Status VARCHAR(50),
  TrackingNumber VARCHAR(20) UNIQUE,
  DeliveryDate DATE
);

INSERT INTO Courier (CourierID, SenderName, SenderAddress, ReceiverName, ReceiverAddress, Weight, Status, TrackingNumber, DeliveryDate) VALUES
(1, 'Sachin Tendulkar', '123 Main St, Anytown, USA', 'Alice Johnson', '125 Main St, Anytown, USA', 2.50, 'Delivered', 'TN001', '2024-04-01'),
(2, 'Virat Kohli', '124 Main St, Anytown, USA', 'Bob Brown', '126 Main St, Anytown, USA', 5.00, 'In Transit', 'TN002', '2024-04-02'),
(3, 'Sir Don Bradman', '125 Main St, Anytown, USA', 'Charlie Davis', '127 Main St, Anytown, USA', 1.75, 'Delivered', 'TN003', '2024-04-03'),
(4, 'Brian Lara', '126 Main St, Anytown, USA', 'Donna Evans', '128 Main St, Anytown, USA', 3.25, 'In Transit', 'TN004', '2024-04-04'),
(5, 'Ricky Ponting', '127 Main St, Anytown, USA', 'Ethan Hill', '129 Main St, Anytown, USA', 2.00, 'Delivered', 'TN005', '2024-04-05'),
(6, 'Jacques Kallis', '128 Main St, Anytown, USA', 'Grace Ford', '130 Main St, Anytown, USA', 4.50, 'In Transit', 'TN006', '2024-04-06'),
(7, 'M.S. Dhoni', '129 Main St, Anytown, USA', 'Henry Grant', '131 Main St, Anytown, USA', 3.00, 'Delivered', 'TN007', '2024-04-07'),
(8, 'Shane Warne', '130 Main St, Anytown, USA', 'Isabelle Hart', '132 Main St, Anytown, USA', 1.25, 'In Transit', 'TN008', '2024-04-08'),
(9, 'Wasim Akram', '131 Main St, Anytown, USA', 'Jack Irwin', '133 Main St, Anytown, USA', 0.75, 'Delivered', 'TN009', '2024-04-09'),
(10, 'AB de Villiers', '132 Main St, Anytown, USA', 'Karen James', '134 Main St, Anytown, USA', 1.50, 'In Transit', 'TN010', '2024-04-10'),
(11, 'Kumar Sangakkara', '133 Main St, Anytown, USA', 'Leo King', '135 Main St, Anytown, USA', 2.20, 'Delivered', 'TN011', '2024-04-11'),
(12, 'Imran Khan', '134 Main St, Anytown, USA', 'Mia Long', '136 Main St, Anytown, USA', 1.95, 'In Transit', 'TN012', '2024-04-12'),
(13, 'Glenn McGrath', '135 Main St, Anytown, USA', 'Nolan Moore', '137 Main St, Anytown, USA', 3.10, 'Delivered', 'TN013', '2024-04-13'),
(14, 'Chris Gayle', '136 Main St, Anytown, USA', 'Sachin Tendulkar', '123 Main St, Anytown, USA', 2.35, 'In Transit', 'TN014', '2024-04-14'),
(15, 'Ben Stokes', '137 Main St, Anytown, USA', 'Virat Kohli', '124 Main St, Anytown, USA', 4.00, 'Delivered', 'TN015', '2024-04-15');



CREATE TABLE CourierServices
(
 ServiceID INT PRIMARY KEY,
  ServiceName VARCHAR(100),
  Cost DECIMAL(8, 2)
);

INSERT INTO CourierServices (ServiceID, ServiceName, Cost) VALUES
(1, 'Standard Delivery', 10.00),
(2, 'Express Delivery', 20.00),
(3, 'Same Day Delivery', 30.00),
(4, 'International Standard', 50.00),
(5, 'International Express', 100.00),
(6, 'Overnight Delivery', 25.00),
(7, 'Two-Day Delivery', 15.00),
(8, 'Weekend Delivery', 20.00),
(9, 'Holiday Delivery', 30.00),
(10, 'Fragile Item Handling', 15.00),
(11, 'Heavy Item Handling', 20.00),
(12, 'Document Delivery', 12.00),
(13, 'Gift Wrap', 5.00),
(14, 'Insurance', 10.00),
(15, 'Tracking Services', 2.00);

CREATE TABLE Employee (
  EmployeeID INT PRIMARY KEY,
  Name VARCHAR(255),
  Email VARCHAR(255) UNIQUE,
  ContactNumber VARCHAR(20),
  Role VARCHAR(50),
  Salary DECIMAL(10, 2)
);

INSERT INTO Employee (EmployeeID, Name, Email, ContactNumber, Role, Salary) VALUES
(1, 'Susan Carter', 'susan.carter@example.com', '9001234567', 'Manager', 50000.00),
(2, 'Raj Patel', 'raj.patel@example.com', '9001234568', 'Assistant Manager', 45000.00),
(3, 'Amelia Earhart', 'amelia.earhart@example.com', '9001234569', 'Logistics Coordinator', 35000.00),
(4, 'Thomas Edison', 'thomas.edison@example.com', '9001234570', 'HR', 42000.00),
(5, 'Nikola Tesla', 'nikola.tesla@example.com', '9001234571', 'Engineer', 60000.00),
(6, 'Marie Curie', 'marie.curie@example.com', '9001234572', 'Scientist', 62000.00),
(7, 'Albert Einstein', 'albert.einstein@example.com', '9001234573', 'Chief Scientist', 70000.00),
(8, 'Isaac Newton', 'isaac.newton@example.com', '9001234574', 'Researcher', 48000.00),
(9, 'Michael Faraday', 'michael.faraday@example.com', '9001234575', 'Field Agent', 30000.00),
(10, 'Ada Lovelace', 'ada.lovelace@example.com', '9001234576', 'Software Developer', 55000.00),
(11, 'Charles Babbage', 'charles.babbage@example.com', '9001234577', 'System Analyst', 52000.00),
(12, 'James Watt', 'james.watt@example.com', '9001234578', 'Maintenance Manager', 49000.00),
(13, 'Leonardo da Vinci', 'leonardo.vinci@example.com', '9001234579', 'Creative Director', 68000.00),
(14, 'Galileo Galilei', 'galileo.galilei@example.com', '9001234580', 'Operations Manager', 53000.00),
(15, 'Alexander Bell', 'alexander.bell@example.com', '9001234581', 'Communications Manager', 47000.00);


CREATE TABLE Location (
  LocationID INT PRIMARY KEY,
  LocationName VARCHAR(100),
  Address TEXT
);

INSERT INTO Location (LocationID, LocationName, Address) VALUES
(1, 'Warehouse', '100 Industrial Way, Anytown, USA'),
(2, 'Main Office', '200 Capital Blvd, Capitol City, USA'),
(3, 'North Branch', '500 Northern St, Northville, USA'),
(4, 'South Branch', '600 Southern St, Southville, USA'),
(5, 'East Branch', '700 Eastern St, Eastville, USA'),
(6, 'West Branch', '800 Western Ave, Westville, USA'),
(7, 'Central Branch', '900 Central St, Centerville, USA'),
(8, 'Regional Office', '150 Regional Rd, Regionville, USA'),
(9, 'Overseas Branch', '250 Foreign Blvd, Countryville, Global'),
(10, 'Distribution Center', '350 Distribution Dr, Distributetown, USA'),
(11, 'Logistics Hub', '450 Logistics Ln, Logistown, USA'),
(12, 'Retail Location 1', '550 Retail Rd, Retailville, USA'),
(13, 'Retail Location 2', '650 Shopping Blvd, Shoppington, USA'),
(14, 'Suburban Office', '750 Suburb St, Suburbia, USA'),
(15, 'Urban Outlet', '850 Urban Rd, Urbantown, USA');


CREATE TABLE Payment (
  PaymentID INT PRIMARY KEY,
  CourierID INT,
  LocationID INT,
  Amount DECIMAL(10, 2),
  PaymentDate DATE,
  FOREIGN KEY (CourierID) REFERENCES Courier(CourierID),
  FOREIGN KEY (LocationID) REFERENCES Location(LocationID)
);

INSERT INTO Payment (PaymentID, CourierID, LocationID, Amount, PaymentDate) VALUES
(1, 1, 1, 50.00, '2024-04-01'),
(2, 2, 2, 30.00, '2024-04-02'),
(3, 3, 3, 45.00, '2024-04-03'),
(4, 4, 4, 25.00, '2024-04-04'),
(5, 5, 5, 55.00, '2024-04-05'),
(6, 6, 6, 35.00, '2024-04-06'),
(7, 7, 7, 40.00, '2024-04-07'),
(8, 8, 8, 60.00, '2024-04-08'),
(9, 9, 9, 20.00, '2024-04-09'),
(10, 10, 10, 70.00, '2024-04-10'),
(11, 11, 11, 65.00, '2024-04-11'),
(12, 12, 12, 75.00, '2024-04-12'),
(13, 13, 13, 80.00, '2024-04-13'),
(14, 14, 14, 85.00, '2024-04-14'),
(15, 15, 15, 90.00, '2024-04-15');

SELECT * FROM [User];
SELECT * FROM Courier;
SELECT * FROM CourierServices;
SELECT * FROM Employee;
SELECT * FROM Location;
SELECT * FROM Payment;

--TASK-2

--1.List all customers:

SELECT * FROM [User]

--2.List all orders for a specific customer:

SELECT * 
FROM Courier 
WHERE SenderName = 'Sachin Tendulkar';

--3.List all couriers

SELECT * FROM Courier;


--4.List all packages for a specific order

SELECT * 
FROM Courier WHERE TrackingNumber = 'TN004';

--5.List all deliveries for a specific courier:

SELECT * 
FROM Courier 
WHERE CourierID = 7;

--6.List all undelivered packages

SELECT * 
FROM Courier
WHERE Status NOT LIKE 'Delivered';

--7.List all packages that are scheduled for delivery today

SELECT * 
FROM Courier
WHERE CONVERT(DATE,DeliveryDate) = CONVERT(DATE,GETDATE());

--8.List all packages with a specific status:

SELECT *
FROM Courier
WHERE Status = 'In Transit';

--9.Calculate the total number of packages for each courier.

SELECT SenderName,COUNT(*) AS Total_Packages
FROM Courier
GROUP BY SenderName;

--10.Find the average delivery time for each courier



--11.List all packages with a specific weight range

SELECT * 
FROM Courier 
WHERE Weight BETWEEN 2.00 AND 4.00;

--12.Retrieve employees whose names contain 'John'

SELECT *
FROM Employee
WHERE Name LIKE '%John%'

--13.Retrieve all courier records with payments greater than $50.

SELECT c.*,p.Amount
FROM Courier c
JOIN Payment p ON c.CourierID = p.CourierID
WHERE p.Amount > 50.00;


--TASK-3

--14.Find the total number of couriers handled by each employee.


--15.Calculate the total revenue generated by each location

SELECT l.LocationID,l.LocationName,SUM(p.Amount) AS Total_Revenue
FROM Location l
LEFT JOIN Payment p ON l.LocationID = p.LocationID
GROUP BY l.LocationID,l.LocationName

--16.Find the total number of couriers delivered to each location.

SELECT l.LocationID, l.LocationName, COUNT(c.CourierID) AS TotalCouriersDelivered
FROM Location l
JOIN Payment p ON l.LocationID = p.LocationID
JOIN Courier c ON c.CourierID = p.CourierID
GROUP BY l.LocationID, l.LocationName;


--17.Find the courier with the highest average delivery time:


--18.Find Locations with Total Payments Less Than a Certain Amount

SELECT l.LocationID,l.LocationName,SUM(p.Amount) AS "TotalPayments"
FROM Payment p 
JOIN Location l ON l.LocationID = p.LocationID 
GROUP BY l.LocationID,l.LOcationName
HAVING SUM(p.Amount) < 55;

--19.Calculate Total Payments per Location

SELECT l.LocationID,l.LocationName,SUM(p.Amount) AS Total_payments
FROM Location l
LEFT JOIN Payment p ON l.LocationID = p.LocationID
GROUP BY l.LocationID,l.LocationName

--20.Retrieve couriers who have received payments totaling 
--more than $1000 in a specific location (LocationID = X):

SELECT c.CourierID,c.SenderName
FROM Courier c
JOIN Payment p ON c.CourierID = p.CourierID
WHERE p.LocationID = 11
GROUP BY c.CourierID,c.SenderName
HAVING SUM(p.Amount) > 1000;

--21.Retrieve couriers who have received 
--payments totaling more than $1000 after a certain date (PaymentDate > 'YYYY-MM-DD'):





--22.Retrieve locations where the total amount received 
--is more than $5000 before a certain date (PaymentDate > 'YYYY-MM-DD')

SELECT l.LocationID,l.LocationName,SUM(p.Amount) AS Total_payments
FROM Location l
LEFT JOIN Payment p ON l.LocationID = p.LocationID
GROUP BY l.LocationID,l.LocationName,p.PaymentDate
HAVING SUM(p.Amount) > 5000 AND p.PaymentDate > '2024-03-15'





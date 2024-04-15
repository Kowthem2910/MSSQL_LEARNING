USE HMBank;

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    DOB DATE,
    email VARCHAR(100),
    phone_number VARCHAR(20),
    address VARCHAR(255),
	city VARCHAR(20)
);



INSERT INTO Customers (customer_id, first_name, last_name, DOB, email, phone_number, address) 
VALUES 
(1, 'John', 'Doe', '1990-05-15', 'john.doe@example.com', '123-456-7890', '123 Main St'),
(2, 'Jane', 'Smith', '1985-10-20', 'jane.smith@example.com', '987-654-3210', '456 Elm St'),
(3, 'Michael', 'Johnson', '1988-03-25', 'michael.johnson@example.com', '555-123-4567', '789 Oak St'),
(4, 'Emily', 'Brown', '1995-08-12', 'emily.brown@example.com', '333-888-9999', '101 Pine St'),
(5, 'David', 'Lee', '1980-12-30', 'david.lee@example.com', '777-666-5555', '202 Cedar St'),
(6, 'Sarah', 'Wilson', '1992-06-18', 'sarah.wilson@example.com', '222-333-4444', '303 Maple St'),
(7, 'Matthew', 'Taylor', '1983-09-05', 'matthew.taylor@example.com', '999-888-7777', '404 Oak St'),
(8, 'Jennifer', 'Anderson', '1998-02-28', 'jennifer.anderson@example.com', '111-222-3333', '505 Elm St'),
(9, 'Christopher', 'Martinez', '1991-07-15', 'christopher.martinez@example.com', '444-555-6666', '606 Pine St'),
(10, 'Amanda', 'Garcia', '1989-04-03', 'amanda.garcia@example.com', '666-777-8888', '707 Cedar St'),
(11, 'James', 'Hernandez', '1993-11-20', 'james.hernandez@example.com', '888-999-0000', '808 Maple St'),
(12, 'Jessica', 'Lopez', '1987-01-10', 'jessica.lopez@example.com', '000-111-2222', '909 Oak St'),
(13, 'Daniel', 'Perez', '1996-04-22', 'daniel.perez@example.com', '123-987-6543', '1010 Elm St'),
(14, 'Elizabeth', 'Ramirez', '1984-08-05', 'elizabeth.ramirez@example.com', '345-678-9012', '1111 Pine St'),
(15, 'Kevin', 'Torres', '1990-12-17', 'kevin.torres@example.com', '987-654-3210', '1212 Cedar St');


CREATE TABLE Accounts (
    account_id INT PRIMARY KEY,
    customer_id INT REFERENCES Customers(customer_id),
    account_type VARCHAR(50),
    balance INT,
);

INSERT INTO Accounts (account_id, customer_id, account_type, balance) 
VALUES 
(101, 1, 'savings', 5000),
(102, 1, 'current', 2500),
(103, 2, 'savings', 8000),
(104, 3, 'current', 10000),
(105, 4, 'savings', 3000),
(106, 5, 'current', 7000),
(107, 6, 'savings', 4000),
(108, 7, 'current', 6000),
(109, 8, 'savings', 9000),
(110, 9, 'current', 2000),
(111, 10, 'savings', 7500),
(112, 11, 'current', 8500),
(113, 12, 'savings', 6200),
(114, 13, 'current', 1800),
(115, 14, 'savings', 5400);


CREATE TABLE Transactions (
    transaction_id INT PRIMARY KEY,
    account_id INT REFERENCES Accounts(account_id),
    transaction_type VARCHAR(50),
    amount INT,
    transaction_date DATE,
);

INSERT INTO Transactions (transaction_id, account_id, transaction_type, amount, transaction_date) 
VALUES 
(1001, 101, 'deposit', 1000, '2024-04-01'),
(1002, 101, 'withdrawal', 500, '2024-04-05'),
(1003, 102, 'deposit', 200, '2024-04-02'),
(1004, 103, 'deposit', 1500, '2024-04-03'),
(1005, 104, 'withdrawal', 2000, '2024-04-04'),
(1006, 105, 'deposit', 500, '2024-04-05'),
(1007, 105, 'withdrawal', 200, '2024-04-06'),
(1008, 106, 'deposit', 1000, '2024-04-07'),
(1009, 107, 'deposit', 300, '2024-04-08'),
(1010, 107, 'withdrawal', 100, '2024-04-09'),
(1011, 108, 'deposit', 700, '2024-04-10'),
(1012, 108, 'withdrawal', 200, '2024-04-11'),
(1013, 109, 'deposit', 800, '2024-04-12'),
(1014, 110, 'deposit', 400, '2024-04-13'),
(1015, 110, 'withdrawal', 100, '2024-04-14');

SELECT * FROM Customers;
SELECT * FROM Accounts;
SELECT * FROM Transactions
--TASK-2


--1.Write a SQL query to retrieve the name, account type and email of all customers.

SELECT CONCAT(c.First_Name,' ',c.Last_Name) AS Name,a.account_type,c.email
From Customers c
JOIN Accounts a ON c.Customer_id = a.Customer_id;

--2.Write a SQL query to list all transaction corresponding customer.

SELECT CONCAT(c.First_Name,' ',c.Last_Name) AS Name,t.transaction_id, t.transaction_type, t.amount, t.transaction_date
FROM Customers c
JOIN Accounts a ON c.customer_id = a.customer_id
JOIN Transactions t ON a.account_id = t.account_id;

--3.Write a SQL query to increase the balance of a specific account by a certain amount.
DECLARE @Amount INT;
SET @Amount = 100;
DECLARE @AccountId INT;
SET @AccountId = 103;
UPDATE Accounts
SET balance = balance + @Amount
WHERE account_id = @AccountId;


--4.Write a SQL query to Combine first and last names of customers as a full_name.

SELECT CONCAT(first_name,'',last_name) AS Full_Name FROM Customers

--5.Write a SQL query to remove accounts with a balance of zero where the account type is savings.

INSERT INTO Accounts VALUES(16,2, 'savings', 0);
INSERT INTO Accounts VALUES(17,3, 'savings', 0);
DELETE FROM Accounts
WHERE balance = 0 AND account_type = 'savings';

--6.Write a SQL query to Find customers living in a specific city.

SELECT * FROM Customers
WHERE City LIKE 'Banglore';
 
--OR--

SELECT * FROM Customers
WHERE City = 'Banglore';

--7.Write a SQL query to Get the account balance for a specific account.
DECLARE @AccountId INT;
SET @AccountId = 103;
SELECT balance
FROM Accounts
WHERE account_id = @AccountId;

--8.Write a SQL query to List all current accounts with a balance greater than $1,000.

SELECT * 
FROM Accounts
WHERE account_type = 'current' AND balance > 1000;

--9.Write a SQL query to Retrieve all transactions for a specific account.

DECLARE @Account_id INT;
SET @Account_id = 101;
SELECT * 
FROM Transactions
WHERE account_id = @Account_id;

--10.Write a SQL query to Calculate the interest accrued on savings accounts based on a given interest rate.
DECLARE @Interest_Rate INT;
SET @Interest_Rate = 5;
SELECT account_id, CAST(balance AS DECIMAL) * ( @Interest_Rate /100.0) As  Interest_Accured
FROM Accounts
WHERE account_type = 'savings'

--11.Write a SQL query to Identify accounts where the balance is less than a specified overdraft limit.

DECLARE @OverDraftLimit INT;
SET @OverDraftLimit  = 2500;
SELECT account_id, balance
FROM Accounts
WHERE balance < @OverDraftLimit;

--12.Write a SQL query to Find customers not living in a specific city.

SELECT * FROM Customers
WHERE City NOT LIKE 'Banglore';

--or--

SELECT * FROM Customers
WHERE City NOT IN ('Chennai','Noida');


--TASK-3

--1.Write a SQL query to Find the average account balance for all customers.

SELECT AVG(balance) AS AVG_ACCOUNT_BALANCE
From Accounts;

--2.Write a SQL query to Retrieve the top 10 highest account balances.

SELECT TOP 10 * 
FROM Accounts
ORDER BY balance DESC;

--3.Write a SQL query to Calculate Total Deposits for All Customers in specific date.

SELECT SUM(Amount) AS "Total_Deposits"
FROM Transactions
WHERE transaction_type = 'deposit' AND transaction_date = '2024-04-05';

--4.Write a SQL query to Find the Oldest and Newest Customers

SELECT MIN(DOB) AS oldest_customer_dob,MAX(DOB) AS newest_customer_dob
FROM Customers;

--5.Write a SQL query to Retrieve transaction details along with the account type.

SELECT * FROM Transactions
SELECT t.transaction_id,t.account_id,t.transaction_type,t.amount,t.transaction_date,a.account_type
FROM  Transactions t
JOIN Accounts a ON t.account_id = a.account_id;


--6.Write a SQL query to Get a list of customers along with their account details.

SELECT * FROM Transactions

SELECT c.Customer_id,c.first_name,c.last_name,a.account_id,a.account_type,a.balance
FROM Customers c
JOIN Accounts a ON c.customer_id = a.customer_id;

--7.Write a SQL query to Retrieve transaction details along with customer information for a specific account.

SELECT t.transaction_id,t.transaction_type,t.amount,t.transaction_date,c.customer_id,c.first_name,c.last_name
FROM Transactions t
JOIN Accounts a ON a.account_id  = t.account_id
JOIN Customers c ON a.customer_id = c.customer_id
WHERE t.account_id = 107

--8.Write a SQL query to Identify customers who have more than one account.

SELECT c.customer_id,c.first_name,c.last_name,COUNT(a.account_id) AS num_accounts
FROM  Accounts a
JOIN Customers c ON c.customer_id = a.customer_id
GROUP BY c.customer_id,c.first_name,c.last_name
HAVING COUNT(a.account_id)>1


--OR--

SELECT customer_id,COUNT(account_id) AS num_accounts
FROM Accounts
GROUP BY customer_id
HAVING COUNT(account_id) > 1;


--9.Write a SQL query to Calculate the difference in transaction amounts between deposits and withdrawals.

SELECT account_id,SUM(CASE WHEN transaction_type = 'deposit' THEN amount ELSE -amount END) AS transaction_difference
FROM Transactions
GROUP BY account_id;

--10.Write a SQL query to Calculate the average daily balance for each account over a specified period.

SELECT account_id,AVG(balance) AS average_daily_balance
FROM  Accounts
GROUP BY account_id;

--11.Calculate the total balance for each account type.

SELECT account_type,SUM(balance) AS TOTAL_BALANCE
FROM Accounts
GROUP BY account_type;

--12.Identify accounts with the highest number of transactions order by descending order.

SELECT account_id,COUNT(account_id) AS No_of_transactions
FROM Transactions
GROUP BY account_id
ORDER BY No_of_transactions DESC;


--13.List customers with high aggregate account balances, along with their account types.

SELECT c.customer_id,c.first_name,c.last_name,SUM(a.balance) AS total_balance,a.account_type
FROM Customers c
JOIN Accounts a ON c.customer_id = a.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name, a.account_type
ORDER BY total_balance DESC;

--14.Identify and list duplicate transactions based on transaction amount, date, and account

SELECT account_id,transaction_type,amount,transaction_date,COUNT(*) AS duplicate_count
FROM Transactions
GROUP BY account_id, transaction_type, amount, transaction_date
HAVING COUNT(*) > 1;

INSERT INTO Transactions (transaction_id, account_id, transaction_type, amount, transaction_date) 
VALUES 
(1016, 101, 'withdrawal', 500, '2024-04-05'),
(1017, 102, 'deposit', 200, '2024-04-02'),
(1018, 107, 'deposit', 300, '2024-04-08'),
(1019, 107, 'deposit', 300, '2024-04-08'),
(1020, 110, 'deposit', 400, '2024-04-13'),
(1021, 110, 'deposit', 400, '2024-04-13');


--TASK-4

--1.Retrieve the customer(s) with the highest account balance.

SELECT c.customer_id,c.first_name,c.last_name
FROM Customers c
WHERE c.customer_id = (SELECT TOP 1 a.customer_id FROM Accounts a ORDER BY balance DESC);

--2.Calculate the average account balance for customers who have more than one account.

SELECT AVG(balance) AS average_balance
FROM Accounts
WHERE customer_id IN (SELECT customer_id FROM Accounts GROUP BY customer_id HAVING COUNT(*) > 1);

--3.Retrieve accounts with transactions whose amounts exceed the average transaction amount.

SELECT account_id,balance
FROM Accounts
WHERE account_id IN
(SELECT account_id From Transactions WHERE Amount>(SELECT AVG(Amount) FROM Transactions))

--4.Identify customers who have no recorded transactions.

SELECT customer_id,first_name,last_name
FROM Customers
WHERE customer_id NOT IN (SELECT DISTINCT customer_id FROM Accounts WHERE account_id IN (SELECT DISTINCT account_id FROM Transactions));

--5.Calculate the total balance of accounts with no recorded transactions.

SELECT SUM(balance) AS Total_balance
FROM Accounts
WHERE account_id NOT IN (SELECT DISTINCT account_id FROM Transactions);

--6.Retrieve transactions for accounts with the lowest balance.

SELECT t.account_id,t.transaction_id,t.transaction_type,t.amount,t.transaction_date
FROM Transactions t
WHERE t.account_id IN
(SELECT account_id FROM Accounts WHERE balance = (SELECT MIN(balance) FROM Accounts));


--7.Identify customers who have accounts of multiple types.

SELECT c.customer_id,c.first_name,c.last_name
FROM Customers c
WHERE c.customer_id IN (SELECT a.customer_id FROM Accounts a GROUP BY a.customer_id HAVING COUNT(DISTINCT a.account_type) > 1);

--8.Calculate the percentage of each account type out of the total number of accounts.

SELECT account_type,COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Accounts) AS percentage
FROM Accounts
GROUP BY account_type;

--9.Retrieve all transactions for a customer with a given customer_id.

DECLARE @customer_id INT;
SET @customer_id = 1
SELECT *
FROM Transactions
WHERE account_id IN (SELECT account_id FROM Accounts WHERE customer_id = @customer_id);

--10.Calculate the total balance for each account type, including a subquery within the SELECT clause.

SELECT account_type,(SELECT SUM(balance) FROM Accounts WHERE account_type = a.account_type) AS total_balance
FROM (SELECT DISTINCT account_type FROM Accounts) AS a;







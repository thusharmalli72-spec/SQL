use exam;
CREATE TABLE Customerss (
    Customer_ID INT PRIMARY KEY,
    Customer_Name VARCHAR(50),
    City VARCHAR(50)
);

CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY,
    Customer_ID INT,
    Order_Date DATE,
    Order_Amount DECIMAL(10,2),
    FOREIGN KEY (Customer_ID) REFERENCES Customerss(Customer_ID)
);

CREATE TABLE Invoices (
    Invoice_ID INT PRIMARY KEY,
    Order_ID INT,
    Invoice_Date DATE,
    Invoice_Amount DECIMAL(10,2),
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID)
);

CREATE TABLE Payments (
    Payment_ID INT PRIMARY KEY,
    Invoice_ID INT,
    Payment_Date DATE,
    Payment_Amount DECIMAL(10,2),
    FOREIGN KEY (Invoice_ID) REFERENCES Invoices(Invoice_ID)
);

CREATE TABLE Ledger (
    Ledger_ID INT PRIMARY KEY,
    Customer_ID INT,
    Transaction_Date DATE,
    Debit DECIMAL(10,2),
    Credit DECIMAL(10,2),
    Description VARCHAR(100),
    FOREIGN KEY (Customer_ID) REFERENCES Customerss(Customer_ID)
);

INSERT INTO Customerss VALUES
(1, 'Akhil', 'Kochi'),
(2, 'Rahul', 'Bangalore'),
(3, 'Anu', 'Mangalore'),
(4, 'Vishnu', 'Delhi'),
(5, 'Neha', 'Mumbai');

INSERT INTO Orders VALUES
(101, 1, '2026-01-01', 50000),
(102, 2, '2026-01-05', 30000),
(103, 1, '2026-02-21', 28000),
(104, 3, '2026-05-13', 15000),
(105, 1, '2026-09-14', 25000);

INSERT INTO Invoices VALUES
(1001,101,'2026-05-23',60000),
(1002,102,'2026-09-12',9500),
(1003,104,'2026-10-02',65000),
(1004,102,'2026-11-16',56000),
(1005,103,'2026-03-18',25000);

INSERT INTO Payments VALUES
(201,1001,'2026-03-15',2500),
(202,1002,'2026-06-25',50000),
(203,1001,'2026-12-25',25000),
(204,1002,'2026-05-08',45000),
(205,1004,'2026-11-18',60000);

INSERT INTO Ledger VALUES
(1,1,'2026-08-01',5000,0,'Purchases'),
(2,2,'2026-08-02',0,8000,'Sales'),
(3,3,'2026-08-03',2500,0,'Office Expenses'),
(4,4,'2026-08-04',0,6000,'Payment Received'),
(5,1,'2026-08-05',1500,0,'Electricity Bill');

Select*from Customerss;
select*from Orders;
select * from Invoices;
select * from Payments;
select * from Ledger;

SELECT  c.Customer_ID,
    c.Customer_Name,
    o.Order_ID,
    o.Order_Amount
FROM Customerss c
INNER JOIN Orders o
ON c.Customer_ID=o.Customer_ID;
SELECT c.Customer_ID,
    c.Customer_Name,
    o.Order_ID,
    o.Order_Amount
FROM Customerss c
LEFT JOIN Orders o
ON c.Customer_ID=o.Customer_ID;
SELECT c.Customer_ID,
    c.Customer_Name,
    o.Order_ID,
    o.Order_Amount
FROM Customerss c
RIGHT JOIN Orders o
ON c.Customer_ID=o.Customer_ID;
SELECT  c.Customer_ID,
    c.Customer_Name,
    o.Order_ID,
    o.Order_Amount,
    i.Invoice_ID,
    i.Invoice_Amount,
    p.Payment_ID,
    p.Payment_Amount,
    l.Ledger_ID,
    l.Debit,
    l.Credit
from Customerss c
LEFT JOIN Orders o
ON c.Customer_ID=o.Customer_ID
LEFT JOIN Invoices i
ON o.Order_ID=i.Order_ID
LEFT JOIN Payments p
ON i.Invoice_ID=p.Invoice_ID
LEFT JOIN Ledger l
ON c.Customer_ID=l.Customer_ID;
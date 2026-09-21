create database task13;
use task13;
CREATE TABLE Customers (
    Customer_ID INT PRIMARY KEY,
    Customer_Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100)
);

CREATE TABLE Transactions (
    Transaction_ID INT PRIMARY KEY,
    Customer_ID INT,
    Amount DECIMAL(10,2),
    TransactionDate date,
    FOREIGN KEY (Customer_ID)
    REFERENCES Customers(Customer_ID)
);
CREATE TABLE Salaries (
    Employee_ID INT PRIMARY KEY,
    Employee_Name VARCHAR(100) NOT NULL,
    Salary DECIMAL(10,2)
);

create user "manager"@"localhost" identified by "manager@123";

create user "accountant"@"localhost" identified by "accountent@123";

create user "clerk"@"localhost"  identified by "clerk@123";

grant select on permission.*
to "manager"@"localhost";

grant select, insert ,update
on task13.Transactions
to "accountant"@"localhost";

grant select 
on task13.Transactions
to "clerk"@"localhost";

grant select on transactions.*
to "manager"@"localhost";

grant select,insert, update
on task13.transactions
to "accountant"@"localhost";

grant select
on task13.transactions
to "accountant"@"localhost";

grant select
on task13.Customers
to "clerk"@"localhost";

grant select,insert, update
on task13.transactions
to "clerk"@"localhost";

grant select
on task13.Customers
to "accountant"@"localhost";

grant delete
on task13.transactions
to "accountant"@"localhost";

revoke delete
on task13.transactions
from "accountant"@"localhost";

show grants for "manager"@"localhost";
show grants for "accountant"@"localhost";
show grants for "clerk"@"localhost";






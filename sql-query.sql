-- Drop tABLE branch;
-- dROP TABLE EMPLOYEE;
-- DROP TABLE CUSTOMER;
-- DROP TABLE  ACCOUNT;
-- DROP TABLE ACCOUNTtYPE;
-- DROP TABLE TRNSACTION;
-- DROP TABLE TRANSACTIONTYPE;
-- DROP TABLE LOAN ;
-- DROP TABLE LOANTYPE;
-- DROP TABLE PAYMENT;
-- 
-- 
CREATE TABLE Branch (
  BranchID INT PRIMARY KEY, Name VARCHAR(100),
  Address VARCHAR(255), City VARCHAR(100), Phone VARCHAR(20)
);
alter table branch Rename column  Address TO BranchAddress;

CREATE INDEX branch_idx
ON Branch(BranchID);

Select *
from branch;

CREATE TABLE Employee (
  EmployeeID INT PRIMARY KEY, Name VARCHAR(100),
  Email VARCHAR(100), Phone VARCHAR(20), Position VARCHAR(50),
  BranchID INT NOT NULL, HireDate DATE,
  FOREIGN KEY (BranchID) REFERENCES Branch(BranchID)
);

CREATE TABLE Customer (
  CustomerID INT PRIMARY KEY, Name VARCHAR(100),
  Email VARCHAR(100), Phone VARCHAR(20), Address VARCHAR(255),
  RegisteredBranchID INT NOT NULL,
  FOREIGN KEY (RegisteredBranchID) REFERENCES Branch(BranchID)
);

CREATE TABLE AccountType (
  AccountTypeID INT PRIMARY KEY, TypeName VARCHAR(50),
  Description TEXT
);

CREATE TABLE Account (
  AccountID INT PRIMARY KEY, CustomerID INT NOT NULL,
  BranchID INT NOT NULL, AccountTypeID INT NOT NULL,
  Balance DECIMAL(15,2), DateOpened DATE,
  FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
  FOREIGN KEY (BranchID) REFERENCES Branch(BranchID),
  FOREIGN KEY (AccountTypeID) REFERENCES AccountType(AccountTypeID)
);

CREATE TABLE TransactionType (
  TransactionTypeID INT PRIMARY KEY, TypeName VARCHAR(50)
);

CREATE TABLE Transaction (
  TransactionID INT PRIMARY KEY, AccountID INT NOT NULL,
  TransactionTypeID INT NOT NULL, Amount DECIMAL(15,2),
  Date DATETIME, Description VARCHAR(255), PerformedBy INT,
  FOREIGN KEY (AccountID) REFERENCES Account(AccountID),
  FOREIGN KEY (TransactionTypeID) REFERENCES TransactionType(TransactionTypeID),
  FOREIGN KEY (PerformedBy) REFERENCES Employee(EmployeeID)
);

CREATE TABLE LoanType (
  LoanTypeID INT PRIMARY KEY, TypeName VARCHAR(50), Description TEXT
);

CREATE TABLE Loan (
  LoanID INT PRIMARY KEY, CustomerID INT NOT NULL,
  BranchID INT NOT NULL, LoanTypeID INT NOT NULL,
  LoanAmount DECIMAL(15,2), InterestRate DECIMAL(5,2),
  Status VARCHAR(50), IssueDate DATE, ApprovedBy INT,
  FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
  FOREIGN KEY (BranchID) REFERENCES Branch(BranchID),
  FOREIGN KEY (LoanTypeID) REFERENCES LoanType(LoanTypeID),
  FOREIGN KEY (ApprovedBy) REFERENCES Employee(EmployeeID)
);

CREATE TABLE Payment (
  PaymentID INT PRIMARY KEY, 
  LoanID INT NOT NULL,
  Amount DECIMAL(15,2), 
  PaymentDate DATE, 
  CollectedBy INT,
  FOREIGN KEY (LoanID) REFERENCES Loan(LoanID),
  FOREIGN KEY (CollectedBy) REFERENCES Employee(EmployeeID)
);






-- Insert into Branch
INSERT INTO Branch VALUES (1, 'Main Branch', '123 Main St', 'Lahore', '0421234567');
INSERT INTO Branch VALUES (2, 'Gulberg Branch', '78 Gulberg Rd', 'Lahore', '0422223344');
INSERT INTO Branch VALUES (3, 'DHA Branch', '11 H Block DHA', 'Lahore', '0429988776');
INSERT INTO Branch VALUES (4, 'Johar Town Branch', 'Plot 9, Block G, Johar Town', 'Lahore', '0423344556'),
(5, 'Faisalabad Branch', '22 People’s Colony', 'Faisalabad', '0415566778'),
(6, 'Multan Branch', 'Chowk BCG', 'Multan', '0614445566'),
(7, 'Rawalpindi Branch', '6th Rd', 'Rawalpindi', '0517788990'),
(8, 'Islamabad Branch', 'Blue Area', 'Islamabad', '0512212345'),
(9, 'Sialkot Branch', 'Cantt Area', 'Sialkot', '0529988777'),
(10, 'Hyderabad Branch', 'Latifabad', 'Hyderabad', '0223344556');



-- Insert into Employee
INSERT INTO Employee VALUES (101, 'Ali Khan', 'ali@bank.com', '03211234567', 'Manager', 1, '2020-05-01');
INSERT INTO Employee VALUES (102, 'Ayesha Tariq', 'ayesha@bank.com', '03001234567', 'Cashier', 2, '2021-06-12');
INSERT INTO Employee VALUES (103, 'Zain Raza', 'zain@bank.com', '03119998888', 'Loan Officer', 3, '2023-01-20');
INSERT INTO Employee VALUES (104, 'Rida Aslam', 'rida@bank.com', '03331231234', 'Cashier', 4, '2022-08-01'),
(105, 'Usman Iqbal', 'usman@bank.com', '03009990000', 'Branch Manager', 5, '2019-03-17'),
(106, 'Adeel Rauf', 'adeel@bank.com', '03002223344', 'Loan Officer', 6, '2023-11-05'),
(107, 'Nashit Zia', 'nashit@bank.com', '03234567891', 'Teller', 7, '2020-12-25'),
(108, 'Tania Malik', 'tania@bank.com', '03123456789', 'Cashier', 8, '2021-01-15'),
(109, 'Omer Javed', 'omer@bank.com', '03456781234', 'Account Officer', 9, '2023-04-01'),
(110, 'Hira Naveed', 'hira@bank.com', '03567894567', 'Loan Officer', 10, '2024-01-10');




-- Insert into Customer
INSERT INTO Customer VALUES (201, 'Sara Ahmed', 'sara@gmail.com', '03111234567', '45 Model Town', 1);
INSERT INTO Customer VALUES (202, 'Hamza Malik', 'hamza@gmail.com', '03011223344', '89 Ferozepur Road', 2);
INSERT INTO Customer VALUES (203, 'Fatima Noor', 'fatima@yahoo.com', '03441112233', '12 Airport Housing', 3);
INSERT INTO Customer VALUES 
(204, 'Bilal Khan', 'bilal@gmail.com', '03112223344', 'DHA Phase 5', 4),
(205, 'Nimra Fatima', 'nimra@yahoo.com', '03442223311', 'Bahria Town', 5),
(206, 'Saad Javed', 'saad@hotmail.com', '03212345678', 'Mansoorabad', 6),
(207, 'Fawad Khan', 'fawad@bank.com', '03121231234', 'Satellite Town', 7),
(208, 'Rabia Zafar', 'rabia@gmail.com', '03007894561', 'F-10 Islamabad', 8),
(209, 'Imran Nadeem', 'imran@live.com', '03452312312', 'Cantt Area', 9),
(210, 'Hassan Shah', 'hassan@gmail.com', '03332111222', 'Latifabad', 10);




-- Insert into AccountType
INSERT INTO AccountType VALUES (1, 'Savings', 'Standard Savings Account');
INSERT INTO AccountType VALUES (2, 'Current', 'Business Current Account');
INSERT INTO AccountType VALUES (3, 'Fixed Deposit', 'High interest long-term savings');





-- Insert into Account
INSERT INTO Account VALUES (301, 201, 1, 1, 50000.00, '2022-01-15');
INSERT INTO Account VALUES (302, 202, 2, 2, 150000.00, '2023-04-10');
INSERT INTO Account VALUES (303, 203, 3, 3, 250000.00, '2024-02-05');
INSERT INTO Account VALUES 
(304, 204, 4, 1, 72000.00, '2023-07-12'),
(305, 205, 5, 2, 21000.00, '2024-01-18'),
(306, 206, 6, 3, 350000.00, '2023-09-30'),
(307, 207, 7, 1, 45500.00, '2022-03-20'),
(308, 208, 8, 1, 110000.00, '2021-08-14'),
(309, 209, 9, 2, 88000.00, '2024-05-30'),
(310, 210, 10, 1, 99000.00, '2023-12-01');


INSERT INTO TransactionType VALUES (1, 'Deposit');
INSERT INTO TransactionType VALUES (2, 'Withdrawal');
INSERT INTO TransactionType VALUES (3, 'Transfer');




INSERT INTO Transaction VALUES (401, 301, 1, 5000.00, '2024-06-01 09:30:00', 'Initial Deposit', 101);
INSERT INTO Transaction VALUES (402, 302, 2, 2000.00, '2024-06-10 11:00:00', 'ATM Withdrawal', 102);
INSERT INTO Transaction VALUES (403, 303, 3, 10000.00, '2024-06-15 14:20:00', 'Online Transfer to Sara', 103);
INSERT INTO Transaction VALUES 
(404, 304, 1, 10000.00, '2024-06-18 10:45:00', 'Salary Deposit', 104),
(405, 305, 2, 5000.00, '2024-06-20 13:00:00', 'Cash Withdrawal', 105),
(406, 306, 1, 200000.00, '2024-06-25 09:10:00', 'FD Opening', 106),
(407, 307, 3, 3000.00, '2024-06-26 11:30:00', 'Transfer to Sara', 107),
(408, 308, 1, 4000.00, '2024-06-27 10:00:00', 'Online Banking', 108),
(409, 309, 2, 1200.00, '2024-06-28 15:45:00', 'ATM Cash', 109),
(410, 310, 1, 3500.00, '2024-06-29 17:15:00', 'Cash Deposit', 110);




INSERT INTO LoanType VALUES (1, 'Home Loan', 'Loan for residential property');
INSERT INTO LoanType VALUES (2, 'Car Loan', 'Loan for vehicle purchase');
INSERT INTO LoanType VALUES (3, 'Personal Loan', 'Unsecured personal expense loan');
INSERT INTO LoanType VALUES 
(4, 'Education Loan', 'Loan for academic fees'),
(5, 'Business Loan', 'SME funding');





INSERT INTO Loan VALUES (501, 201, 1, 1, 1000000.00, 8.5, 'Approved', '2023-03-01', 101);
INSERT INTO Loan VALUES (502, 202, 2, 2, 500000.00, 10.0, 'Pending', '2024-01-10', 102);
INSERT INTO Loan VALUES
(503, 203, 3, 3, 300000.00,11.0, 'Approved', '2023-06-22',103),
(504, 204, 4, 4, 600000.00, 7.5, 'Approved', '2023-09-15', 104),
(505, 205, 5, 5, 900000.00, 9.5, 'Pending', '2024-04-02', 105),
(506, 206, 6, 3, 300000.00, 10.5, 'Approved', '2024-02-28', 106),
(507, 207, 7, 2, 550000.00, 9.0, 'Approved', '2022-11-10', 107),
(508, 208, 8, 1, 1200000.00, 8.0, 'Pending', '2024-01-15', 108),
(509, 209, 9, 3, 280000.00, 10.2, 'Closed', '2023-10-01', 109),
(510, 210, 10, 4, 450000.00, 7.8, 'Approved', '2024-03-25', 110);






INSERT INTO Payment VALUES (601, 501, 50000.00, '2024-04-01', 101);
INSERT INTO Payment VALUES (602, 501, 60000.00, '2024-05-01', 101);
INSERT INTO Payment VALUES (603, 502, 25000.00, '2024-06-01', 102);
INSERT INTO Payment VALUES 
(604, 503, 150000.00, '2024-05-15', 103),
(605, 503, 100000.00, '2024-06-15', 103),
(606, 504, 30000.00, '2024-06-20', 104),
(607, 505, 50000.00, '2024-06-25', 105),
(608, 506, 28000.00, '2024-06-22', 106),
(609, 507, 40000.00, '2024-06-10', 107),
(610, 510, 50000.00, '2024-06-29', 110);







-- Update
UPDATE Account SET Balance = Balance + 5000 WHERE AccountID = 301;




-- Delete
-- DELETE FROM Transaction WHERE TransactionID = 1001;



CREATE USER 'bankuser'@'localhost' IDENTIFIED BY 'StrongPassword123!';

GRANT SELECT, INSERT ON BankDB.* TO 'bankuser'@'localhost';
GRANT DELETE, INSERT ON BankDB.* TO 'bankuser'@'localhost';

REVOKE DELETE ON BankDB.* FROM 'bankuser'@'localhost';









SELECT 
  C.CustomerID,
  C.Name AS CustomerName,
  A.AccountID,
  AT.TypeName AS AccountType,
  A.Balance
FROM 
  Customer C
JOIN Account A ON C.CustomerID = A.CustomerID
JOIN AccountType AT ON A.AccountTypeID = AT.AccountTypeID;

SELECT 
  A.AccountID,
  SUM(CASE WHEN T.TransactionTypeID = 1 THEN T.Amount ELSE 0 END) AS TotalDeposits,
  SUM(CASE WHEN T.TransactionTypeID = 2 THEN T.Amount ELSE 0 END) AS TotalWithdrawals
FROM 
  Account A
LEFT JOIN Transaction T ON A.AccountID = T.AccountID
GROUP BY A.AccountID;


SELECT 
  C.CustomerID, C.Name
FROM 
  Customer C
LEFT JOIN Loan L ON C.CustomerID = L.CustomerID
WHERE 
  L.LoanID IS NULL;


SELECT 
  B.BranchID,
  B.Name AS BranchName,
  SUM(A.Balance) AS TotalBalance
FROM 
  Branch B
JOIN Account A ON B.BranchID = A.BranchID
GROUP BY B.BranchID, B.Name;

SELECT 
  C.CustomerID,
  C.Name,
  SUM(L.LoanAmount) AS TotalLoan
FROM 
  Customer C
JOIN Loan L ON C.CustomerID = L.CustomerID
GROUP BY C.CustomerID, C.Name
ORDER BY TotalLoan DESC
LIMIT 5;



SELECT 
  E.EmployeeID,
  E.Name,
  COUNT(L.LoanID) AS LoansApproved
FROM 
  Employee E
JOIN Loan L ON E.EmployeeID = L.ApprovedBy
GROUP BY E.EmployeeID, E.Name
HAVING COUNT(L.LoanID) >= 2;









SELECT 
  L.LoanID,
  C.Name AS CustomerName,
  L.LoanAmount,
  COALESCE(SUM(P.Amount), 0) AS TotalPaid,
  (L.LoanAmount - COALESCE(SUM(P.Amount), 0)) AS RemainingAmount
FROM 
  Loan L
JOIN Customer C ON L.CustomerID = C.CustomerID
LEFT JOIN Payment P ON L.LoanID = P.LoanID
GROUP BY L.LoanID, C.Name, L.LoanAmount;











SELECT 
  A.AccountID,
  C.Name AS CustomerName,
  MAX(T.Date) AS LastTransaction
FROM 
  Account A
JOIN Customer C ON A.CustomerID = C.CustomerID
LEFT JOIN Transaction T ON A.AccountID = T.AccountID
GROUP BY A.AccountID, C.Name
HAVING MAX(T.Date) < NOW() - INTERVAL 3 MONTH OR MAX(T.Date) IS NULL;











SELECT 
  B.BranchID,
  B.Name AS BranchName,
  DATE_FORMAT(T.Date, '%Y-%m') AS Month,
  SUM(T.Amount) AS TotalAmount
FROM 
  Branch B
JOIN Account A ON B.BranchID = A.BranchID
JOIN Transaction T ON A.AccountID = T.AccountID
GROUP BY B.BranchID, BranchName, Month
ORDER BY Month DESC;



SELECT 
  LoanID,
  PaymentDate,
  Amount,
  SUM(Amount) OVER (PARTITION BY LoanID ORDER BY PaymentDate) AS RunningTotal
FROM 
  Payment;
  

  

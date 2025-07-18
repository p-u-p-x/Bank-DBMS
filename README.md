# 🏦 Bank Management System

This project implements a **Bank Management System** using **SQL schema design**, **data manipulation**, and **advanced querying**. The system models the core functionalities of a bank—branch operations, employee management, customer accounts, transactions, and loan processing.

---

## 📋 Project Structure

### 🔹 SQL Tables
The schema consists of normalized tables representing key entities:
- `Branch`: Location data and contact details
- `Employee`: Staff details with branch assignment
- `Customer`: Personal and contact details
- `AccountType`: Classification of account offerings
- `Account`: Customer-linked bank accounts
- `TransactionType`: Deposit, withdrawal, etc.
- `Transaction`: Activity records on accounts
- `LoanType`: Loan categories
- `Loan`: Loan issuance and approval data
- `Payment`: Repayment records

### 🔹 ER Diagram
The included ERD visually maps relationships and helps navigate dependencies between entities such as:
- Customers ↔ Accounts
- Employees ↔ Loans & Transactions
- Branches ↔ Employees, Customers, and Accounts

---

## 🧠 Key Features

- Relational schema with foreign key constraints for data integrity
- Coverage of core banking modules: deposits, loans, payments
- Sample **INSERT**, **UPDATE**, and **DELETE** statements for simulation
- Advanced **JOIN** and **GROUP BY** queries for business insights:
  - Customers with account balances
  - Loan repayment summaries
  - Branch-wise transaction activity
  - Employees who approved loans
  - Customers without any loan records

---

## ⚙️ SQL Highlights

### ✨ Sample Queries
```sql
-- Retrieve customers and their account balances
SELECT C.Name, A.AccountID, AT.TypeName, A.Balance
FROM Customer C
JOIN Account A ON C.CustomerID = A.CustomerID
JOIN AccountType AT ON A.AccountTypeID = AT.AccountTypeID;

-- Loan repayment summary per customer
SELECT C.Name, L.LoanID, SUM(P.Amount) AS TotalPaid
FROM Customer C
JOIN Loan L ON C.CustomerID = L.CustomerID
JOIN Payment P ON L.LoanID = P.LoanID
GROUP BY C.CustomerID, L.LoanID;
```

---

## 🧪 Sample Data Insertions

```sql
INSERT INTO Branch VALUES (1, 'Main Branch', '123 Main St', 'Lahore', '0421234567');
INSERT INTO Employee VALUES (101, 'Ali Khan', 'ali@bank.com', '03211234567', 'Manager', 1, '2020-05-01');
INSERT INTO Customer VALUES (201, 'Sara Ahmed', 'sara@gmail.com', '03111234567', '45 Model Town', 1);
```

---

## 🔐 Permissions

Basic access control snippets using GRANT and REVOKE:

```sql
GRANT SELECT, INSERT ON BankDB.* TO 'bankuser'@'localhost';
REVOKE DELETE ON BankDB.* FROM 'bankuser'@'localhost';
```

---

## 📌 License
This project is for academic and learning purposes. Feel free to fork or adapt it—credit is appreciated!

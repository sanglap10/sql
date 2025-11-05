-- Table creation
CREATE TABLE Employee (
  empid INT,
  empname VARCHAR(MAX),
  city VARCHAR(50),
  phone INT,
  salary DECIMAL    
);

CREATE TABLE Departments (
  deptid INT,
  deptname VARCHAR(100)
);

-- ==== 1. SELECTION / READ ====

-- 1.1 Select all columns
SELECT * FROM Employee;

-- 1.2 Select specific columns
SELECT 
  empname, 
  city, 
  salary 
FROM Employee;

-- 1.3 WHERE with equals
SELECT * FROM Employee
WHERE city = 'Pune';    -- exact match

-- 1.4 WHERE with LIKE (pattern)
SELECT empid, empname FROM Employee
WHERE empname LIKE 'Adam%';    -- names starting with 'Adam'

-- 1.5 Math calculation: show Annual Salary (calculated on the fly)
SELECT 
  empid, 
  empname, 
  salary AS MonthlySalary,
  (salary * 12) AS AnnualSalary
FROM Employee;

-- 1.6 ORDER BY and TOP
SELECT TOP (10) 
  empid, 
  empname, 
  (salary * 12) AS AnnualSalary
FROM Employee
ORDER BY AnnualSalary DESC;    -- highest annual salaries first

-- 1.7 Aggregate example
-- Count employees by city
SELECT 
  city, 
  COUNT(*) AS EmployeeCount
FROM Employee
GROUP BY city;

-- ==== 2. INSERTION ====

-- 2.1 Insert a single record
INSERT INTO Employee 
  (empid, empname, city, phone, salary)
VALUES 
  (1, 'Adam John', 'Pune', '9999000001', 50000.00);

-- 2.2 Insert multiple records (SQL Server supports multi-row VALUES)
INSERT INTO Employee 
  (empid, empname, city, phone, salary)
VALUES
  (2, 'Priya Singh', 'Mumbai', '9999000002', 45000.00),
  (3, 'Alex Kumar', 'Bengaluru', '9999000003', 60000.00);

-- 2.3 Insert into Departments
INSERT INTO Departments 
  (deptid, deptname)
VALUES 
  (10, 'HR'), (20, 'Engineering');

-- ==== 3. UPDATE ====

-- 3.1 Update a single record (by empid)
UPDATE Employee
SET salary = 52000.00
WHERE empid = 1;

-- 3.2 Update multiple rows using a condition
-- Give a 5% raise to everyone in Pune
UPDATE Employee
SET salary = salary * 1.05
WHERE city = 'Pune';

-- 3.3 Update different values in one statement (CASE)
-- Give specific raises based on city
UPDATE Employee
SET salary = CASE
    WHEN city = 'Pune' THEN salary * 1.06
    WHEN city = 'Mumbai' THEN salary * 1.04
    ELSE salary
END
WHERE city IN ('Pune','Mumbai');  -- limits which rows are touched


-- ==== 4. ALTER TABLE — Add & Rename Column ====
-- 4.1 Add a new column (e.g., email)
ALTER TABLE Employee
ADD email NVARCHAR(100);    -- new column will be NULL for existing rows

-- 4.2 Add a column with a default value (use named default constraint)
ALTER TABLE Employee
ADD email VARCHAR(MAX);
-- Existing rows will get 1, new rows default to 1 unless specified.

-- 4.3 Add a computed (auto-calculated) column for AnnualSalary
ALTER TABLE Employee
ADD AnnualSalary AS (salary * 12);   -- computed column, auto-updates when salary changes


-- ==== 5. DELETE ====
-- 5.1 Delete a single record by empid
DELETE FROM Employee
WHERE empid = 3;

-- 5.2 Delete multiple records by condition
-- Remove employees with monthly salary less than 40,000
DELETE FROM Employee
WHERE salary < 40000;

-- 5.3 Delete multiple specific rows using IN
DELETE FROM Employee
WHERE empid IN (2, 5, 9);



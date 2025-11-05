SELECT * FROM EMPLOYEE
WHERE city = 'chandigarh'

SELECT * FROM EMPLOYEE

INSERT INTO EMPLOYEE
(empNAME,city,phone,salary)
VALUES
('deon','chandimandir',9786958,24000),
('modi','colapur',9786958,28000),
('rudra','asansol',9786958,34000),
('ratan','chandannagar',9786958,50000),
('sanglap','jabalpur',9786958,17000)

ALTER TABLE EMPLOYEE
ADD salary DECIMAL

UPDATE EMPLOYEE
SET salary = 10000
WHERE empID = 3

UPDATE EMPLOYEE
SET salary = 100000
WHERE empID IN (2,5)

SELECT * FROM EMPLOYEE
WHERE city LIKE '%r'

-- DELETE FROM EMPLOYEE
-- WHERE empID = 3

DELETE FROM EMPLOYEE
WHERE salary > 50000

SELECT 
    empNAME,
    city,
    salary,
    (salary * 12) AS annualSalary
FROM EMPLOYEE







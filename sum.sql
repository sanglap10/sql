SELECT * FROM sales

SELECT * FROM product

-- get sum
SELECT SUM(quantitySold) AS totalQuantitySold FROM sales

-- get total quantity
SELECT 
    SUM(s.quantitySold) AS totalQuantitySold,
    p.name
FROM sales s
JOIN product p ON p.productId = s.productId
WHERE p.name = 'soap'
GROUP BY p.name


-- get revenue & total quantity
SELECT 
SUM(P.price * S.quantitySold) AS revenew,
SUM(S.quantitySold) AS totalQuantitySold
FROM sales S 
JOIN product P ON P.productId = S.productId
WHERE P.name = 'soap'


SELECT 
    AVG(s.quantitySold)
FROM sales S 
JOIN product P ON P.productId = S.productId
WHERE P.name = 'soap'

-- JOINS

-- Show only common records
SELECT 
P.Name,
S.QuantitySold,
S.SaleDate,
S.ProductId
FROM Sales S
JOIN Product P ON P.ProductId = S.ProductId 

-- show all records from Product and show mull for sales
SELECT 
P.Name,
S.QuantitySold,
S.SaleDate,
S.ProductId
FROM Sales S
RIGHT JOIN Product P ON P.ProductId = S.ProductId 







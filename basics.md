1. SELECTION
    SELECT < * OR COlumn names > FROM

2. ALIAS
    alias is of a TABLE
    SELECT P.ProductName FROM Product P
    alias dot column name => P.ProductName
    Alias in JOINS - 
        SELECT 
            P.PoductName,
            S.SalePrice,
        FROM Product P 
        JOIN Sale S ON S.ProductId = P.ProductId

3. WHERE 
    to filter out records
    SELECT * FROM Product WHERE ProductName = 'Soap'
    LIKE %%
    %a -> ends with a
    a% -> starts with a
    %a% -> contains a

4. aggregate functions
    SELECT 
        COUNT(*) AS TotalTransactions,          -- How many sales happened?
        SUM(SellingPrice) AS TotalRevenue,      -- Total money earned
        AVG(SellingPrice) AS AverageSalePrice,  -- Average price of items sold
        MIN(SellingPrice) AS CheapestItemSold,  -- Lowest price sold
        MAX(SellingPrice) AS MostExpensiveSold  -- Highest price sold
    FROM Sales;

5. JOINS
    LEFT JOIN
    RIGHT JOIN
    to get matching records from tables
    to have relationship between tables
    to get all records from all tables

6. GROUP BY
    to remove duplicacy
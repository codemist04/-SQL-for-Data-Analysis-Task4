SELECT *
FROM Orders
WHERE Country = 'France'
ORDER BY InvoiceDate DESC;


SELECT Country, COUNT(*) AS TotalOrders
FROM Orders
GROUP BY Country
ORDER BY TotalOrders DESC;


SELECT e1.InvoiceNo, e1.CustomerID, e1.InvoiceDate
FROM Orders e1
INNER JOIN Orders e2 ON e1.CustomerID = e2.CustomerID
WHERE e1.Country = 'Germany'
LIMIT 10;


SELECT e1.CustomerID, e2.InvoiceNo
FROM Orders e1
LEFT JOIN Orders e2 ON e1.CustomerID = e2.CustomerID
LIMIT 10;


SELECT DISTINCT CustomerID
FROM Orders
WHERE CustomerID IN (
    SELECT CustomerID
    FROM Orders
    GROUP BY CustomerID
    HAVING SUM(UnitPrice * Quantity) > 1000
);


SELECT CustomerID, 
       ROUND(SUM(UnitPrice * Quantity), 2) AS TotalSpent,
       ROUND(AVG(UnitPrice * Quantity), 2) AS AvgOrderValue
FROM Orders
GROUP BY CustomerID
ORDER BY TotalSpent DESC;


CREATE VIEW CountryRevenue1 AS
SELECT Country, SUM(UnitPrice * Quantity) AS Revenue
FROM Orders
GROUP BY Country;


SELECT CustomerID, 
       ROUND(SUM(UnitPrice * Quantity) / COUNT(DISTINCT InvoiceNo), 2) AS AvgOrderValue
FROM Orders
WHERE CustomerID IS NOT NULL
GROUP BY CustomerID
ORDER BY AvgOrderValue DESC;


SELECT Country, 
       ROUND(SUM(UnitPrice * Quantity), 2) AS TotalRevenue
FROM Orders
WHERE Country != 'United Kingdom'
GROUP BY Country
ORDER BY TotalRevenue DESC
LIMIT 5;


SELECT Description, SUM(Quantity) AS TotalQuantity
FROM Orders
GROUP BY Description
ORDER BY TotalQuantity DESC
LIMIT 1;








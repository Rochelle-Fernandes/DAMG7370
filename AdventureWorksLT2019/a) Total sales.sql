
-- Total sales $ Using SalesOrderHeader (ties to customer)
SELECT CONCAT(c.FirstName, ', ', c.LastName) AS Customer_Name, SUM(soh.SubTotal) as Total_Sale
FROM SalesLT.Customer c
LEFT JOIN SalesLT.SalesOrderHeader soh
ON c.CustomerID = soh.CustomerID
GROUP BY c.FirstName, c.LastName
ORDER BY sum(soh.SubTotal) DESC;

--Total sales $ Using SalesOrderDetail (ties to product)
SELECT p.Name as Product_Name, SUM(sod.LineTotal) as Total_Sale
FROM SalesLT.Product p
LEFT JOIN SalesLT.SalesOrderDetail sod
ON p.ProductID = sod.ProductID
GROUP BY p.Name
ORDER BY Total_Sale DESC;


--Total sales $ Comparison querying with SalesOrderHeader vs SalesOrderDetail
SELECT CONCAT(c.FirstName, ', ', c.LastName) AS Customer_Name, SUM(soh.SubTotal) as 'Total Sale for Customer', p.Name as Product_Name,
SUM(sod.LineTotal) as 'Total Sale for Product'
FROM SalesLT.Customer c
LEFT JOIN SalesLT.SalesOrderHeader soh
ON c.CustomerID = soh.CustomerID
LEFT JOIN SalesLT.SalesOrderDetail sod
ON soh.SalesOrderID = sod.SalesOrderID
LEFT JOIN SalesLT.Product p
ON sod.ProductID = p.ProductID
GROUP BY c.FirstName, c.LastName, p.Name
ORDER BY  c.LastName, p.Name, SUM(soh.SubTotal) DESC, SUM(sod.LineTotal) DESC;













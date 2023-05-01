--Total sales $ by customer (person) – ranked/sorted (highest to lowest)
SELECT CONCAT(c.FirstName, ', ', c.LastName) AS Customer_Name, SUM(soh.SubTotal) as Total_Sale
FROM SalesLT.Customer c
LEFT JOIN SalesLT.SalesOrderHeader soh
ON c.CustomerID = soh.CustomerID
GROUP BY c.FirstName, c.LastName
ORDER BY sum(soh.SubTotal) DESC;
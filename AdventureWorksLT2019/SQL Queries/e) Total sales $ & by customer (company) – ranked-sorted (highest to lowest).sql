--Total sales $ by customer (company) – ranked/sorted (highest to lowest)
SELECT c.CompanyName, SUM(soh.SubTotal) as Total_Sale
FROM SalesLT.Customer c 
LEFT JOIN SalesLT.SalesOrderHeader soh
ON c.CustomerID = soh.CustomerID
GROUP BY  c.CompanyName
ORDER BY sum(soh.SubTotal) DESC;
--Sales $ by Company (Reseller)
SELECT c.CompanyName, SUM(sod.LineTotal) as Total_Sale
FROM SalesLT.Customer c
LEFT JOIN SalesLT.SalesOrderHeader soh
ON c.CustomerID = soh.CustomerID
LEFT JOIN SalesLT.SalesOrderDetail sod
ON sod.SalesOrderID = soh.SalesOrderID
GROUP BY c.CompanyName
ORDER BY sum(sod.LineTotal) DESC;
--Product Category Sales $ by Company (Reseller)
SELECT c.CompanyName AS Company_Name, SUM(sod.LineTotal) as Total_Sales_by_Company, pc.Name AS Product_Category_Name
FROM SalesLT.Customer c
left join SalesLT.SalesOrderHeader soh
ON c.CustomerID = soh.CustomerID
left join SalesLT.SalesOrderDetail sod
ON soh.SalesOrderID = sod.SalesOrderID
left join SalesLT.Product p
ON p.ProductID = sod.ProductID
left join SalesLT.ProductCategory pc
ON pc.ProductCategoryID = p.ProductCategoryID
WHERE pc.Name is NOT NULL
GROUP BY c.CompanyName, pc.Name
ORDER BY Total_Sales_by_Company DESC;
 

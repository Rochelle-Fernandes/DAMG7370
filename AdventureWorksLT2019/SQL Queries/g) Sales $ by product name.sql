--Sales $ by product name – ranked/sorted (highest to lowest)
SELECT p.Name as Product_Name, SUM(sod.LineTotal) as Total_Sale
FROM SalesLT.Product p
LEFT JOIN SalesLT.SalesOrderDetail sod
ON p.ProductID = sod.ProductID
GROUP BY p.Name
ORDER BY Total_Sale DESC;

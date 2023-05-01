--Sales $ by product category hierarchy – Product & vGetAllCategories
SELECT c.Name AS 'Parent product category', pc.Name AS 'Product category',p.Name AS 'Product name', sum(sod.LineTotal) AS 'Sales'
From SalesLT.ProductCategory c INNER JOIN SalesLT.ProductCategory pc
ON c.ProductCategoryID=pc.ParentProductCategoryID
LEFT JOIN SalesLT.Product p 
ON pc.ProductCategoryID = p.ProductCategoryID
LEFT JOIN SalesLT.SalesOrderDetail sod
ON sod.ProductID = p.ProductID
GROUP BY c.Name, pc.Name, p.Name
ORDER BY c.Name, pc.Name, p.Name;


SELECT c.Name AS 'Parent product category',g.ParentProductCategoryName AS 'Product category Name',p.Name AS 'Product name', SUM(sod.LineTotal) AS 'Sales'
FROM SalesLT.ProductCategory c JOIN SalesLT.vGetAllCategories g
ON c.ProductCategoryID=g.ProductCategoryID
LEFT JOIN SalesLT.Product p 
ON g.ProductCategoryID = p.ProductCategoryID
LEFT JOIN SalesLT.SalesOrderDetail sod
ON sod.ProductID = p.ProductID
GROUP BY  c.Name, g.ParentProductCategoryName, p.Name
ORDER BY g.ParentProductCategoryName, c.Name, p.Name


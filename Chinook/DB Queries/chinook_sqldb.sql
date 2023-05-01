--Total sales by salesperson (employee)

SELECT e.EmployeeId, e.FirstName AS 'FirstName', e.LastName AS 'LastName', SUM(i.Total) AS 'TotalSales'
FROM chinook.Employee e
LEFT JOIN chinook.Customer c 
ON e.EmployeeId = c.SupportRepId 
LEFT JOIN chinook.Invoice i 
ON i.CustomerId = c.CustomerId 
GROUP BY e.EmployeeId , e.FirstName, e.LastName 
ORDER BY TotalSales DESC


--Total tracks bought and total revenue by media type
SELECT mt.Name AS MediaType, SUM(il.Quantity) AS TotalTracks, SUM(il.UnitPrice*il.Quantity) AS TotalRevenue
FROM chinook.Track t 
RIGHT JOIN chinook.MediaType mt 
ON t.MediaTypeId = mt.MediaTypeId 
LEFT JOIN chinook.InvoiceLine il 
ON t.TrackId = il.TrackId 
GROUP BY mt.Name 



--Total Sales by Customer

SELECT c.FirstName, c.LastName, SUM(i.Total) AS TotalSales
FROM chinook.Customer c 
LEFT JOIN chinook.Invoice i
ON c.CustomerId = i.CustomerId 
GROUP BY c.FirstName, c.LastName
ORDER BY TotalSales DESC


--Total Sales by Genre
SELECT g.Name AS GenreName, SUM(il.UnitPrice*il.Quantity) AS TotalSales
FROM chinook.Genre g 
LEFT JOIN chinook.Track t 
ON g.GenreId = t.GenreId 
LEFT JOIN chinook.InvoiceLine il 
ON t.TrackId = il.TrackId 
GROUP BY g.Name 
ORDER BY TotalSales DESC

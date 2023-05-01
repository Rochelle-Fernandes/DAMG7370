--Total sales $ by country, state & city
SELECT a.CountryRegion  'Country', a.StateProvince 'State' , a.City 'City',SUM(soh.SubTotal) 'Total Sales by Country'
FROM SalesLT.Address a
LEFT JOIN SalesLT.SalesOrderHeader soh
ON a.AddressID = soh.BillToAddressID
GROUP BY a.CountryRegion, a.StateProvince, a.City
ORDER BY 'Total Sales by Country';
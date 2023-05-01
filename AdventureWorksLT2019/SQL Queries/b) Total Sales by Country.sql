

--Total sales $ by country – ranked/sorted (highest to lowest)
SELECT a.CountryRegion  'Country', SUM(soh.SubTotal) 'Total Sales by Country'
FROM SalesLT.Address a
LEFT JOIN SalesLT.SalesOrderHeader soh
ON a.AddressID = soh.BillToAddressID
GROUP BY a.CountryRegion
ORDER BY 'Total Sales by Country' DESC;

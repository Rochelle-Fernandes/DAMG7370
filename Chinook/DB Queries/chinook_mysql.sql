/*Total sales by customer ranked*/
select c.CustomerId, c.FirstName, c.LastName, SUM(i.Total) as TotalSales,
ROW_NUMBER() OVER(ORDER BY SUM(i.Total) desc) ranked
from customer c 
left join invoice i 
on c.CustomerId = i.CustomerId 
group by c.CustomerId, c.FirstName, c.LastName;

/*Without row number*/
select c.CustomerId, c.FirstName, c.LastName, SUM(i.Total) as TotalSales
from customer c 
join invoice i 
on c.CustomerId = i.CustomerId 
group by c.CustomerId, c.FirstName, c.LastName
order by TotalSales desc



/*Total sales by artist ranked*/
select ar.Name, sum(il.UnitPrice * il.Quantity) as TotalSales,
ROW_NUMBER() OVER(ORDER BY SUM(il.UnitPrice * il.Quantity) desc) ranked
from artist ar
left join album a 
on ar.ArtistId  = a.ArtistId  
left join track t 
on t.AlbumId  = a.AlbumId 
left join invoiceline il 
on il.TrackId  = t.TrackId 
group by ar.Name

/*Total sales by albums*/
select a.Title as AlbumName, sum(il.UnitPrice * il.Quantity) as TotalSales
from album a
left join track t 
on t.AlbumId  = a.AlbumId 
left join invoiceline il 
on il.TrackId = t.TrackId 
group by a.Title 
order by TotalSales desc


--Total Sales
select sum("UnitPrice" * "Quantity") as TotalSales
from "InvoiceLine"  

--Total sales by country ranked
select i."BillingCountry" as Country, SUM(il."UnitPrice" * il."Quantity") as TotalSales,
ROW_NUMBER() OVER(ORDER BY SUM(il."UnitPrice" * il."Quantity") desc) rank
from "Invoice" i 
left join "InvoiceLine" il 
on i."InvoiceId" = il."InvoiceId"
group by i."BillingCountry";

--Without row_number
select i."BillingCountry" as Country, SUM(il."UnitPrice" * il."Quantity") as TotalSales
from "Invoice" i 
join "InvoiceLine" il 
on i."InvoiceId" = il."InvoiceId"
group by i."BillingCountry"
order by TotalSales desc

--Total sales by country, state & city
select i."BillingCountry" as Country, i."BillingState" as State, i."BillingCity" as City, 
SUM(il."UnitPrice" * il."Quantity") as TotalSales
from "Invoice" i 
join "InvoiceLine" il 
on i."InvoiceId" = il."InvoiceId"
group by i."BillingCountry", i."BillingState", i."BillingCity"

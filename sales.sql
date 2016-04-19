create table Sales (SalesID GUID not null, ProductID int not null, [Datetime] smalldatetime, CustomerID int)

select s.ProductID, COUNT(*) as CountOfFirstPosition from Sales s inner join 
 (select SalesID, MAX([Datetime]) as FirstProductOfSales from Sales) fs on (s.SalesID=fs.SalesID and s.[Datetime]=fs.FirstProductOfSales)
group by s.ProductID

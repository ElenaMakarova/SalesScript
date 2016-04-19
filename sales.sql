create table Sales (SalesID GUID not null, ProductID int not null, [Datetime] smalldatetime, CustomerID int)

select s.ProductID, COUNT(*) as CountOfFirstPosition from Sales s inner join 
 (select sa.SalesID as SalID, MAX(sa.[Datetime]) as FirstProductOfSales from Sales sa) fs on (s.SalesID = fs.SalID and s.[Datetime] = fs.FirstProductOfSales)
group by s.ProductID

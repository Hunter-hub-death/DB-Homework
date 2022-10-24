SELECT CategoryName,count(*) as Sum,round(avg(UnitPrice),2) as Avg,min(UnitPrice) as A,max(UnitPrice) as B,sum(UnitsOnOrder) as Sum
FROM Category,Product
WHERE Product.CategoryId=Category.Id
GROUP BY Category.Id
HAVING sum>10
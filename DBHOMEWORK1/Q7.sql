SELECT COMPANYNAME,CID,TOTAL FROM
	(SELECT NTILE(4)OVER(Order BY TOTAL ASC) AS GROUPID ,COMPANYNAME,CID,TOTAL FROM 
	(SELECT CompanyName AS COMPANYNAME,Customer.id AS CID , ROUND(SUM(UnitPrice*Quantity),2) AS TOTAL
	FROM OrderDetail, "Order",Customer 
	WHERE Customer.id="Order".CustomerId AND "Order".id=OrderDetail.OrderId
	Group By Customer.id
	Order By Customer.id))
	WHERE GROUPID=1;
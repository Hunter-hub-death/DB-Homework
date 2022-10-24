SELECT ORDERID,DATE,PreDate,ROUND(JulianDay(DATE)-JulianDay(PreDate),2)FROM
	(SELECT DISTINCT ORDERID,DATE AS DATE, 
	CASE
		WHEN (ORDERID=MID) THEN DATE
		WHEN (ORDERID=ORDERID_1) THEN Date2
	END AS PreDATE
	FROM
	(SELECT id AS MID,MIN(Orderdate) AS MOD FROM "Order" WHERE CustomerId="BLONP"),
	(SELECT id AS ORDERID ,Orderdate AS DATE FROM "Order" WHERE CustomerId="BLONP" Order BY DATE asc),
	(SELECT O1.id AS ORDERID_1,MAX(O2.orderdate) AS Date2 
	FROM "Order"O1,"Order"O2 WHERE O1.Customerid ="BLONP" AND O2.Customerid ="BLONP" AND O2.orderdate<O1.orderdate
	GROUP BY O1.id
	Order By O1.orderdate asc)
	WHERE ORDERID=MID OR ORDERID=ORDERID_1
	Order By DATE asc
	LIMIT 10 OFFSET 0);
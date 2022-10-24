SELECT distinct ShipName,substr(ShipName,1,instr(ShipName,'-')-1) 
FROM 'order' 
WHERE ShipName like '%-%'order by ShipName;

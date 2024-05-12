--2.	Найти среднюю и суммарную стоимость, которая больше 10, из таблицы Production.ProductCostHistory.
 
select AVG("StandardCost" ), SUM("StandardCost")
from "Production"."ProductCostHistory"
where "StandardCost" > 10;
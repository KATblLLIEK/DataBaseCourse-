--Найти среднюю и суммарную стоимость, где StandardCost
--больше 10, из таблицы Production.ProductCostHistory. Не
--учитывать нулевую стоимость.
select avg("StandardCost") as "AvgPrice"
, sum("StandardCost") as "SumPrice"
from "Production"."ProductCostHistory" pch 
where "StandardCost" > 10 

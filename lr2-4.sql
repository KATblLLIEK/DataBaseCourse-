--Найти цвета (Color) из таблицы Production.Product, где
--суммарная и средняя стоимость товаров больше 1000 и 100
--соответственно (из выборки исключить пустые поля).
select "Color" 
	, avg ("StandardCost") as "avg"
	, max("StandardCost") as "max"   
from "Production"."Product" p 
where  "Color"  is not null 
group by "Color" 
having avg ("StandardCost") > 100 and max("StandardCost") > 1000

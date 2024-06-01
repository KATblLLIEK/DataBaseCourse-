--4.	Найти цвета из таблицы Production.Product, где суммарная и средняя стоимость товаров больше 1000 и 100 соответственно (из выборки исключить пустые поля).
select "Color"
from "Production"."Product"
group by "Color"
having (SUM("StandardCost") > 1000)
and (AVG("ListPrice") > 100);


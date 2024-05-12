--3.	Показать количество заказов из разных городов, основываюсь на таблице Person.Address (из выборки исключить пустые поля).

select "City", count( * ) AS Orders
from "Person"."Address"
where "City" is not null and "City" <> ''
group by "City"

select *
from "Person"."Address"
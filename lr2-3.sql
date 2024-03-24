--Показать количество разных городов, основываясь на таблице
--Person.Address.
select count (distinct "City")
from "Person"."Address" a 
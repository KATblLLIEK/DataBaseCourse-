--Изменить запрос п.5 использовать CUBE.Отделить строки, созданные с
--помощью агрегатных функций от строк из фактической таблицы.

select "PersonID", count(*) as IDCount, "StoreID"
from "Sales"."Customer" c
where "PersonID" is not null
group by cube ("PersonID", "StoreID")
having grouping("PersonID") = 0 

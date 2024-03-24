--Изменить запрос п.5 использовать CUBE. Отделить строки, созданные с
--помощью агрегатных функций от строк из фактической таблицы.
select  count ( "PersonID")
	,"PersonID"
	, "StoreID" 
	, grouping ("PersonID") as "Grouping" 
from "Sales"."Customer" c 
where  "PersonID" notnull 
group by cube ("PersonID" , "StoreID")
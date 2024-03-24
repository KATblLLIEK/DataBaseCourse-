--Вывести PersonID, StoreID
--предусмотреть вывод количества PersonID для всех PersonID
--имеющих значение (NOT NULL) из таблицы Sales.Customer.
--(Использовать ROOLUP).
select  count ( "PersonID")
	,"PersonID"
	, "StoreID" 
from "Sales"."Customer" c 
where  "PersonID" notnull 
group by rollup ("PersonID" , "StoreID")
--Изменить запрос п.5 использовать GROUPING SETS. Отделить строки,
--созданные с помощью агрегатных функций от строк из фактической
--таблицы.

select 
    "PersonID",
    count(*) as "IDCount",
    "StoreID"
from  "Sales"."Customer" c 
where "PersonID" is not null
group by grouping sets (("PersonID"), ("StoreID"))
having  count(*) > 1;

--Найти количество различных имен штатов из таблицы
--Person.StateProvince.
select count(distinct "Name") as "Diffirent Names" 
from "Person"."StateProvince" sp 
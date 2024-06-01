
--1.	Найти количество различных имен штатов из таблицы Person.StateProvince.

select count(distinct "Name")
from "Person"."StateProvince" sp  
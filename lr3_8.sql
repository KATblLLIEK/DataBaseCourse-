--Показать список BusinessEntityID, которые содержатся и в
--таблице
--Person.Person,
--и
--в
--таблице
--HumanResources.EmployeePayHistory.

select "BusinessEntityID"
from "Person"."Person"
intersect
select "BusinessEntityID"
from "HumanResources"."EmployeePayHistory"
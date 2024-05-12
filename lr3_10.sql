--Пропустить 15 строк из результирующего набора, полученного в п.9.

select "BusinessEntityID"
from "Person"."Person"
intersect
select "BusinessEntityID"
from "HumanResources"."EmployeePayHistory"
order by "BusinessEntityID" 
offset 15
--Ограничить результирующий набор, полученный в п.8.

select "BusinessEntityID"
from "Person"."Person"
intersect
select "BusinessEntityID"
from "HumanResources"."EmployeePayHistory"
order by "BusinessEntityID" 
limit 6
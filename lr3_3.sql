

select "BusinessEntityID"
from "Person"."Person"
intersect
select "BusinessEntityID"
from "HumanResources"."EmployeePayHistory"
order by "BusinessEntityID" 
offset 6
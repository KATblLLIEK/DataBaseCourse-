--Вывести название должности сотрудника, а также название должности
--сотрудника,   который   был   нанят   перед   ним
--("HumanResources"."Employee").


select 
    e1."JobTitle" as "CurrentJobTitle",
    e2."JobTitle" as "PreviousJobTitle"
from 
    "HumanResources"."Employee" e1
left join 
    "HumanResources"."Employee" e2
on 
    e1."HireDate" > e2."HireDate"
left join 
    "HumanResources"."Employee" e3
on 
    e2."HireDate" < e3."HireDate" and e1."HireDate" > e3."HireDate"
where 
    e3."BusinessEntityID" is null
order by 
    e1."HireDate";
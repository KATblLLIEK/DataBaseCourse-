--Вывести название должности сотрудника, а также название должности
--сотрудника,   который   был   нанят   перед   ним
--("HumanResources"."Employee").


with "employeecte" as (
    select "e1"."BusinessEntityID", "e1"."JobTitle", 
           row_number() over (order by "e1"."HireDate") as "rn"
    from "HumanResources"."Employee" "e1"
)
select "e1"."JobTitle" as "CurrentJobTitle", "e2"."JobTitle" as "PreviousJobTitlee"
from "employeecte" "e1"
left join "employeecte" "e2" on "e1"."rn" = "e2"."rn" + 1;
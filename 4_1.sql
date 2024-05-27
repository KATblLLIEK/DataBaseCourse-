--Показать   товары   с   самым   меньшим  ReorderPoint.   (Таблица
--Production.Product). Вывести наименование и ReorderPoint.

select "Name", "ReorderPoint"
from "Production"."Product"
where "ReorderPoint" = (
    select min("ReorderPoint")
    from "Production"."Product"
);
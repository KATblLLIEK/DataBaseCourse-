
--5.	Вывести DueDate из таблицы Production.WorkOrder, где среднее по OrderQty меньше 10. 
--Добавить столбец с рангом, идущим по порядку, определяя его порядок в зависимости от среднего количества. 
--(Использовать DENSE_RANK).


select "DueDate", AVG("OrderQty") as Average_Quantity, dense_rank() over (order by AVG("OrderQty")) as Rank
from "Production"."WorkOrder"
group by "DueDate"
having AVG("OrderQty") < 10;


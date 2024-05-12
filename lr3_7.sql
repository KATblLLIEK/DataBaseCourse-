--Показать
--комбинированный
--список
--таблиц
---Purchasing.ProductVendor
--по
---полям
--ProductID,
--StandardPrice,
--Purchasing.PurchaseOrderDetail
--по
--полям ProductID, UnitPrice, используя UNION.

select pv."ProductID" 
	, pv."StandardPrice" as "price"
from "Purchasing"."ProductVendor" pv 
UNION
select pod."ProductID"
	, pod."UnitPrice"
from "Purchasing"."PurchaseOrderDetail" pod 



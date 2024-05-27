--Показать  ProductID  товаров,  StandardPrice  которых   меньше
--средней   товаров   того   же  AverageLeadTime  (Таблица
--Purchasing.ProductVendor).   Показать   поля  ProductID,
--AverageLeadTime и StandardPrice.


with "AveragePrices" as (
    select "AverageLeadTime", avg("StandardPrice") as "avgstandardprice"
    from "Purchasing"."ProductVendor"
    group by "AverageLeadTime"
)
select "pv"."ProductID", "pv"."AverageLeadTime", "pv"."StandardPrice"
from "Purchasing"."ProductVendor" "pv"
inner join "AveragePrices" "ap" on "pv"."AverageLeadTime" = "ap"."AverageLeadTime"
where "pv"."StandardPrice" < "ap"."avgstandardprice";



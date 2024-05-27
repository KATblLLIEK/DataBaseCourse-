
--Показать самую позднюю EndDate для каждого компонента (Таблица
--Production.BillOfMaterial).
 --Показать поля BillOfMaterialID, ComponentID, EndDate

select distinct("BillOfMaterialsID"),"ComponentID" , max("EndDate") as "enddate"
from "Production"."BillOfMaterials" bom2 
group by "ComponentID","BillOfMaterialsID";
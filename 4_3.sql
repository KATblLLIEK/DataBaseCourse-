--Показать самую позднюю EndDate для каждого компонента (Таблица
--Production.BillOfMaterial).
 --Показать поля BillOfMaterialID, ComponentID, EndDate

select 
    bom."BillOfMaterialsID",
    bom."ComponentID",
    bom."EndDate"
from 
    "Production"."BillOfMaterials" bom
inner join (
    select 
        "ComponentID", 
        max("EndDate") as "EndDate"
    from 
        "Production"."BillOfMaterials"
    group by "ComponentID"
			)
sub on bom."ComponentID" = sub."ComponentID" and bom."EndDate" = bom."EndDate"
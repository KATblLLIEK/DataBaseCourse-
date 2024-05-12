--Показать список типов спецпредложений (Type), которые имеют
--несколько категорий получателей спецпредложения (Category), из
--таблицы Sales.SpecialOffer, используя SELF JOIN.


 SELECT DISTINCT so."Type"
 	, so."Category"
FROM "Sales"."SpecialOffer" so
INNER JOIN "Sales"."SpecialOffer" so2
ON so."Type" = so2."Type"
WHERE so."Category" <> so2."Category"
ORDER BY so."Type";
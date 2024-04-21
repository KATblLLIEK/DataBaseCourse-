--Показать
--список
--категорий
--получателей
--спецпредложения
--(Category), которые имеют несколько типов спецпредложений
--(Type), из таблицы Sales.SpecialOffer, используя SELF JOIN.
SELECT DISTINCT so."Category"	
 	,so."Type"
FROM "Sales"."SpecialOffer" so
INNER JOIN "Sales"."SpecialOffer" so2
ON so."Category" = so2."Category"
WHERE so."Type" <> so2."Type"
ORDER BY so."Category";
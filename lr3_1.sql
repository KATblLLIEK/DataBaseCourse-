--Показать названия единиц измерения размера товаров и названия
--товаров
---(поля
--Name)
--из
--таблиц Production.Product
--Production.UnitMeasure.

SELECT u."Name"
	, p."Name"
FROM "Production"."Product" AS p
JOIN "Production"."UnitMeasure" AS u ON p."SizeUnitMeasureCode" = u."UnitMeasureCode"
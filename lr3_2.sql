--Показать список товаров (поле Name), в котором указано, указана ли
--электронная
--почта
--рецензента
--товара
--или
--нет,
--из
--таблиц
--Production.Product,
--Production.ProductRewiew,
--используя LEFT OUTER JOIN.
SELECT p."Name",
       COALESCE(( "EmailAddress"), '') AS "HasReviewerEmail"
FROM "Production"."ProductReview" pr 
LEFT OUTER JOIN "Production"."Product" p  
 ON p."ProductID" = pr."ProductID"
--Показать список имен (FirstName) заканчивающихся на «a»,
--которые имеют несколько фамилий (LastName) из таблицы
--Person.Person, используя SELF JOIN.



SELECT DISTINCT p."FirstName"
	,p. "LastName" 
FROM "Person"."Person" p
INNER JOIN "Person"."Person" pp ON p."FirstName" = pp."FirstName" 
WHERE p."FirstName" LIKE '%a'
AND p."LastName" <> pp."LastName"
ORDER BY p."FirstName"



--Показать список людей (поля FirstName, LastName), в котором
--указано, есть ли у человека ставка оплаты (Rate) или нет, из таблиц
--HumanResources.EmployeePayHistory,
--Person.Person,
--используя RIGHT OUTER JOIN.



SELECT eph."BusinessEntityID",
       pe."FirstName",
       pe."LastName",
       COALESCE(eph."Rate", 0) AS PayRate
FROM "HumanResources"."EmployeePayHistory" eph
RIGHT OUTER JOIN "Person"."Person" pe ON eph."BusinessEntityID" = pe."BusinessEntityID"

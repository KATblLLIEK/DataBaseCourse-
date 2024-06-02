-- Создание таблицы Guests (информация о гостях)
CREATE TABLE "Guests" (
    "GuestID" INT ,
    "FirstName" VARCHAR(255),
    "LastName" VARCHAR(255),
    "DateOfBirth" DATE,
    "PhoneNumber" VARCHAR(255),
    "VisitCount" INT,
    "Discount" Decimal (3,2)
)
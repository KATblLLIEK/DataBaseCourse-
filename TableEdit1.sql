alter table "RoomReservation" -- Добавление столбца
add column "Persons" numeric;

alter table "RoomReservation" -- Удаление столбца
drop column "Status"

alter table "RoomReservation" 
add column "RoomNumber" int;

alter table "RoomReservation" 
add column "CurenDate" date;

alter table "RoomReservation"  -- создание типа Date
add column "TestColumn" varchar;

alter table "RoomReservation" 
alter column "TestColumn"   -- изменение типа данных 
type varchar(50)
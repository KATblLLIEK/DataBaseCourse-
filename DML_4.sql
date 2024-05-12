--В отдельном файле написать скрипт, который создает копию таблицы
--по условию.
select gi."Name"
 , gi."PhoneNumber"
 , gi."RoomNumber"
into table "GuestInfo"
from "GuestInformation" gi  
where gi."Name" like 'Smith';
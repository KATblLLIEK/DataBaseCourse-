--В отдельном файле написать скрипт, который создает копию таблицы с
--выбранными полями.
select gi."Name"
 , gi."PhoneNumber"
into table "BriefGuestInfo1" 
from "GuestInformation" gi ;
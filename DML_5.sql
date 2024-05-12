--В отдельном файле написать скрипт, который создает копию таблицы
--без данных.
select *
into TABLE "InfoCopy" 
from "GuestInformation" gi  
where 1 = 2;
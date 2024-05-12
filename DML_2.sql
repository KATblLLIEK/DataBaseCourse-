--В отдельном файле написать скрипт, который создает полную копию
--одной из таблиц.

insert into "GuestInfoCopy"
select * from "GuestInformation" gi 


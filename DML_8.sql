--В отдельном файле написать скрипт, который создает таблицу,
--имеющую дубликаты строк. Написать скрипт, который удаляет
--дубликаты.

delete
from "GuestInfoCopy" 
where ctid not in
(select MAX(ctid) from "GuestInfoCopy" 
group by  "GuestInfoCopy"."Name");
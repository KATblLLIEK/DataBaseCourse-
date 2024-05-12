--В отдельном файле написать скрипт, который изменяет данные в
--таблице по критерию.

update  "GuestInfoCopy" 
set "Name"  = 'Анна'
where "Name" like 'Anna';
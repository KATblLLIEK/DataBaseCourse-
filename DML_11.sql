--В отдельном файле написать скрипт, который показывает работу с
--оператором MERGE.

merge into "GuestInfoCopy" AS Source
using "BriefGuestInfo" AS Target
 on (Source."Name" = Target."Name")
when matched
 then update
 set "RoomNumber" = Target."RoomNumber"
when not matched
 then insert
 values (Target."Name", Target."RoomNumber", Target."PhoneNumber");

alter table "Rooms" 
add constraint "PK_Rooms"
primary key ("Room Number");

alter table "RoomReservation"
add constraint "PK_RoomReservation"
primary key ("RoomNumber");

alter table "GuestInformation" 
add constraint "PK_GuestInformation"
primary key ("RoomNumber");
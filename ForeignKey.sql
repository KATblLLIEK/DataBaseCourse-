alter table "RoomReservation" 
add constraint "FK_Rooms_RoomReservation"
foreign key ("RoomNumber")
references "Rooms" ("Room Number") 
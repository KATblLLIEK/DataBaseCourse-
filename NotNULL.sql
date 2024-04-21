alter table "Rooms" 
alter column "Room Number"
set not null ;

alter table "Rooms" 
alter column "Status"
set not null ;

alter table "Rooms" 
alter column "Room Class"
set not null ;

alter table "Rooms" 
alter column "Maximum Guests"
set not null ;

-- ограничения для таблицы RoomReservation

alter table "RoomReservation"  
alter column "CheckInDate"
set not null ;

alter table "RoomReservation"  
alter column "CheckOutDate"
set not null ;

alter table "RoomReservation"  
alter column "GuestName"
set not null ;

alter table "RoomReservation"  
alter column "Persons"
set not null ;

alter table "RoomReservation"  
alter column "RoomNumber"
set not null ;
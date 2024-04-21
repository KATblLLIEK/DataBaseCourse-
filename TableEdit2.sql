alter table "Rooms"  -- изменение названия столбца 
rename column "Max Capacity"
to "Maximum Guests"

alter table "Rooms"
add column "Status" varchar(25)
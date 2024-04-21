alter table "Rooms"
add constraint "CH_Room_Room Number"
check ("Room Number" > 0)

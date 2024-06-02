ALTER TABLE "RoomServices"
ADD CONSTRAINT "PK_RoomServices"
PRIMARY KEY ("RoomServiceID");

ALTER TABLE "RoomServices"
ADD constraint "FK_Rooms_RoomServices"
FOREIGN KEY ("RoomNumber")
REFERENCES "Rooms"("RoomNumber");
 
ALTER TABLE "RoomServices"
ADD constraint "FK_Services_RoomServices"
FOREIGN KEY ("ServiceID") 
REFERENCES "Services"("ServiceID");

ALTER TABLE "RoomServices"
ADD CONSTRAINT "FK_Services_RoomServices"
FOREIGN KEY ("ServiceID") 
REFERENCES "Services"("ServiceID");
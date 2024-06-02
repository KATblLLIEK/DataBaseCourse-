ALTER TABLE "Reservations"
ADD CONSTRAINT "PK_Reservations"
PRIMARY KEY ("ReservationID");

ALTER TABLE "Reservations"
ALTER COLUMN "CheckInDate"
SET NOT NULL;

ALTER TABLE "Reservations"
ALTER COLUMN "CheckOutDate"
SET NOT NULL;

ALTER TABLE "Reservations"
ADD CONSTRAINT "FK_Rooms_Reservations"
FOREIGN KEY ("RoomNumber") 
REFERENCES "Rooms"("RoomNumber");

ALTER TABLE "Reservations"
ADD CONSTRAINT "FK_Guests_Reservations"
FOREIGN KEY ("GuestID") 
REFERENCES "Guests"("GuestID");


ALTER TABLE "Reservations"
ADD CONSTRAINT "CH_Reservations_CheckOutDate"
CHECK ("CheckOutDate" >= "CheckInDate");
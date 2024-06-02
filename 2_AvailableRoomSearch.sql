CREATE OR REPLACE VIEW "AvailableRoomsView" AS
SELECT 
    r."RoomNumber",
    r."Beds",
    r."Price",
    ROW_NUMBER() OVER (PARTITION BY r."Beds" ORDER BY r."Price" ASC) as "RoomRank"
FROM 
    "Rooms" r
WHERE 
    r."IsAvailable" = TRUE
    AND NOT EXISTS (
        SELECT 1
        FROM "Reservations" res
        WHERE res."RoomNumber" = r."RoomNumber"
        AND res."CheckInDate" <= CURRENT_DATE
        AND res."CheckOutDate" >= CURRENT_DATE
    );
    
   
   --Вызов представления view
   SELECT "RoomNumber", "Beds", "Price"
FROM "AvailableRoomsView"
WHERE "Beds" >= 1;
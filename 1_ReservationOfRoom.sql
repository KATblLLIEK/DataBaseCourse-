CREATE OR REPLACE FUNCTION "ReserveRoom"(
    p_GuestID INT,
    p_NumberOfBeds INT,
    p_CheckInDate DATE,
    p_CheckOutDate DATE,
    p_SelectedServices INT[]
) RETURNS TABLE (
    GuestID INTEGER,
    RoomNumber INTEGER,
    CheckInDate DATE,
    CheckOutDate DATE,
    ConnectedServices TEXT,
    FinalPrice NUMERIC
) AS 
$$
DECLARE
    v_GuestRecord RECORD;
    v_RoomNumber INT;
    v_ServiceDetails TEXT;
    v_Discount DECIMAL;
    v_TotalPrice DECIMAL;
    v_ServiceID INT;
    v_ServiceName VARCHAR(255);
    v_ServiceCost NUMERIC;
    v_ServicesTotalCost NUMERIC := 0;
BEGIN
    -- Получение данных о госте по ID
    SELECT * INTO v_GuestRecord FROM "Guests" WHERE "GuestID" = p_GuestID;
    
    -- Выбор одной подходящей комнаты и обновление её статуса
    SELECT "RoomNumber" INTO v_RoomNumber FROM (
        SELECT "RoomNumber"
        FROM "Rooms"
        WHERE "Beds" = p_NumberOfBeds AND "IsAvailable" = TRUE
        ORDER BY "RoomNumber"
        LIMIT 1
        FOR UPDATE SKIP LOCKED
    ) AS subquery;

    UPDATE "Rooms"
    SET "IsAvailable" = FALSE
    WHERE "RoomNumber" = v_RoomNumber;

    -- Добавление записи в "Reservations"
    INSERT INTO "Reservations" ("ReservationID", "GuestID", "RoomNumber", "CheckInDate", "CheckOutDate")
    VALUES (NEXTVAL('reservations_sequence'), p_GuestID, v_RoomNumber, p_CheckInDate, p_CheckOutDate);
    
    -- Добавление услуг в "RoomServices" с названием и стоимостью и расчет общей стоимости услуг
    FOR v_ServiceID IN SELECT UNNEST(p_SelectedServices)
    LOOP
        SELECT "ServiceName", "ServiceCost" INTO v_ServiceName, v_ServiceCost
        FROM "Services"
        WHERE "ServiceID" = v_ServiceID;

        INSERT INTO "RoomServices" ("RoomNumber", "ServiceID", "ServiceName", "ServiceCost")
        VALUES (v_RoomNumber, v_ServiceID, v_ServiceName, v_ServiceCost);

        v_ServicesTotalCost := v_ServicesTotalCost + v_ServiceCost;
    END LOOP;
    
    -- Получение подключенных услуг в виде строки
    SELECT STRING_AGG("ServiceName", ', ') INTO v_ServiceDetails
    FROM "Services"
    WHERE "ServiceID" = ANY(p_SelectedServices);
    
    -- Расчет скидки
    SELECT "Discount" INTO v_Discount
    FROM "Guests"
    WHERE "GuestID" = p_GuestID;
    
    -- Расчет итоговой цены с учетом скидки
    SELECT "Price" INTO v_TotalPrice
    FROM "Rooms"
    WHERE "RoomNumber" = v_RoomNumber;
    
    -- Расчет конечной цены по новой формуле
    v_TotalPrice := (v_TotalPrice + v_ServicesTotalCost) * (1 - (v_Discount / 100));
    
    -- Возвращение сводной информации
    RETURN QUERY
    SELECT 
        p_GuestID AS "GuestID",
        v_RoomNumber AS "RoomNumber",
        p_CheckInDate AS "CheckInDate",
        p_CheckOutDate AS "CheckOutDate",
        v_ServiceDetails AS "ConnectedServices",
        v_TotalPrice AS "FinalPrice";
END;
$$ LANGUAGE plpgsql;


-- Вызов функции
SELECT * FROM "ReserveRoom"(
    p_GuestID := 8,
    p_NumberOfBeds := 4,
    p_CheckInDate := '2024-06-10',
    p_CheckOutDate := '2024-06-15',
    p_SelectedServices := ARRAY[1, 2, 3] -- перечень необходимых услуг
);
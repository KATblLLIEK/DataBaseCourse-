CREATE OR REPLACE FUNCTION AddServiceToRoomAndShow(RoomNumber INT, ServiceID INT)
RETURNS TABLE ("ServiceName" VARCHAR(255), "ServiceCost" NUMERIC, "ServiceID" INT) AS $$
DECLARE
    v_ServiceName VARCHAR(255);
    v_ServiceCost NUMERIC;
BEGIN
    -- Получаем название и стоимость услуги
    SELECT s."ServiceName", s."ServiceCost" INTO v_ServiceName, v_ServiceCost
    FROM "Services" s
    WHERE s."ServiceID" = ServiceID;

    -- Проверяем, не добавлена ли уже такая услуга к этому номеру комнаты
    IF NOT EXISTS (
        SELECT 1 FROM "RoomServices" rs
        WHERE rs."RoomNumber" = RoomNumber AND rs."ServiceID" = ServiceID
    ) THEN
        -- Добавляем услугу к номеру комнаты, если она не найдена
        INSERT INTO "RoomServices" ("RoomNumber", "ServiceName", "ServiceCost", "ServiceID")
        VALUES (RoomNumber, v_ServiceName, v_ServiceCost, ServiceID);
    END IF;

    -- Возвращаем список всех услуг для данной комнаты
    RETURN QUERY
    SELECT rs."ServiceName", rs."ServiceCost", rs."ServiceID"
    FROM "RoomServices" rs
    WHERE rs."RoomNumber" = RoomNumber;
END;
$$ LANGUAGE plpgsql;

-- Вызов функции
SELECT * FROM AddServiceToRoomAndShow(102, 1);



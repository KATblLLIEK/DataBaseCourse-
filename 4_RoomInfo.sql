CREATE OR REPLACE FUNCTION GetFullRoomInformation(p_RoomNumber INT)
RETURNS TABLE (
    "RoomNumber" INT,
    "Status" TEXT,
    "Services" TEXT,
    "TotalPrice" DECIMAL(10, 2)
) AS $$
BEGIN
    RETURN QUERY
    WITH "ServiceDetails" AS (
    SELECT
        "RS"."RoomNumber",
        STRING_AGG("S"."ServiceName", ', ') AS "Services",
        SUM("S"."ServiceCost") AS "ServiceTotal"
    FROM
        "RoomServices" "RS"
        JOIN "Services" "S" ON "RS"."ServiceID" = "S"."ServiceID"
    WHERE
        "RS"."RoomNumber" = p_RoomNumber
    GROUP BY
        "RS"."RoomNumber"
),
    "RoomStatus" AS (
        SELECT
            "R"."RoomNumber",
            CASE
                WHEN "R"."IsAvailable" THEN 'Свободна'
                ELSE 'Занята'
            END AS "Status",
            "R"."Price" AS "BasePrice"
        FROM
            "Rooms" "R"
        WHERE
            "R"."RoomNumber" = p_RoomNumber
    )
    SELECT
        "R"."RoomNumber",
        "R"."Status",
        COALESCE("SD"."Services", 'Нет услуг') AS "Services",
        ("R"."BasePrice" + COALESCE("SD"."ServiceTotal", 0)) AS "TotalPrice"
    FROM
        "RoomStatus" "R"
        LEFT JOIN "ServiceDetails" "SD" ON "R"."RoomNumber" = "SD"."RoomNumber";
END;
$$ LANGUAGE plpgsql;


-- Вызов функции
SELECT * FROM GetFullRoomInformation(104);

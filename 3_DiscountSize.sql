CREATE OR REPLACE FUNCTION calculate_discount(visitor_visits INT, visitor_dob DATE)
RETURNS INT AS $$
DECLARE
    visitor_age INT;
    discount_value INT;
BEGIN
    -- Вычисление возраста посетителя
    visitor_age := DATE_PART('year', AGE(visitor_dob));
    -- Инициализация скидки значением 0
    discount_value := 0;

    -- Проверка условий для предоставления скидки
    IF visitor_visits >= 10 THEN
        discount_value := discount_value + 20; -- Дополнительная скидка 20%, если посещений 10 и более
    END IF;
    
    IF visitor_age < 12 THEN
        discount_value := discount_value + 10; -- Дополнительная скидка 10%, если возраст меньше 12 лет
    END IF;

    -- Возврат значения скидки
    RETURN discount_value;
END;
$$ LANGUAGE plpgsql;

-- Вызов функции
UPDATE "Guests"
SET "Discount" = calculate_discount("VisitCount", "DateOfBirth")
WHERE "GuestID" = 8;
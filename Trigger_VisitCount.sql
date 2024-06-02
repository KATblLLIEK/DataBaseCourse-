CREATE OR REPLACE FUNCTION increment_visit_count()
RETURNS TRIGGER AS $$
BEGIN
     -- Проверяем наличие совпадения по номеру телефона и дате рождения
    IF EXISTS (SELECT 1 FROM "Guests"
               WHERE "PhoneNumber" = NEW."PhoneNumber" AND "DateOfBirth" = NEW."DateOfBirth") THEN
        -- Увеличиваем счетчик посещений для существующего клиента
        UPDATE "Guests"
        SET "VisitCount" = "VisitCount" + 1
        WHERE "PhoneNumber" = NEW."PhoneNumber" AND "DateOfBirth" = NEW."DateOfBirth";
        
        -- Отменяем вставку новой записи
        RETURN NULL;
    ELSE
        -- Вставляем новую запись, если совпадений нет
        RETURN NEW;
    END IF;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_increment_visit_count
BEFORE INSERT ON "Guests" 
FOR EACH ROW
EXECUTE FUNCTION increment_visit_count();


-- Проверка триггера

INSERT INTO "Guests" values
(1, 'Алексей', 'Иванов', '1985-04-12', '+79031234567', 2, 0)


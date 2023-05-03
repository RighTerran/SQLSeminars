use lesson5;
/* 1.Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов.
Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '
*/

DELIMITER $$
CREATE FUNCTION dates
(
	input INT
) 
RETURNS VARCHAR(45)
DETERMINISTIC 
BEGIN
    DECLARE days INT;
    DECLARE hours INT;
    DECLARE minutes INT;
    DECLARE seconds INT;
    DECLARE result VARCHAR(45);

    SET days = FLOOR(input/(24*3600));
    SET hours = FLOOR(input%(24*3600)/3600);
    SET minutes = FLOOR(input%3600/60);
    SET seconds = input%60;

    SET result = CONCAT(days, " days ", hours, " hours ", minutes, " minutes ", seconds, " seconds");
    RETURN result;
END $$

select dates(123456)

/*
--2 .Выведите только четные числа от 1 до 10. Пример: 2,4,6,8,10
*/

DROP PROCEDURE IF EXISTS even;
DELIMITER $$
CREATE PROCEDURE even()
BEGIN
    DECLARE n INT DEFAULT 1;
    DECLARE result VARCHAR(45) DEFAULT '';
    WHILE n <= 10 DO
        IF n % 2 = 0 THEN
            IF result = '' THEN
                SET result = n;
            ELSE
                SET result = CONCAT(result, ', ', n);
            END IF;
        END IF;
        SET n = n + 1;
    END WHILE;
    SELECT result;
END $$

CALL even();


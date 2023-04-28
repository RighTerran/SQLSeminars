use lesson4

CREATE TABLE cars
(
	id INT NOT NULL PRIMARY KEY,
    name VARCHAR(45),
    cost INT
);

INSERT INTO cars
VALUES
	(1, 'Audi', 52642),
    (2, 'Mercedes', 57127 ),
    (3, 'Skoda', 9000 ),
    (4, 'Volvo', 29000),
	(5, 'Bentley', 350000),
    (6, 'Citroen', 21000 ), 
    (7, 'Hummer', 41400), 
    (8, 'Volkswagen', 21600);

select *
from cars

-- 1. Создайте представление, в которое попадут автомобили стоимостью  до 25 000 долларов

CREATE OR REPLACE VIEW new_cars AS
select name, cost
from cars
where cost <25000

select *
from new_cars;

/*
2.Изменить в существующем представлении порог для стоимости: 
пусть цена будет до 30 000 долларов (используя оператор ALTER VIEW)
*/

Alter view new_cars as
select name, cost
from cars
where cost <30000

select *
from new_cars;

-- 3. Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди”

CREATE OR REPLACE VIEW cars_sh_au AS
select *
from cars
where `name` in ('Skoda','Audi');

select *
from cars_sh_au;

-- 4. Добавьте новый столбец под названием «время до следующей станции»

drop table train;

CREATE TABLE train
(
	train_id INT,
    station VARCHAR(20),
    station_time time
);

INSERT train
VALUES
	(110, "San Francisco", "10:00:00"),
    (110, "Redwood City", "10:54:00"),
    (110, "Palo Alto", "11:02:00"),
    (110, "San Jose", "12:35:00"),
	(120, "San Francisco", "11:00:00"),
    (120, "Palo Alto", "12:49:00"), 
   (120, "San Jose", "13:40:00");

select *,
case
	when TIMEDIFF(LEAD(station_time) OVER(), station_time) <0
		then Null
	else TIMEDIFF(LEAD(station_time) OVER(), station_time)
end as 'time_to_next_station'
from train

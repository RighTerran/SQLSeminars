--1.Создайте таблицу с мобильными телефонами, используя графический интерфейс. 

CREATE TABLE if not exists mobiles
(
	id BIGSERIAL PRIMARY key,
	ProductName VARCHAR(45),
	Manufacturer VARCHAR(45),
	ProductCount int,
	Price real
);

select *
from mobiles;

--Заполните БД данными. Добавьте скриншот на платформу в качестве ответа на ДЗ

insert into mobiles (productname, manufacturer, productcount, price)
Values
	('IPhone X','Apple',3,76000),
	('IPhone 8','Apple',2,51000),
	('Galaxy S9','Samsung',2,56000),
	('Galaxy S8','Samsung',1,41000),
	('P20 Pro','Huawei',5,36000);

--2.Выведите название, производителя и цену для товаров, количество которых превышает 2 (SQL - файл, скриншот, либо сам код)

select productname, manufacturer, price
from mobiles
where productcount>2;

--3. Выведите весь ассортимент товаров марки “Samsung”

select *
from mobiles
where manufacturer='Samsung';

--4.Выведите информацию о телефонах, где суммарный чек больше 100 000 и меньше 145 000**

select *
from mobiles
where productcount*price between 100000 and 145000;

--4.*** С помощью регулярных выражений найти (можно использовать операторы “LIKE”, “RLIKE” для 4.3 ):
	--4.1. Товары, в которых есть упоминание "Iphone"

select *
from mobiles
where productname Ilike '%iphone%';

	--4.2. "Galaxy"

select *
from mobiles
where productname Ilike '%Galaxy%';

	--4.3.  Товары, в которых есть ЦИФРЫ

select *
from mobiles
where productname similar to '%[0-9]%';

	--4.4.  Товары, в которых есть ЦИФРА "8"

select *
from mobiles
where productname Ilike '%8%';


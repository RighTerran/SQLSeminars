--1. Используя операторы языка SQL, создайте таблицу “sales”. Заполните ее данными

select * from sales

/* 2.  Для данных таблицы “sales” укажите тип заказа в зависимости от кол-ва : 
меньше 100  -    Маленький заказ
от 100 до 300 - Средний заказ
больше 300  -     Большой заказ
*/

SELECT id, CASE
			WHEN count_product <100 then 'Маленький заказ'
			WHEN count_product between 100 and 300 then 'Средний заказ'
			WHEN count_product >300 then 'Большой заказ'
			end as "Тип заказа"
from sales

-- 3.Создайте таблицу “orders”, заполните ее значениями
select *
from orders

/* Выберите все заказы. В зависимости от поля order_status выведите столбец full_order_status:
OPEN – «Order is in open state» ; CLOSED - «Order is closed»; CANCELLED -  «Order is cancelled»
*/

SELECT *, CASE
			WHEN order_status ='OPEN' then 'Order is in open state'
			WHEN order_status ='CLOSED' then 'Order is closed'
			WHEN order_status ='CANCELLED' then 'Order is cancelled'
			end as full_order_status
from orders

-- ДОП.ЗАДАНИЕ

select * from users
select * from clients
select * from posts

--№1. Используя оператор ALTER TABLE, установите внешний ключ в одной из таблиц.

ALTER TABLE posts ADD CONSTRAINT clients 
FOREIGN KEY (user_Id) REFERENCES clients (ID)

--№2. Без оператора JOIN, верните заголовок публикации, текст с описанием, 
--идентификатор клиента, опубликовавшего публикацию и логин данного клиента.

SELECT t1.title,t1.full_text,t1.user_id,t2.login
from posts as t1, clients as t2
where t1.user_id=t2.id

--№3. Выполните поиск по публикациям, автором котоырх является клиент "Mikle".
SELECT t1.title,t1.full_text
from posts as t1, clients as t2
where t1.user_id=t2.id and t2.login='Mikle'


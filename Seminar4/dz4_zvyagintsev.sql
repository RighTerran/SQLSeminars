select * from shops
select * from cats

--1.Вывести всех котиков по магазинам по id (условие соединения shops.id = cats.shops_id)

select t1."name",t2.shopname
from cats as t1 
inner join
shops as t2 on t1.shops_id=t2.id

--2.Вывести магазин, в котором продается кот “Мурзик” (попробуйте выполнить 2 способами)
-- через join

select t1."name",t2.shopname
from cats as t1 
inner join
shops as t2 on t1.shops_id=t2.id
where t1.name='Murzik'

-- через подзапрос

select shopname
from shops
where id in
(
	select id
	from cats
	where name='Murzik'
)

--3.Вывести магазины, в которых НЕ продаются коты “Мурзик” и “Zuza”

select t1.shopname,t2."name"
from shops as t1 
left join
cats as t2 on t1.id=t2.shops_id
where t1.id in
(
	select id
	from cats
	where name not in ('Murzik','Zuza')
) OR t2."name" is Null 
/*
вот в этом месте я скорее всего схитрил, чтоб вывести магазин, 
который имеет null, но по факту тоже не продает “Мурзик” и “Zuza”.
По идее, его тоже нужно вывести, но как выдернуть его по другому не сообразил. 
По хорошему, мы же заранее не знаем, что может быть NULL. 
Видим это только посмотрев заранее, с маленькой таблицей ОК, а если миллион строк, это будет проблема.
Придется сначала обработать все NULL
*/ 

--4. Вывести название и цену для всех анализов, которые продавались 5 февраля 2020 и всю следующую неделю
select * from Analysis
select * from GroupsAn
select * from Orders

--общий вывод
select a.an_name, a.an_cost, a.an_price, date(ord_datetime)
from Analysis as a
inner join
Orders as o
on a.an_id=o.ord_an
where date(ord_datetime) between '2020-02-05' and '2020-02-12'
order by a.an_name

--результат
select a.an_name, sum(a.an_cost) as cost, sum(a.an_price) as price
from Analysis as a
inner join
Orders as o
on a.an_id=o.ord_an
where date(ord_datetime) between '2020-02-05' and '2020-02-12'
group by a.an_name
--1.Отсортируйте данные по полю заработная плата (salary) в порядке: убывания; возрастания 

select *
from staff
order by salary desc

select *
from staff
order by salary


--2.Выведите 5 максимальных заработных плат (saraly)

select *
from staff
order by salary DESC
Limit 5

--3.Посчитайте суммарную зарплату (salary) по каждой специальности (роst)

select post, sum(salary)
from staff
group by post

/*
4.Найдите кол-во сотрудников с специальностью (post) «Рабочий»
в возрасте от 24 до 49 лет включительно
*/

select post, count(*)
from staff
where (age between 24 and 49) and post='Рабочий'
group by post

--top 2 по зп из запроса выше
select *
from staff
where (age between 24 and 49) and post='Рабочий'
order by salary desc
Limit 2

--5.Найдите количество специальностей
select post, count(*)
from staff
group by post

--6.Выведите специальности, у которых средний возраст сотрудников меньше 30 лет 

select post, avg(age)
from staff
group by post
having avg(age) <30 -- если включительно, то попадет категория "инженер", а так 0

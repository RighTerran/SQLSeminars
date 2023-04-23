use lesson4
select * from users;
select * from profiles;
select * from messages;
select * from friend_requests;
select * from communities;
select * from users_communities;
select * from media_types;
select * from media;
select * from likes;

-- 1.Подсчитать общее количество лайков, которые получили пользователи младше 12 лет

-- select u.id, u.firstname, u.lastname, p.birthday, floor(DATEDIFF(curdate(),p.birthday)/365) as age, l.id

select count(*) as 'Общее количество лайков'
from users as u
inner join
profiles as p
on u.id=p.user_id
inner join likes as l
on u.id=l.user_id
where floor(DATEDIFF(curdate(),p.birthday)/365) < 12

-- 2. Определить кто больше поставил лайков (всего): мужчины или женщины
select p.gender, count(p.gender)
from users as u
inner join
profiles as p
on u.id=p.user_id
inner join likes as l
on u.id=l.user_id
group by p.gender
-- f > m 16>4

-- 3.Вывести всех пользователей, которые не отправляли сообщения

select *
from users as u
left join
messages as m
on u.id=m.from_user_id
where m.from_user_id is NULL-- 3 пользователя (count(*))

-- 4.Пусть задан некоторый пользователь. Из всех друзей этого пользователя найдите человека, который больше всех написал ему сообщений

select * from friend_requests;

select u.id, u.firstname, u.lastname, m.from_user_id, m.to_user_id, f.initiator_user_id, f.target_user_id, f.status
from users as u
inner join
messages as m
on u.id=m.from_user_id
inner join
friend_requests as f
on u.id=f.initiator_user_id
where (f.initiator_user_id = 1 or f.target_user_id=1) and f.status='approved'; # как сгруппировать до конца не догнал, но тут понятно что Noren West из друзей больше всех писалаю






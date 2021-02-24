/*
 * 1.  Пусть задан некоторый пользователь. Из всех пользователей соц. сети найдите человека, 
 * который больше всех общался с выбранным пользователем (написал ему сообщений).
 */

select 
	count(*) as cnt,
	from_user_id 
from messages
where to_user_id = 3
group by from_user_id
order by cnt DESC
limit 1;


/*
 * 2.  Подсчитать общее количество лайков, которые получили пользователи младше 10 лет..
 */


select 
	count(*) as likes_total,
	to_user_id
from likes
where (select TIMESTAMPDIFF(YEAR, birthday, now()) from profiles where user_id = to_user_id) < 10
group by to_user_id;


/*
 * 3.  Определить кто больше поставил лайков (всего): мужчины или женщины.
 */


select
	count(*),
	case(
		(select gender from profiles where user_id = likes.user_id))
			when 'M' then 'Male'
			when 'F' then 'Female'
	end as gender
from likes
group by gender;

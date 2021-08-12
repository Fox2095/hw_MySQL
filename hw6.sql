USE vk_db_data_full;

-- 1. Пусть задан некоторый пользователь.
-- Найдите человека, который больше всех общался с нашим пользователем, иначе, кто написал пользователю 
-- наибольшее число сообщений. (можете взять пользователя с любым id).
-- (по желанию: можете найти друга, с которым пользователь больше всего общался)

-- Пусть заданным пользователем будет id=3
-- Выводим все сообщения пользователя
SELECT from_user_id, to_user_id, txt, is_delivered, created_at 
FROM messages
WHERE from_user_id=3 OR to_user_id=3
ORDER BY created_at DESC;

SELECT 
	from_user_id,
    to_user_id 
FROM messages 
WHERE from_user_id=3 OR to_user_id=3 
GROUP BY from_user_id OR to_user_id;

-- 2. Подсчитать общее количество лайков на посты, которые получили пользователи младше 18 лет.

SELECT COUNT(*) AS 'Likes' FROM profiles WHERE (YEAR(NOW())-YEAR(birthday)) < 18;

-- 3. Определить, кто больше поставил лайков (всего) - мужчины или женщины?

SELECT gender, COUNT(*) as 'Кол-во' FROM profiles GROUP BY gender;



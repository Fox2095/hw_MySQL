-- Операторы, фильтрация, сортировка и ограничение

-- 1. Пусть в таблице users поля created_at и updated_at оказались незаполненными. Заполните их текущими датой и временем.
USE vk;

INSERT INTO users (created_at, updated_at) VALUES (NOW(), NOW());

-- 2. Таблица users была неудачно спроектирована. Записи created_at и updated_at были заданы типом
-- VARCHAR и в них долгое время помещались значения в формате 20.10.2017 8:10. Необходимо преобразовать 
-- поля к типу DATETIME, сохранив введённые ранее значения.

UPDATE users set created_at=STR_TO_DATE(created_at, '%d.%m.%Y %H:%i'), updated_at=STR_TO_DATE(updated_at, '%d.%m.%Y %H:%i');
ALTER TABLE users MODIFY created_at DATETIME, MODIFY updated_at DATETIME;

-- 3. В таблице складских запасов storehouses_products в поле value могут встречаться 
-- самые разные цифры: 0, если товар закончился и выше нуля, если на складе имеются запасы. 
-- Необходимо отсортировать записи таким образом, чтобы они выводились в порядке увеличения 
-- значения value. Однако нулевые запасы должны выводиться в конце, после всех записей.

CREATE TABLE storehouses_products (
	storehouse_id SERIAL PRIMARY KEY,
    value INT NOT NULL
 );   
 
INSERT INTO storehouses_products VALUES (1, 0);
INSERT INTO storehouses_products VALUES (2, 2500); 
INSERT INTO storehouses_products VALUES (3, 0);
INSERT INTO storehouses_products VALUES (4, 30);
INSERT INTO storehouses_products VALUES (5, 500);
INSERT INTO storehouses_products VALUES (6, 1);

SELECT * FROM storehouses_products;

SELECT * FROM storehouses_products ORDER BY CASE WHEN value = 0 THEN 9999999999999999999999 ELSE value END;

-- 4.(по желанию) Из таблицы users необходимо извлечь пользователей, родившихся в августе и мае. 
-- Месяцы заданы в виде списка английских названий (may, august)

SELECT * FROM users WHERE DATE_FORMAT(birthday,'%M') in ('may', 'august');

-- 5. (по желанию) Из таблицы catalogs извлекаются записи при помощи запроса. 
-- SELECT * FROM catalogs WHERE id IN (5, 1, 2); Отсортируйте записи в порядке, заданном в списке IN.

SELECT * FROM catalogs WHERE id IN (5, 1, 2) ORDER BY FIELD(id, 5, 1, 2);

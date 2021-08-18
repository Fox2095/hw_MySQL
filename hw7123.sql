CREATE DATABASE hw_test;
USE hw_test;
DROP TABLE users;
CREATE TABLE users (
	id INT NOT NULL PRIMARY KEY COMMENT "ID пользователя",
    firstname VARCHAR(250) NOT NULL,
    lastname VARCHAR(250) NOT NULL,
    email VARCHAR(250) NOT NULL,
    phone CHAR(11) NOT NULL
    );
    
 INSERT INTO users VALUE
	(1, 'Татьяна', 'Зубарева', 'ms.tzubareva@mail.ru', 89168086109),
    (2, 'Анна', 'Иванова', 'aivan78@yandex.ru', 89850467898),
    (3, 'Максим', 'Тарасов', '89781112323@list.ru', 89781112323),
    (4, 'Степан', 'Варфламеев', 'sv20011995@gmail.com', 89036458908),
    (5, 'Устинья', 'Алексеева', 'yalex1985@mail.ru', 89867892020),
    (6, 'Фёдор', 'Салтыков', 'fs1986@mail.ru', 89870203030);
    
DROP TABLE ordres;
CREATE TABLE orders(
	id SERIAL PRIMARY KEY,
    num_order INT COMMENT "Номер заказа",
    name_order VARCHAR(250) COMMENT "Наименование заказа",
    user_id INT NOT NULL COMMENT "ID пользователя"
    );
    
INSERT INTO orders VALUE
	(1, 012789, 'Классический', 3),
    (2, 000123, 'Подарок', 6),
    (3, 123456, 'Набор', 1),
    (4, 678952, 'Для ребенка', 5),
    (5, 456200, 'Для рыбака', 3),
    (6, 741852, 'Книги', 5);
    
ALTER TABLE orders
  ADD CONSTRAINT orders_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id);
    
-- 1 Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.

SELECT 
	u.firstname,
    u.lastname,
    o.num_order,
    o.name_order
FROM
	users AS u
JOIN
	orders AS o
ON
	u.id=o.user_id;

-- 2 Выведите список товаров products и разделов catalogs, который соответствует товару.
    
    SELECT 
	p.id, p.name, p.price,
	c.id AS cat_id,
	c.name AS catalog
FROM
 products AS p
JOIN
 catalogs AS c
ON 
	p.catalog_id = c.id; 
    
-- 3 (по желанию) Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label, name). 
-- Поля from, to и label содержат английские названия городов, поле name — русское. Выведите список рейсов 
-- flights с русскими названиями городов.

CREATE TABLE IF NOT EXISTS flights(
	id SERIAL PRIMARY KEY,
    from_c VARCHAR(100) NOT NULL COMMENT 'en',
    to_c VARCHAR(100) NOT NULL COMMENT 'en'
);

CREATE TABLE  IF NOT EXISTS cities(
	label VARCHAR(100) PRIMARY KEY COMMENT 'en', 
	name_c VARCHAR(100) COMMENT 'ru'
);

ALTER TABLE flights
	ADD CONSTRAINT fk_from_label
    FOREIGN KEY(from_c)
	REFERENCES cities(label);

ALTER TABLE flights
	ADD CONSTRAINT fk_to_label
	FOREIGN KEY(to_c)
	REFERENCES cities(label);

INSERT INTO cities VALUES
	('Moscow', 'Москва'),
	('Irkutsk', 'Иркутск'),
	('Novgorod', 'Новгород'),
	('Kazan', 'Казань'),
	('Omsk', 'Омск');

INSERT INTO flights VALUES
	(1, 'Moscow', 'Omsk'),
	(2, 'Novgorod', 'Kazan'),
	(3, 'Irkutsk', 'Moscow'),
	(4, 'Omsk', 'Irkutsk'),
	(5, 'Moscow', 'Kazan');
    
SELECT
	id AS flight_id,
	(SELECT name_c FROM cities WHERE label = from_c) AS from_c,
	(SELECT name_c FROM cities WHERE label = to_c) AS to_c
FROM
	flights
ORDER BY
	flight_id;
    
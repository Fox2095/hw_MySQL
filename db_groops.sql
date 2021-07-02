-- Группировки данных 
USE peacebook;
SELECT firstname, lastname,  phone, gender FROM profiles;
SELECT firstname, lastname,  phone, gender FROM profiles ORDER BY lastname; -- сорировка по Алфавиту
SELECT firstname, lastname,  phone, gender FROM profiles ORDER BY lastname DESC; -- Сортировка в обратном
SELECT DISTINCT firstname, lastname,  phone, gender FROM profiles; -- уникальное значение

SELECT substring(birthday, 1, 3) AS decade FROM profiles GROUP BY decade;
SELECT COUNT(*), substring(birthday, 1, 3) AS decade FROM profiles GROUP BY decade;
SELECT GROUP_CONCAT(lastname), substring(birthday, 1, 3) AS decade FROM profiles GROUP BY decade;


SELECT substring(lastname, 1, 1) AS surname FROM profiles GROUP BY surname;
SELECT COUNT(*), substring(lastname, 1, 1) AS surname FROM profiles GROUP BY surname;

SELECT DISTINCT substring(lastname, 5, 1) AS surname FROM profiles GROUP BY surname LIMIT 3;




-- Join

SELECT * FROM genres_books JOIN genres;


SELECT
  u.id,
  u.username,
  u.email,
  CONCAT(p.firstname, ' ', p.lastname) AS name,
  p.birthday,
  p.city,
  p.phone
  FROM users AS u JOIN profiles AS p ON u.id = p.user_id;
  
  SELECT messages.body, profiles.firstname, profiles.lastname, messages.created_at
  FROM messages
    JOIN profiles
      ON profiles.user_id = messages.to_user_id
  WHERE messages.from_user_id = 7;

SELECT 
  messages.from_user_id, 
  CONCAT(users_from.firstname, ' ', users_from.lastname) AS from_user,
  messages.to_user_id, 
  CONCAT(users_to.firstname, ' ', users_to.lastname) AS to_user,     
  messages.body, 
  messages.created_at
  FROM profiles
   JOIN messages
    ON profiles.user_id = messages.to_user_id OR profiles.user_id = messages.from_user_id
   JOIN profiles AS users_from
    ON users_from.user_id = messages.from_user_id
   JOIN profiles AS users_to
    ON users_to.user_id = messages.to_user_id
  WHERE profiles.user_id = 7;
  
-- Представления 
-- Books view
CREATE OR REPLACE VIEW books_view AS
SELECT id, book, descript, image_blob_id, release_date FROM books;

CREATE OR REPLACE VIEW authors_books_viem AS
SELECT b.id, b.book, ab.author_id, CONCAT(a.firstname, ' ', a.lastname) as author 
  FROM books b
   LEFT JOIN authors_books AS ab
    ON b.id = ab.book_id
   LEFT JOIN authors AS a
    ON a.id = ab.author_id;
    
-- Хранимые процедуры 

DROP PROCEDURE IF EXISTS get_user_profile_by_user_id;
DELIMITER //
CREATE PROCEDURE get_user_info_by_id(id INT)
BEGIN
	SELECT * FROM profiles AS p WHERE p.user_id = id;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS get_user_messages_by_id;
DELIMITER //
CREATE PROCEDURE get_user_messages_by_id(user_id INT)
BEGIN
	SELECT 
  messages.from_user_id, 
  CONCAT(users_from.firstname, ' ', users_from.lastname) AS from_user,
  messages.to_user_id, 
  CONCAT(users_to.firstname, ' ', users_to.lastname) AS to_user,     
  messages.body, 
  messages.created_at
  FROM profiles
    JOIN messages
      ON profiles.user_id = messages.to_user_id
        OR profiles.user_id = messages.from_user_id
    JOIN profiles AS users_from
      ON users_from.user_id = messages.from_user_id
    JOIN profiles AS users_to
      ON users_to.user_id = messages.to_user_id
  WHERE profiles.user_id = user_id;
END //
DELIMITER ;

-- Тригеры
-- Проверка имени и фамилии автора
DELIMITER //
CREATE TRIGGER validate_author_firstname_lastname_insert BEFORE INSERT ON authors
FOR EACH ROW BEGIN
  IF NEW.firstname IS NULL AND NEW.lastname IS NULL THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Both name and surname are NULL';
  END IF;
END//

-- Проверка имени и фамилии
DELIMITER //
CREATE TRIGGER validate_messages_body_insert BEFORE INSERT ON messages
FOR EACH ROW BEGIN
  IF NEW.body IS NULL THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Messages body is NULL';
  END IF;
END//

-- Проверка имени и фамилии в профиле
DELIMITER //
CREATE TRIGGER validate_profiles_firstname_lastname_insert BEFORE INSERT ON profiles
FOR EACH ROW BEGIN
  IF NEW.firstname IS NULL AND NEW.lastname IS NULL THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Both fist name and surname are NULL';
  END IF;
END//
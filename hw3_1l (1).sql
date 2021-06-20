-- vk
-- запросы в друзья
-- медиафайлы
-- пользователи
-- пользователи в сообестве
-- сообщения
-- сообщества

DROP DATABASE IF EXISTS vk;
CREATE DATABASE IF NOT EXISTS vk;
USE vk;

DROP TABLE IF EXISTS users;
CREATE TABLE users(
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY,
	firstname VARCHAR(50) NOT NULL COMMENT 'Name',
	lastname VARCHAR(50) NOT NULL COMMENT 'Surname',
	email VARCHAR(120) UNIQUE NOT NULL,
	phone CHAR(11) NOT NULL,
	password_hash CHAR(65),
	created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    INDEX users_email_idx (email),
    INDEX users_phone_idx (phone)
);

INSERT INTO users VALUES (DEFAULT, 'Tatyana', 'Kopasova', 'fox@mail.ru', '89168086109', DEFAULT, DEFAULT);
INSERT INTO users VALUES (DEFAULT, 'Fedor', 'Zubarev', 'fedor@gmail.com', '89035124585', DEFAULT, DEFAULT);

DROP TABLE IF EXISTS profiles;
CREATE TABLE profiles(
	user_id BIGINT UNSIGNED NOT NULL PRIMARY KEY,
	gender ENUM('f', 'm', 'x'),
	birthday DATE NOT NULL,
	photo_id INT UNSIGNED,
	city VARCHAR(130),
	country VARCHAR(130),
	FOREIGN KEY (user_id) REFERENCES users (id)
);

INSERT INTO profiles VALUES (1, 'x', '1997-12-01', NULL, 'Moscow', 'Russia');
INSERT INTO profiles VALUES (2, 'm', '1988-11-02', NULL, 'Tver', 'Russia');

DROP TABLE IF EXISTS media_types;
CREATE TABLE media_types (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(45) NOT NULL UNIQUE
);

INSERT INTO media_types VALUES (DEFAULT, 'Picture');
INSERT INTO media_types VALUES (DEFAULT, 'Music');
INSERT INTO media_types VALUES (DEFAULT, 'Document');

DROP TABLE IF EXISTS media;
CREATE TABLE media(
	id SERIAL PRIMARY KEY,
    user_id BIGINT UNSIGNED NOT NULL,
    media_types_id INT UNSIGNED NOT NULL,
    file_name VARCHAR(245) COMMENT '/files/folder/img.png',
    file_size BIGINT UNSIGNED,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    INDEX media_users_idx (user_id),
    INDEX media_media_types_idx (media_types_id),
    CONSTRAINT fk_media_media_types FOREIGN KEY (media_types_id) REFERENCES media_types (id),
    CONSTRAINT fk_media_users FOREIGN KEY (user_id) REFERENCES users (id)
);

INSERT INTO media VALUES (DEFAULT, 1, 1, 'im.jpg', 100, DEFAULT);
INSERT INTO media VALUES (DEFAULT, 1, 1, 'im1.png', 78, DEFAULT);
INSERT INTO media VALUES (DEFAULT, 2, 3, 'doc.docx', 1024, DEFAULT);

CREATE TABLE communities (
	id SERIAL PRIMARY KEY,
    name VARCHAR(145) NOT NULL,
    description VARCHAR(245) DEFAULT NULL,
    INDEX communities_name_idx (name)
);

INSERT INTO communities VALUES (DEFAULT, 'Nunber1', 'I am number one');

CREATE TABLE communities_users (
	community_id BIGINT UNSIGNED NOT NULL,
    user_id BIGINT UNSIGNED NOT NULL,
    create_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (community_id, user_id),
    INDEX communities_users_comm_idx (community_id),
    INDEX communities_users_users_idx (user_id),
    FOREIGN KEY (community_id) REFERENCES communities (id),
    FOREIGN KEY (user_id) REFERENCES users (id)
);

INSERT INTO communities_users VALUES (1, 2, DEFAULT);
SELECT * FROM communities_users;

CREATE TABLE friend_requests (
	from_user_id BIGINT UNSIGNED NOT NULL,
    to_user_id BIGINT UNSIGNED NOT NULL,
    accepted BOOLEAN DEFAULT FALSE,
    PRIMARY KEY (from_user_id, to_user_id),
    INDEX fk_friend_requests_from_user_idx (from_user_id),
    INDEX fk_friend_requests_to_user_idx (to_user_id),
    CONSTRAINT fk_friend_requests_user_1 FOREIGN KEY (from_user_id) REFERENCES users (id),
    CONSTRAINT fk_friend_requests_user_2 FOREIGN KEY (to_user_id) REFERENCES users (id)
);

INSERT INTO friend_requests VALUES (1, 2, 1);
SELECT * FROM friend_requests;

CREATE TABLE messages (
	id SERIAL PRIMARY KEY,
	from_user_id BIGINT UNSIGNED NOT NULL,
  	to_user_id BIGINT UNSIGNED NOT NULL,
  	txt TEXT NOT NULL, -- txt = ПРИВЕТ,
  	is_delivered BOOLEAN DEFAULT False,
  	created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки",
  	INDEX fk_messages_from_user_idx (from_user_id),
  	INDEX fk_messages_to_user_idx (to_user_id),
  	CONSTRAINT fk_messages_users_1 FOREIGN KEY (from_user_id) REFERENCES users (id),
  	CONSTRAINT fk_messages_users_2 FOREIGN KEY (to_user_id) REFERENCES users (id)
);

INSERT INTO messages VALUES (DEFAULT, 1, 2, 'Hi!', 1, DEFAULT, DEFAULT);
INSERT INTO messages VALUES (DEFAULT, 1, 2, 'Vasya!', 1, DEFAULT, DEFAULT);
INSERT INTO messages VALUES (DEFAULT, 2, 1, 'Hi, Petya', 1, DEFAULT, DEFAULT);

SELECT * FROM messages;

-- добавитьь колонку
ALTER TABLE users ADD COLUMN passport_number VARCHAR(10);
-- изменить текст вводаa
ALTER TABLE users MODIFY COLUMN passport_number VARCHAR(20);
-- изменить название колонки
ALTER TABLE users RENAME COLUMN passport_number TO passport;
-- добавить индекс
ALTER TABLE users ADD KEY passport_idx (passport);
-- удаление индекса
ALTER TABLE users DROP KEY passport_idx;
-- удаление колонки
ALTER TABLE users DROP COLUMN passport;

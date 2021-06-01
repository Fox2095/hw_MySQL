DROP DATABASE IF EXISTS vk;
CREATE DATABASE vk;
USE vk;

DROP TABLE IF EXISTS users;
CREATE TABLE users(
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY, -- SERIAL = BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE 
	firstname VARCHAR(50) NOT NULL,
	lastname VARCHAR(50) NOT NULL COMMENT 'ФАМИЛИЯ',
	email VARCHAR(120) UNIQUE NOT NULL,
	phone CHAR(11) NOT NULL,
	password_hash CHAR(65),
	created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, -- NOW()
	INDEX users_email_idx (email),
	INDEX users_phone_idx (phone)
);

INSERT INTO users VALUES (DEFAULT, 'Petya', 'Petukhov', 'petya@mail.com', '89212223334', DEFAULT, DEFAULT);
INSERT INTO users VALUES (DEFAULT, 'Vasya', 'Vasilkov', 'vasya@mail.com', '89212023334', DEFAULT, DEFAULT);

CREATE TABLE profiles (
	user_id BIGINT UNSIGNED NOT NULL PRIMARY KEY,
	gender ENUM('f', 'm', 'x'), -- CHAR(1)
	birthday DATE NOT NULL,
	photo_id INT UNSIGNED,
	city VARCHAR(130),
	country VARCHAR(130),
	FOREIGN KEY (user_id) REFERENCES users (id)
);

INSERT INTO profiles VALUES (1, 'm', '1997-12-01', NULL, 'Moscow', 'Russia'); -- профиль Пети
INSERT INTO profiles VALUES (2, 'm', '1988-11-02', NULL, 'Moscow', 'Russia'); -- профиль Васи

CREATE TABLE media_types (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name varchar(45) NOT NULL UNIQUE -- изображение, музыка, документ
);

INSERT INTO media_types VALUES (DEFAULT, 'изображение');
INSERT INTO media_types VALUES (DEFAULT, 'музыка');
INSERT INTO media_types VALUES (DEFAULT, 'документ');

CREATE TABLE media(
	id SERIAL PRIMARY KEY,
	user_id BIGINT UNSIGNED NOT NULL,
	media_types_id INT UNSIGNED NOT NULL,
	file_name VARCHAR(245)	COMMENT '/files/folder/img.png',
	file_size BIGINT UNSIGNED,
	created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	INDEX media_users_idx (user_id),
	INDEX media_media_types_idx (media_types_id),
	CONSTRAINT fk_media_media_types FOREIGN KEY (media_types_id) REFERENCES media_types (id),
	CONSTRAINT fk_media_users FOREIGN KEY (user_id) REFERENCES users (id)
);

INSERT INTO media VALUES (DEFAULT, 1, 1, 'im.jpg', 100, DEFAULT);
INSERT INTO media VALUES (DEFAULT, 1, 1, 'im1.png', 78, DEFAULT);

-- Добавим документ, который добавил Вася
INSERT INTO media VALUES (DEFAULT, 2, 3, 'doc.docx', 1024, DEFAULT);

CREATE TABLE communities (
	id SERIAL PRIMARY KEY,
	name VARCHAR(145) NOT NULL,
  	description VARCHAR(245) DEFAULT NULL,
  	INDEX communities_name_idx (name)
);

INSERT INTO communities VALUES (DEFAULT, 'Number1', 'I am number one');

CREATE TABLE communities_users (
  community_id BIGINT UNSIGNED NOT NULL,
  user_id BIGINT UNSIGNED NOT NULL,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY(community_id, user_id),
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
	accepted BOOLEAN DEFAULT False,
	PRIMARY KEY(from_user_id, to_user_id),
	INDEX fk_friend_requests_from_user_idx (from_user_id),
  	INDEX fk_friend_requests_to_user_idx (to_user_id),
  	CONSTRAINT fk_friend_requests_users_1 FOREIGN KEY (from_user_id) REFERENCES users (id),
  	CONSTRAINT fk_friend_requests_users_2 FOREIGN KEY (to_user_id) REFERENCES users (id)
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

INSERT INTO messages VALUES (DEFAULT, 1, 2, 'Hi!', 1, DEFAULT, DEFAULT); -- сообщение от Пети к Васе номер 1
INSERT INTO messages VALUES (DEFAULT, 1, 2, 'Vasya!', 1, DEFAULT, DEFAULT); -- сообщение от Пети к Васе номер 2
INSERT INTO messages VALUES (DEFAULT, 2, 1, 'Hi, Petya', 1, DEFAULT, DEFAULT); -- сообщение от Пети к Васе номер 2

-- смотрим на сообщения
SELECT * FROM messages;

-- Добавим колонку с номером паспорта
ALTER TABLE users ADD COLUMN passport_number VARCHAR(10);

-- Изменяем длину для номера паспорта
ALTER TABLE users MODIFY COLUMN passport_number VARCHAR(20);

-- Переименовываем колонку 
ALTER TABLE users RENAME COLUMN passport_number TO passport;

-- Добавляем индекс
ALTER TABLE users ADD KEY passport_idx (passport); 

-- Удаляем индекс
ALTER TABLE users DROP KEY passport_idx;

-- Удаляем колонку
ALTER TABLE users DROP COLUMN passport;

-- Посмотреть служебные данные о таблице
DESCRIBE users;

-- Показать скрипт создания таблицы
SHOW CREATE TABLE users;

CREATE TABLE communities (
  id bigint unsigned NOT NULL AUTO_INCREMENT,
  name VARCHAR(145) NOT NULL,
  description VARCHAR(245) DEFAULT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY id (id),
  KEY communities_name_idx (name)
) ENGINE=InnoDB;


CREATE TABLE communities_users (
  community_id bigint unsigned NOT NULL,
  user_id bigint unsigned NOT NULL,
  created_at datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (community_id, user_id),
  KEY communities_users_comm_idx (community_id),
  KEY communities_users_users_idx (user_id),
  CONSTRAINT communities_users_ibfk_1 FOREIGN KEY (community_id) REFERENCES communities (id),
  CONSTRAINT communities_users_ibfk_2 FOREIGN KEY (user_id) REFERENCES users (id)
) ENGINE=InnoDB;


CREATE TABLE friend_requests (
  from_user_id bigint unsigned NOT NULL,
  to_user_id bigint unsigned NOT NULL,
  accepted tinyint(1) DEFAULT '0',
  PRIMARY KEY (from_user_id, to_user_id),
  KEY fk_friend_requests_from_user_idx (from_user_id),
  KEY fk_friend_requests_to_user_idx (to_user_id),
  CONSTRAINT fk_friend_requests_users_1 FOREIGN KEY (from_user_id) REFERENCES users (id),
  CONSTRAINT fk_friend_requests_users_2 FOREIGN KEY (to_user_id) REFERENCES users (id)
)ENGINE=InnoDB;

CREATE TABLE media (
  id bigint unsigned NOT NULL AUTO_INCREMENT,
  user_id bigint unsigned NOT NULL,
  media_types_id int unsigned NOT NULL,
  file_name varchar(245) DEFAULT NULL COMMENT '/files/folder/img.png',
  file_size bigint unsigned DEFAULT NULL,
  created_at datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY id (id),
  KEY media_users_idx (user_id),
  KEY media_media_types_idx (media_types_id),
  CONSTRAINT fk_media_media_types FOREIGN KEY (media_types_id) REFERENCES media_types (id),
  CONSTRAINT fk_media_users FOREIGN KEY (user_id) REFERENCES users (id)
) ENGINE=InnoDB;

CREATE TABLE media_types (
  id int unsigned NOT NULL AUTO_INCREMENT,
  name varchar(45) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY name (name)
) ENGINE=InnoDB;

CREATE TABLE messages (
  id bigint unsigned NOT NULL AUTO_INCREMENT,
  from_user_id bigint unsigned NOT NULL,
  to_user_id bigint unsigned NOT NULL,
  txt text NOT NULL,
  is_delivered tinyint(1) DEFAULT '0',
  created_at datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (id),
  UNIQUE KEY id (id),
  KEY fk_messages_from_user_idx (from_user_id),
  KEY fk_messages_to_user_idx (to_user_id),
  CONSTRAINT fk_messages_users_1 FOREIGN KEY (from_user_id) REFERENCES users (id),
  CONSTRAINT fk_messages_users_2 FOREIGN KEY (to_user_id) REFERENCES users (id)
) ENGINE=InnoDB;

CREATE TABLE profiles (
  user_id bigint unsigned NOT NULL,
  gender enum('f','m','x') DEFAULT NULL,
  birthday date NOT NULL,
  photo_id int unsigned DEFAULT NULL,
  city varchar(130) DEFAULT NULL,
  country varchar(130) DEFAULT NULL,
  PRIMARY KEY (user_id),
  CONSTRAINT profiles_ibfk_1 FOREIGN KEY (user_id) REFERENCES users (id)
) ENGINE=InnoDB;

CREATE TABLE users (
  id bigint unsigned NOT NULL AUTO_INCREMENT,
  firstname varchar(50) NOT NULL,
  lastname varchar(50) NOT NULL COMMENT 'ФАМИЛИЯ',
  email varchar(120) NOT NULL,
  phone char(11) NOT NULL,
  password_hash char(65) DEFAULT NULL,
  created_at datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY id (id),
  UNIQUE KEY email (email),
  KEY users_email_idx (email),
  KEY users_phone_idx (phone)
) ENGINE=InnoDB;

CREATE TABLE likes (
id int unsigned NOT NULL AUTO_INCREMENT,
  name varchar(45) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY name (name)
) ENGINE=InnoDB;
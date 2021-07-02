CREATE DATABASE peacebook;

-- Делаем её текущей
USE peacebook;

-- Создаём таблицу пользователей
DROP TABLE IF EXISTS users;
CREATE  TABLE users (
 id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор", 
 username VARCHAR(100) NOT NULL COMMENT "Логин",
 email VARCHAR(100) NOT NULL UNIQUE COMMENT "Почта",
 created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки", 
 updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки",
 INDEX users_username_idx (username)
) COMMENT "Пользователи"; 


-- Таблица профилей
DROP TABLE IF EXISTS profiles;
CREATE  TABLE profiles (
	user_id INT UNSIGNED NOT NULL PRIMARY KEY COMMENT "ID пользователя",
    firstname VARCHAR(100) NOT NULL COMMENT "Имя",
    lastname VARCHAR(100) NOT NULL COMMENT "Фамилия",
    phone CHAR(11) NOT NULL UNIQUE COMMENT "Телефон",
    gender ENUM ('m', 'f', 'x') DEFAULT 'x' COMMENT "Пол",
    birthday DATE COMMENT "Дата рождения",
    city VARCHAR(130) COMMENT "Город",
    country VARCHAR(130) COMMENT "Страна",
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки",
    INDEX profiles_lastname_idx (lastname),
    INDEX profiles_phone_idx (phone)
) COMMENT "Профили";


-- Добавляем внешние ключи к таблице
ALTER TABLE profiles
  ADD CONSTRAINT profiles_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id)
      ON DELETE CASCADE;


-- Таблица сообщений
DROP TABLE IF EXISTS messages;
CREATE TABLE messages (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор", 
  from_user_id INT UNSIGNED NOT NULL COMMENT "ID отправителя сообщения",
  to_user_id INT UNSIGNED NOT NULL COMMENT "ID получателя сообщения",
  body TEXT NOT NULL COMMENT "Текст сообщения",
  is_delivered BOOLEAN COMMENT "Признак доставки",
  created_at DATETIME DEFAULT NOW() COMMENT "Время создания строки"
) COMMENT "Сообщения";


-- Добавляем внешние ключи
ALTER TABLE messages
  ADD CONSTRAINT messages_from_user_id_fk 
    FOREIGN KEY (from_user_id) REFERENCES users(id),
  ADD CONSTRAINT messages_to_user_id_fk 
    FOREIGN KEY (to_user_id) REFERENCES users(id);


-- Таблица дружбы
DROP TABLE IF EXISTS friends;
CREATE TABLE friends (
  user_id INT UNSIGNED NOT NULL COMMENT "ID инициатора дружебы",
  friend_id INT UNSIGNED NOT NULL COMMENT "ID получателя",
  friends_status_id INT UNSIGNED NOT NULL COMMENT "Текущее состояние дружбы",
  confirmed_at DATETIME COMMENT "Время подтверждения приглашения",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки",  
  PRIMARY KEY (user_id, friend_id) COMMENT "Составной первичный ключ"
) COMMENT "Таблица дружбы";

-- Таблица статусов дружеских отношений
DROP TABLE IF EXISTS f_status;
CREATE TABLE f_status (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор",
  name ENUM ('Requested', 'Confirmed', 'Rejected') DEFAULT 'Requested' COMMENT "Название статуса",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"  
) COMMENT "Статусы дружбы";


-- Добавляем внешние ключи
ALTER TABLE friends
  ADD CONSTRAINT friends_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id)
	  ON DELETE CASCADE,
  ADD CONSTRAINT friends_friend_id_fk 
    FOREIGN KEY (friend_id) REFERENCES users(id)
	  ON DELETE CASCADE,
  ADD CONSTRAINT friends_status_id_fk 
    FOREIGN KEY (friends_status_id) REFERENCES f_status(id)
      ON DELETE CASCADE;


-- Таблица статусов сообщений
DROP TABLE IF EXISTS sms_status;
CREATE TABLE sms_status (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор", 
  user_id INT UNSIGNED NOT NULL COMMENT "ID получателя сообщения",
  body TEXT NOT NULL COMMENT "Текст сообщения",
  is_important BOOLEAN COMMENT "Признак важности",
  is_delivered BOOLEAN COMMENT "Признак доставки",
  created_at DATETIME DEFAULT NOW() COMMENT "Время создания строки"
) COMMENT "Статус сообщения";

-- Добавляем внешние ключи
ALTER TABLE sms_status
  ADD CONSTRAINT sms_status_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id);
	

-- Таблица книг
DROP TABLE IF EXISTS books;
CREATE TABLE books (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор",
  book VARCHAR(100) NOT NULL COMMENT "Название книги",
  descript VARCHAR(250) NOT NULL COMMENT "Короткое описание книги",
  description TEXT NOT NULL COMMENT "Описание книги",
  booklink VARCHAR(255) NOT NULL COMMENT "Путь к файлу",
  image_blob_id VARCHAR(250) DEFAULT NULL COMMENT "Идентификатор картинки книги",
  release_date DATE NOT NULL COMMENT "Год выпуска книги",
  created_at DATETIME DEFAULT NOW() COMMENT "Время создания строки",
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки",
  INDEX books_book_idx (book)
) COMMENT "Книги";

-- Добавление дополнительной коллонки 
ALTER TABLE books ADD COLUMN price_book FLOAT(10) NOT NULL COMMENT "Цена книги";

-- Таблица Стран
DROP TABLE IF EXISTS countries;
CREATE TABLE countries (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор",
  country VARCHAR(200) UNIQUE NOT NULL COMMENT "Страна"
) COMMENT "Страны";


-- Таблица связи стран и книг
CREATE TABLE countries_books (
  country_id INT UNSIGNED NOT NULL COMMENT "Ссылка на страну",
  book_id INT UNSIGNED NOT NULL COMMENT "Ссылка на книгу",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки", 
  PRIMARY KEY (country_id, book_id) COMMENT "Составной первичный ключ"
) COMMENT "Связь между странами и книгами";


-- Добавляем внешние ключи
ALTER TABLE countries_books
  ADD CONSTRAINT countries_country_id_fk 
    FOREIGN KEY (country_id) REFERENCES countries(id)
	  ON DELETE CASCADE,
  ADD CONSTRAINT books_book_id_fk 
    FOREIGN KEY (book_id) REFERENCES books(id)
	  ON DELETE CASCADE;
	  
	  
-- Таблица жанров
DROP TABLE IF EXISTS genres;
CREATE TABLE genres (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор",
  genre VARCHAR(200) UNIQUE NOT NULL COMMENT "Жанр"
) COMMENT "Жанры";


-- Таблица связи жанров и фильмов
CREATE TABLE genres_books (
  genre_id INT UNSIGNED NOT NULL COMMENT "Ссылка на жанр",
  book_id INT UNSIGNED NOT NULL COMMENT "Ссылка на книгу",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки", 
  PRIMARY KEY (genre_id, book_id) COMMENT "Составной первичный ключ"
) COMMENT "Связь между жанрами и книгами";


-- Добавляем внешние ключи
ALTER TABLE genres_books
  ADD CONSTRAINT genres_genre_id_fk 
    FOREIGN KEY (genre_id) REFERENCES genres(id)
	  ON DELETE CASCADE,
  ADD CONSTRAINT books_genre_id_fk 
    FOREIGN KEY (book_id) REFERENCES books(id)
	  ON DELETE CASCADE;
	  
	  
-- Таблица авторов 
DROP TABLE IF EXISTS authors;
CREATE TABLE authors (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор",
  firstname VARCHAR(100) NOT NULL COMMENT "Имя",
  lastname VARCHAR(100) NOT NULL COMMENT "Фамилия",  
  birthday DATE COMMENT "Дата рождения",
  country_id INT UNSIGNED NOT NULL COMMENT "Страна",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки",
  INDEX authors_lastname_idx (lastname)
) COMMENT "Авторы";

-- Добавление дополнительного столбца
ALTER TABLE authors ADD COLUMN num_books INT NOT NULL COMMENT "Кол-во написанных книг у автора";

-- Таблица связи авторов и книг
CREATE TABLE authors_books (
  author_id INT UNSIGNED NOT NULL COMMENT "ID автора",
  book_id INT UNSIGNED NOT NULL COMMENT "ID книги",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки", 
  PRIMARY KEY (author_id, book_id) COMMENT "Составной первичный ключ"
) COMMENT "Связь между авторами и книгами";


-- Добавляем внешние ключи
ALTER TABLE authors_books
  ADD CONSTRAINT authors_books_author_id_fk 
    FOREIGN KEY (author_id) REFERENCES authors(id)
	  ON DELETE CASCADE,
  ADD CONSTRAINT authors_books_book_id_fk 
    FOREIGN KEY (book_id) REFERENCES books(id)
	  ON DELETE CASCADE;
	  

-- Таблица комментариев
DROP TABLE IF EXISTS comments;
CREATE TABLE comments (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор",
  book_id INT UNSIGNED NOT NULL COMMENT "ID книги",   
  from_user_id INT UNSIGNED NOT NULL COMMENT "ID отправителя",
  to_user_id INT DEFAULT NULL COMMENT "ID получателя",
  body TEXT NOT NULL COMMENT "Текст сообщения",
  created_at DATETIME DEFAULT NOW() COMMENT "Время создания строки"
) COMMENT "Комментарии";


-- Добавляем внешние ключи
ALTER TABLE comments
  ADD CONSTRAINT comments_book_id_to_id_fk 
    FOREIGN KEY (book_id) REFERENCES books(id),
  ADD CONSTRAINT comments_from_user_id_to_fk 
    FOREIGN KEY (from_user_id) REFERENCES users(id);
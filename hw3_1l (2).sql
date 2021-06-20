-- Добавить необходимую таблицу/таблицы для того, чтобы можно было использовать лайки для медиафайлов, 
-- постов и пользователей.

USE vk;

CREATE TABLE likes (
	id SERIAL PRIMARY KEY,
	from_user_id BIGINT UNSIGNED NOT NULL,
  	to_user_id BIGINT UNSIGNED NOT NULL,
  	post INT UNSIGNED,
    file_like INT UNSIGNED,
  	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки",
  	INDEX fk_likes_from_user_idx (from_user_id),
  	INDEX fk_likes_to_user_idx (to_user_id),
  	CONSTRAINT fk_likes_users_1 FOREIGN KEY (from_user_id) REFERENCES users (id),
  	CONSTRAINT fk_likes_users_2 FOREIGN KEY (to_user_id) REFERENCES users (id)
);

INSERT INTO likes VALUES (DEFAULT, 1, 2, 5, 3, DEFAULT);
INSERT INTO likes VALUES (DEFAULT, 1, 2, 10, 8, DEFAULT);
INSERT INTO likes VALUES (DEFAULT, 2, 1, 8, 7, DEFAULT);

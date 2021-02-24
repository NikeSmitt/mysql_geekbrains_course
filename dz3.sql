/*
 
Написать крипт, добавляющий в БД vk, которую создали на занятии, 3 новые таблицы 
(с перечнем полей, указанием индексов и внешних ключей)

*/



DROP TABLE IF EXISTS friend_relationship_type;
CREATE TABLE friend_relationship_type(
	id SERIAL,
	name VARCHAR(100)
);



DROP TABLE IF EXISTS friends;
CREATE TABLE friends(
	user_id BIGINT UNSIGNED NOT NULL,
	friend_user_id BIGINT UNSIGNED NOT NULL,
	relationship_type_id BIGINT UNSIGNED NOT NULL,
	
	FOREIGN KEY (user_id) REFERENCES users(id),
	FOREIGN KEY (friend_user_id) REFERENCES users(id),
	CHECK (user_id != friend_user_id)
);




DROP TABLE IF EXISTS news;
CREATE TABLE news(
	id SERIAL,
	author BIGINT UNSIGNED NOT NULL,
	title VARCHAR(255),
	moderator BIGINT UNSIGNED NOT NULL,
	news_body TEXT,
	created_at DATETIME DEFAULT NOW(),
	updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,
	
	INDEX (title),
	FOREIGN KEY (author) REFERENCES users(id),
	FOREIGN KEY (moderator) REFERENCES users(id)
	
);


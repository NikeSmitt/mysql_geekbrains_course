USE vk;


/*
  2. Написать скрипт, возвращающий список имен (только firstname) пользователей без повторений в алфавитном порядке
 */


SELECT DISTINCT firstname FROM users ORDER BY firstname ASC;

/*
 * 3. Написать скрипт, отмечающий несовершеннолетних пользователей как неактивных (поле is_active = false). 
 * Предварительно добавить такое поле в таблицу profiles со значением по умолчанию = true (или 1)
 */



ALTER TABLE profiles
ADD is_active BIT DEFAULT 1;



UPDATE profiles
SET is_active = 0
WHERE (DATEDIFF(NOW(),profiles.birthday) < 365 * 18);


/*
 * 4. Написать скрипт, удаляющий сообщения «из будущего» (дата больше сегодняшней)
 */

-- fake data
INSERT INTO messages 
VALUES (100, 5, 3, 'Hello SQL!', DATE_ADD(NOW(), INTERVAL 20 DAY));

DELETE FROM messages WHERE messages.created_at > NOW();

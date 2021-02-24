/* 
Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине
*/

SELECT id, name FROM users WHERE id IN (SELECT user_id FROM orders);

/*
Выведите список товаров products и разделов catalogs, который соответствует товару.
*/

/* Не совсем понял, что имелось в виду, поэтому привожу два варианта*/

/* 1 */

SELECT id, name, (SELECT name FROM catalogs WHERE id = catalog_id) FROM products;

/* 2 */

SELECT id, name, catalog_id FROM products WHERE catalog_id = (SELECT catalog_id FROM products WHERE name = 'AMD FX-8320');

/*
(по желанию) Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label, name).
Поля from, to и label содержат английские названия городов, поле name — русское. 
Выведите список рейсов flights с русскими названиями городов.
*/


SELECT 
	id, 
	(SELECT name FROM cities WHERE label = `from`) AS 'from',
 	(SELECT name FROM cities WHERE label = `to`) AS 'to' 
 FROM flights as `from`;




/*
 * 1. В базе данных shop и sample присутствуют одни и те же таблицы, учебной базы данных. 
 * Переместите запись id = 1 из таблицы shop.users в таблицу sample.users. 
 * Используйте транзакции.
 */


START TRANSACTION;
INSERT INTO sample.users 
SELECT * FROM shop.users WHERE shop.users.id = 1;
COMMIT;



/*
 * Создайте представление, которое выводит название name товарной позиции из таблицы products 
 * и соответствующее название каталога name из таблицы catalogs.
 */
USE shop;

CREATE VIEW product_catalog AS
SELECT products.name AS product, catalogs.name AS from_catalog FROM products
JOIN catalogs ON products.catalog_id = catalogs.id;


SELECT * FROM product_catalog;


/*
 * Создайте хранимую функцию hello(), которая будет возвращать приветствие,
 *  в зависимости от текущего времени суток. С 6:00 до 12:00 функция должна
 *  возвращать фразу "Доброе утро", с 12:00 до 18:00 функция должна возвращать фразу 
 * "Добрый день", с 18:00 до 00:00 — "Добрый вечер", с 00:00 до 6:00 — "Доброй ночи".

 */



DROP FUNCTION IF EXISTS hello;

CREATE FUNCTION hello()
RETURNS VARCHAR(20) DETERMINISTIC
BEGIN
	DECLARE time_now TIME;
	SET time_now = TIME(NOW());
	IF time_now BETWEEN TIME('06:00') AND TIME('11:59') THEN
		RETURN "Доброе утро";
	ELSEIF time_now BETWEEN TIME('12:00') AND TIME('17:59') THEN
		RETURN "Добрый день";
	ELSEIF time_now BETWEEN TIME('18:00') AND TIME('23:59') THEN
		RETURN "Добрый день";
	ELSE
		RETURN "Спокойной ночи";
	END IF;
END;

select hello();


/*
 * В таблице products есть два текстовых поля: name с названием товара и description с его описанием. 
 * Допустимо присутствие обоих полей или одно из них. 
 * Ситуация, когда оба поля принимают неопределенное значение NULL неприемлема. 
 * Используя триггеры, добейтесь того, чтобы одно из этих полей или оба поля были заполнены.
 * При попытке присвоить полям NULL-значение необходимо отменить операцию.
 */

DROP TRIGGER IF EXISTS check_product_insert;
CREATE TRIGGER check_product_insert BEFORE INSERT ON shop.products
FOR EACH ROW 
BEGIN 
	SET NEW.name = COALESCE(NEW.name, 'New item');
	SET NEW.description = COALESCE(NEW.description, 'Empty Description');
END;


DROP TRIGGER IF EXISTS check_product_update;
CREATE TRIGGER check_product_update BEFORE UPDATE ON shop.products 
FOR EACH ROW 
BEGIN 
	SET NEW.name = COALESCE(NEW.name, OLD.name);
	SET NEW.description = COALESCE(NEW.description, OLD.description);
END;



/*
 * (по желанию) Напишите хранимую функцию для вычисления произвольного числа Фибоначчи. 
 * Числами Фибоначчи называется последовательность в которой число равно сумме двух предыдущих чисел. Вызов функции FIBONACCI(10) должен возвращать число 55.

 */


DROP FUNCTION IF EXISTS fibonacci;

CREATE FUNCTION fibonacci(n INT)
RETURNS INT DETERMINISTIC
BEGIN
	DECLARE v1, v2, res, counter INT DEFAULT 0;
	IF n < 2 THEN
		RETURN n;
	END IF;

	
	SET v2 = 1;
	
	WHILE counter <= n - 2 DO
		SET res = v1 + v2;
		SET v1 = v2;
		SET v2 = res;
		SET counter = counter + 1;
	END WHILE;

	RETURN res;	
	
END;

SELECT fibonacci(10);







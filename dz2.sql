/* 1. Установите СУБД MySQL. Создайте в домашней директории файл .my.cnf, задав в нем логин и пароль, который указывался при установке.

.my.cnf

[mysql]
user=root
password=***


[mysql]
user=root
password=***

*/


--2. Создайте базу данных example, разместите в ней таблицу users, состоящую из двух столбцов, числового id и строкового name.

CREATE DATABASE example;
USE example;
CREATE TABLE users (
id INT NOT NULL AUTO_INCREMENT,
name VARCHAR(255) NOT NULL,
PRIMARY KEY (id)
);


--3. Создайте дамп базы данных example из предыдущего задания, разверните содержимое дампа в новую базу данных sample.
\! mysqldump example > example_dump.sql
CREATE DATABASE sample;
\! mysql sample < example_dump.sql


/*
4. (по желанию) Ознакомьтесь более подробно с документацией утилиты mysqldump. 
Создайте дамп единственной таблицы help_keyword базы данных mysql. Причем добейтесь того, чтобы дамп содержал только первые 100 строк таблицы.
*/

\! mysqldump --opt --where='true limit 100' mysql help_keyword > help_100_dump.sql

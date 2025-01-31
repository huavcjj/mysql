SHOW DATABASES;

USE day_4_9_db;

SHOW TABLES;

DESCRIBE users;

SELECT * FROM users LIMIT 10;

SELECT * FROM users WHERE name="奥村 成美";

SELECT * FROM users WHERE birth_place="日本";

SELECT * FROM users WHERE birth_place<>"日本" ORDER BY age LIMIT 10;

# FROM -> WHERE -> ORDER BY -> LIMIT


SELECT * FROM users WHERE age<=50 LIMIT 10;

DESCRIBE users;

SELECT * FROM users WHERE birth_day >= "2011-04-03";

SELECT * FROM users WHERE is_admin=0;

UPDATE users SET name="奥山 成美" WHERE id=1;

SELECT * FROM users WHERE id=1;

SELECT * FROM users ORDER BY id DESC LIMIT 1;

DELETE FROM users WHERE id>190;
------------------------------------------------------------
SELECT DATABASE();

DESCRIBE customers;

SELECT * FROM customers WHERE name IS NULL;

SELECT NULL IS NULL;

SELECT * FROM customers WHERE name IS NOT NULL;

SELECT * FROM prefectures;

SELECT * FROM prefectures WHERE name IS NULL;

SELECT * FROM prefectures WHERE name="";


SELECT * FROM users WHERE age NOT BETWEEN 5 AND 10;

SELECT * FROM users WHERE age BETWEEN 10 AND 20;


SELECT * FROM users WHERE name LIKE "村%";

SELECT * FROM users WHERE name LIKE "%郎";

SELECT * FROM users WHERE name LIKE "%ab%";

SELECT * FROM prefectures WHERE name LIKE "福_県" ORDER BY name;

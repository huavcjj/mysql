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
------------------------------------------------------------
-- IN

SELECT * FROM users WHERE age IN(12, 24, 36);

SELECT * FROM users WHERE birth_place NOT IN("France","Germany","Italy");

-- SELECT IN

SELECT * FROM customers WHERE id NOT IN (SELECT customer_id FROM receipts);

SELECT * FROM customers WHERE id IN (SELECT customer_id FROM receipts WHERE id<10);


-- ALL, ANY

SELECT * FROM users WHERE age > ALL(SELECT age FROM employees WHERE salary > 5000000);

SELECT * FROM users WHERE age = ANY(SELECT age FROM employees WHERE salary > 5000000);


-- AND, OR, NOT


SELECT * FROM employees;

SELECT * FROM employees WHERE department = " 営業部 " AND name LIKE "%田%";

SELECT * FROM employees WHERE department = " 営業部 " AND name LIKE "%田%" AND age <35;

SELECT * FROM employees WHERE department = " 営業部 " AND (name LIKE "%田%" OR name LIKE "%西%") AND age<35;

SELECT * FROM employees WHERE department = " 営業部 " OR department = " 開発部 ";

SELECT * FROM employees WHERE department IN(" 営業部 ", " 開発部 ");

SELECT * FROM employees WHERE NOT department = " 営業部 ";

------------------------------------------------------------
-- IN NUL

SELECT * FROM customers WHERE name IS NULL;

SELECT * FROM customers WHERE name IN("河野 文典", "稲田 季雄", NULL);

SELECT * FROM customers WHERE name IN("河野 文典", "稲田 季雄") OR name IS NULL;

-- NOT IN

SELECT * FROM customers WHERE name NOT IN("河野 文典", "稲田 季雄",　NULL);

SELECT * FROM customers WHERE name NOT IN("河野 文典", "稲田 季雄") AND name IS NOT NULL;


-- ALL

SELECT * FROM customers WHERE id < 10;

SELECT * FROM users WHERE birth_day <= ALL(SELECT birth_day FROM customers WHERE id < 10);

SELECT * FROM users WHERE birth_day <= ALL(SELECT birth_day FROM customers WHERE id < 10 AND birth_day IS NOT NULL);

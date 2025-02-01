SHOW DATABASES;

USE day_4_9_db;

SHOW TABLES;

SELECT * FROM users;

-- TRANSACTION

START TRANSACTION;

UPDATE users SET name = "奥山 也美" WHERE id = 1;

SELECT * FROM users;

-- ROLLBACK

ROLLBACK;


START TRANSACTION;

UPDATE users SET name = "奥山 也美" WHERE id = 1;

SELECT * FROM users;

-- COMMIT 
COMMIT;

SELECT * FROM users;
------------------------------------------------------------
SHOW VARIABLES WHERE variable_name = "autocommit";

SELECT * FROM students;

DELETE FROM students WHERE id = 300;

SELECT * FROM students ORDER BY id DESC LIMIT 1;

SET AUTOCOMMIT = 0;

DELETE FROM students WHERE id = 299;

COMMIT;

SET AUTOCOMMIT = 1;

------------------------------------------------------------
SHOW DATABASES;

USE day_4_9_db;

START TRANSACTION;

SHOW TABLES;

SELECT * FROM customers;

UPDATE customers SET age = 43 WHERE id = 1;

ROLLBACK;

START TRANSACTION;

UPDATE customers SET age = 22 WHERE id = 1;

-- テーブル全体のロック
UPDATE customers SET age = 22 WHERE name = "河野 文典";

COMMIT;

-- DELETE

START TRANSACTION;

-- 行ロック
DELETE FROM customers WHERE id = 1;

COMMIT;

-- INSERT 

START TRANSACTION;


INSERT INTO customers VALUES(1, "田中 太郎", 22, "1999-02-23");

SELECT * FROM customers;

COMMIT;

-- SELECTのロック
-- FOR SHARE

START TRANSACTION;

SELECT * FROM customers WHERE id = 1 FOR SHARE;

ROLLBACK;

-- FOR UPDATE

START TRANSACTION;

SELECT * FROM customers WHERE id = 1 FOR UPDATE;

ROLLBACK;

------------------------------------------------------------
-- LOCK TABLE READ

LOCK TABLE customers READ;

SELECT * FROM customers;

UPDATE customers SET age = 32 WHERE id = 1;

UNLOCK TABLES;

-- LOCK TABLE WRITE

LOCK TABLE customers WRITE;

SELECT * FROM customers;

UPDATE customers SET age = 32 WHERE id = 1;

UNLOCK TABLES;

-- DEAD LOCK

START TRANSACTION;

UPDATE customers SET age=22 WHERE id=1;

UPDATE users SET age= 11 WHERE id =1;

COMMIT;

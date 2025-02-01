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
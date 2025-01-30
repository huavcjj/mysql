SHOW DATABASES;

CREATE DATABASE my_db;

SHOW DATABASES; #DB一覧を表示

DROP DATABASE my_db;

USE mysql; #mysqlを利用

SELECT DATABASE();

USE my_db;

------------------------------------------------------------
USE my_db;

SElECT DATABASE();

# テーブル作成
CREATE TABLE users(
 id INT,
 name VARCHAR(10),
 age INT,
 phone_number CHAR(13),
 message TEXT
 );
 
# テーブル一覧を表示
SHOW TABLES;

# テーブルの定義確認
DESCRIBE users;

# テーブルを削除
DROP TABLE users;

SHOW TABlES;

# テーブル作成(主キー付き)
CREATE TABLE users(
 id INT PRIMARY KEY,
 name VARCHAR(10),
 age INT,
 phone_number CHAR(13),
 message TEXT
 );
 
DESCRIBE users;
------------------------------------------------------------
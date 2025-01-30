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

SELECT DATABASE();

# テーブル一覧
SHOW TABLES;

# テーブル名変更
ALTER TABLE users RENAME TO users_table;

DESCRIBE users_table;

# カラムの削除
ALTER TABLE users_table DROP COLUMN message;

# カラムの追加
ALTER TABLE users_table ADD post_code CHAR(8);

ALTER TABLE users_table ADD gender CHAR(1) AFTER age;

# 一番最初のカラムに追加
ALTER TABLE users_table ADD new_id INT FIRST;


ALTER TABLE users_table DROP COLUMN new_id;

# カラムの定義変更
ALTER TABLE users_table MODIFY name VARCHAR(50);

# カラム名を変更
ALTER TABLE users_table CHANGE COLUMN name 名前 VARCHAR(50);

DESCRIBE users_table;

ALTER TABLE users_table CHANGE COLUMN gender gender CHAR(1) AFTER post_code;


# 主キーを削除
ALTER TABLE users_table DROP PRIMARY KEY;

------------------------------------------------------------
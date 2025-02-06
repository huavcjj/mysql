-- データ中心アプローチ(DOP)
-- データ定義はシステムのパフォーマンスに直結する

-- 主キーは必ずつける
-- create_at,update_atは必ずつける
-- 文字列型や数値型は、大きすぎる型を設定しない
-- カラムの制約,デフォルト値,コメントはきちんとする

-- VIEW

CREATE VIEW stores_items_view AS
SELECT 
	st.name AS store_name,
	it.name AS item_name 
FROM stores AS st
INNER JOIN items AS it
	ON it.store_id = st.id;
	
SELECT * FROM stores_items_view;

UPDATE items SET name = "new Item 山田 1" WHERE name = "Item 山田 1";

SHOW TABLES;

SELECT * FROM INFORMATION_SCHEMA.VIEWS WHERE TABLE_SCHEMA = "day_10_14_db";

SHOW CREATE VIEW stores_items_view;

SELECT * FROM stores_items_view WHERE store_name = "山田商店";

SELECT 
	store_name,
	COUNT(*)
FROM stores_items_view 
GROUP BY store_name 
ORDER BY store_name;

DROP VIEW stores_items_view;

ALTER VIEW stores_items_view AS
SELECT 
	st.id AS store_id,
	it.id AS item_id,
	st.name AS store_name,
	it.name AS item_name
FROM stores AS st
INNER JOIN items AS it
	ON it.store_id = st.id;

RENAME TABLE stores_items_view TO new_stores_items_view;

-- ORM:自動的にバインド変数が活用される; SQLを直書き出しして実行すると、バインド変数を使わずに実行される

-- バインド変数
SET @customer_id = 5;
SELECT * FROM customers WHERE id = @customer_id;

CREATE DATABASE day_19_21_db;

USE day_19_21_db;

SHOW TABLES;

-- 統計情報の確認
SELECT * FROM mysql.innodb_table_stats WHERE database_name = "day_19_21_db";

SELECT * FROM prefectures;

INSERT INTO prefectures VALUES(48,'不明');

DELETE FROM prefectures WHERE prefecture_code = 48 AND name = '不明';

-- 統計情報の更新
ANALYZE TABLE prefectures;

-- SQLを実行せずに実行計画だけを表示
EXPLAIN SELECT * FROM customers;

-- SQLを実行して実行計画だけを表示
EXPLAIN ANALYZE SELECT * FROM customers;

SELECT * FROM customers;

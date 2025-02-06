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

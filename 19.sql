SELECT * FROM customers;

EXPLAIN ANALYZE SELECT * FROM customers WHERE first_name = 'Olivia';
-- 143ms

CREATE INDEX idx_customers_first_name ON customers(first_name);
EXPLAIN ANALYZE SELECT * FROM customers WHERE first_name = 'Olivia';
-- 4.1ms


EXPLAIN ANALYZE SELECT * FROM customers WHERE age = 41;
-- 142ms

CREATE INDEX idx_customers_age ON customers(age);
EXPLAIN ANALYZE SELECT * FROM customers WHERE age = 41;
-- 34.7ms

EXPLAIN ANALYZE SELECT * FROM customers WHERE first_name = 'Olivia' AND age = 42;
-- 7.9ms

EXPLAIN ANALYZE SELECT * FROM customers WHERE first_name = 'Olivia' OR age = 42;
-- 39.8ms


-- 複合Index
DROP INDEX idx_customers_first_name ON customers;
DROP INDEX idx_customers_age ON customers;

CREATE INDEX idx_customers_first_name_age ON customers(first_name,age);

EXPLAIN ANALYZE SELECT * FROM customers WHERE first_name = 'Olivia' AND age = 42;
-- 1.3ms

EXPLAIN ANALYZE SELECT * FROM customers WHERE first_name = 'Olivia';
-- 5.0ms

EXPLAIN ANALYZE SELECT * FROM customers WHERE age = 42;
-- 145ms ageだけFULL SCAN

EXPLAIN ANALYZE SELECT * FROM customers WHERE first_name = 'Olivia' OR age = 42;
-- 151ms

-- ORDER BY, GROUP BY:処理時間がかかる、実行の前にWHEREで絞り込む

DROP INDEX idx_customers_first_name ON customers;

EXPLAIN ANALYZE SELECT * FROM customers ORDER BY first_name; -- 330ms

CREATE INDEX idx_customers_first_name ON customers(first_name);
EXPLAIN ANALYZE SELECT /*+ INDEX(customers) */ * FROM customers ORDER BY first_name; -- 430ms

EXPLAIN ANALYZE SELECT * FROM customers ORDER BY id; -- 161ms

-- GROUP BY 
EXPLAIN ANALYZE SELECT 
	first_name,
	COUNT(*) 
FROM customers 
GROUP BY first_name; -- 97.6ms


EXPLAIN ANALYZE SELECT 
	age,
	COUNT(*) 
FROM customers 
GROUP BY age; -- 115ms

CREATE INDEX idx_customers_age ON customers(age);
EXPLAIN ANALYZE SELECT 
	age,
	COUNT(*) 
FROM customers 
GROUP BY age; -- 83.1ms

DROP INDEX idx_customers_first_name ON customers;
DROP INDEX idx_customers_age ON customers;

-- 複数のGROUP BY
CREATE INDEX idx_customers_first_name_age ON customers(first_name, age);
EXPLAIN ANALYZE SELECT 
	first_name,
	age,
	COUNT(*) 
FROM customers 
GROUP BY first_name, age; -- 106ms

DROP INDEX idx_customers_first_name_age ON customers;


-- 外部キーにIndex

EXPLAIN ANALYZE SELECT * 
FROM prefectures AS pr
INNER JOIN customers AS ct
	ON pr.prefecture_code = ct.prefecture_code AND pr.name = '北海道'; -- 431ms
	
CREATE INDEX idx_customers_prefecture_code ON customers(prefecture_code);
EXPLAIN ANALYZE SELECT * 
FROM prefectures AS pr
INNER JOIN customers AS ct
	ON pr.prefecture_code = ct.prefecture_code AND pr.name = '北海道'; -- 41.5ms


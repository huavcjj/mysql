SELECT name, age
FROM customers
WHERE age BETWEEN 28 AND 40
	AND name LIKE "%子"
ORDER BY age DESC
LIMIT 5;


DESCRIBE receipts;

SELECT * FROM receipts ORDER BY id DESC LIMIT 1;

INSERT INTO receipts (id,customer_id,store_name,price)
VALUES(301,100,'Store X',10000);

SELECT * FROM receipts ORDER BY id DESC LIMIT 1;


DELETE FROM receipts WHERE id = 301;


DELETE FROM prefectures WHERE name IS NULL OR name = '';

UPDATE customers
SET age = age + 1
WHERE id BETWEEN 20 AND 50;

UPDATE students
SET class_no = FLOOR(1 + RAND() * 5)
WHERE class_no = 6;

SELECT *
FROM students
WHERE class_no = 1
AND height < ALL (
	SELECT height + 10
	FROM students
	WHERE class_no IN (3, 4)
);

UPDATE employees
SET department = TRIM(department);


UPDATE employees
SET salary = ROUND(
	CASE
		WHEN salary >= 5000000 THEN salary * 0.9
		ELSE salary * 1.1
	END
);


DESCRIBE customers;

SELECT * FROM customers ORDER BY id DESC LIMIT 1;

INSERT INTO customers (id, name, age, birth_day)
VALUES (101, '名無権兵衛', 0, CURDATE());

ALTER TABLE customers
ADD COLUMN name_length INT;

UPDATE customers
SET name_length = LENGTH(name);

ALTER TABLE tests_score
ADD COLUMN score INT;

DESCRIBE tests_score;


SELECT * FROM employees
ORDER BY FIELD(department, 'マーケティング部', '研究部', '開発部', '総務部', '営業部', '経理部');
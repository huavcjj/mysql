CREATE DATABASE day_10_14_db;

SHOW TABLES;

SELECT
	cs.name
FROM
	classes AS cs;
	
SELECT * FROM employees;

SELECT * FROM departments;

-- IN

SELECT * FROM employees WHERE department_id IN(1, 2);

SELECT id FROM departments WHERE name IN("経営企画部","営業部");

SELECT * FROM employees 
WHERE department_id IN (
    SELECT id FROM departments 
    WHERE name IN ('経営企画部', '営業部')
);


SELECT * FROM students;

SELECT * FROM users;


SELECT * 
FROM students
WHERE (first_name, last_name) IN (
    SELECT first_name, last_name 
    FROM users
);

--  副問い合わせ

SELECT MAX(age) FROM employees;

SELECT * 
FROM employees 
WHERE age > (
    SELECT AVG(age) 
    FROM employees
);

------------------------------------------------------------
-- FROM

SELECT department_id, AVG(age) AS avg_age FROM employees GROUP BY department_id;


SELECT 
    MAX(avg_age) AS "部署ごとの平均年齢の最大",
    MIN(avg_age) AS "部署ごとの平均年齢の最小"
FROM (
    SELECT 
        department_id, 
        AVG(age) AS avg_age 
    FROM employees 
    GROUP BY department_id
) AS tmp_emp;


SELECT 
    MAX(age_count) AS "最大年齢グループ人数", 
    MIN(age_count) AS "最小年齢グループ人数"
FROM (
    SELECT 
        FLOOR(age / 10) * 10 AS age_group, 
        COUNT(*) AS age_count 
    FROM employees 
    GROUP BY FLOOR(age / 10)
) AS age_summary;


-- SELECT


SELECT * FROM customers;

SELECT * FROM orders;


SELECT 
    cs.first_name,
    cs.last_name,
    (
        SELECT MAX(order_date) 
        FROM orders AS order_max 
        WHERE cs.id = order_max.customer_id
    ) AS "最近の注文日",
    (
		SELECT SUM(order_amount * order_price)
		FROM orders AS tmp_order
		WHERE cs.id = tmp_order.customer_id
    ) AS "今までのお支払い金額"
FROM customers AS cs
WHERE cs.id < 10;

------------------------------------------------------------

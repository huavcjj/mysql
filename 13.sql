SELECT * FROM employees;

-- WINDOWS関数

-- PARTITION BY

SELECT
    *,
    AVG(age) OVER() AS avg_age,
    COUNT(*) OVER() AS total_count
FROM employees;

SELECT
	*,
	AVG(age) OVER(PARTITION BY department_id) AS avg_age,
	COUNT(*) OVER(PARTITION BY department_id) AS total_count
FROM employees;



SELECT
	*,
	COUNT(*) OVER(PARTITION BY FLOOR(age/10)) AS age_count, 
	FLOOR(age/10)
FROM employees;

SELECT 
    *,
    SUM(order_amount * order_price) OVER(PARTITION BY DATE_FORMAT(order_date, "%Y/%m")) AS monthly_sales
FROM orders;

------------------------------------------------------------
-- ORDER BY

SELECT
	*,
	COUNT(*) OVER(ORDER BY age) AS tmp_count
FROM employees;

SELECT 
	*,
	SUM(order_price) OVER(ORDER BY order_date, customer_id) 
FROM orders;

SELECT
	FLOOR(age / 10) * 10,
	COUNT(*) OVER(ORDER BY FLOOR(age / 10))
FROM employees;








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
------------------------------------------------------------

-- PARTITION BY, ORDER BY

SELECT
	*,
	MIN(age) OVER(PARTITION BY department_id ORDER BY age) AS count_value
FROM employees;

SELECT 
	*,
	SUM(sa.payment) OVER(PARTITION BY sa.paid_date ORDER BY emp.id)
FROM employees AS emp
INNER JOIN salaries AS sa
ON emp.id = sa.employee_id;


-- ROWS BETWEEN : 行を基準

-- UNBOUNDED PRECEDING : 一番頭の行
-- n PRECEDING : 現在の行よりn行前の行
-- CURRENT ROW : 現在の行
-- n FOLLOWING : 現在の行よりn行後の行
-- UNBOUNDED FOLLOWIGN : 一番最後の行

-- RANGE BETWEEN : 値を基準


WITH daily_summary AS (
	SELECT 
		order_date,
		SUM(order_price * order_amount) AS sale
	FROM orders
	GROUP BY order_date
)
SELECT 
	*,
	AVG(sale) OVER(ORDER BY order_date ROWS BETWEEN 6 PRECEDING AND CURRENT ROW)
FROM daily_summary;



SELECT 
    emp.*,
    summary_salary.payment,
    SUM(summary_salary.payment) OVER(
        ORDER BY emp.age 
        RANGE BETWEEN 3 PRECEDING AND CURRENT ROW
    ) AS p_summary
FROM employees AS emp
INNER JOIN (
    SELECT 
        employee_id,
        SUM(payment) AS payment
    FROM salaries
    GROUP BY employee_id
) AS summary_salary
ON emp.id = summary_salary.employee_id;

------------------------------------------------------------
-- ROW_NUMBER, RANK, DENSE_RANK

SELECT
	*,
	ROW_NUMBER() OVER(ORDER BY age) AS row_num,
	RANK() OVER(ORDER BY age) AS row_rank,
	DENSE_RANK() OVER(ORDER BY age) AS row_dense_rank
FROM employees;

-- CUME_DIST, PERCENT_RANK

SELECT
	age,
	RANK() OVER(ORDER BY age) AS row_rank,
	COUNT(*) OVER() AS cnt,
	PERCENT_RANK() OVER(ORDER BY age) AS p_age, -- (RANK - 1) / (行数 - 1)
	CUME_DIST() OVER(ORDER BY age) AS c_age -- 現在の行の値より小さい行の割合
FROM employees;

-- LAG, LEAD

SELECT
	age,
	LAG(age) OVER(ORDER BY age),
	LAG(age,3,0) OVER(ORDER BY age),
	LEAD(age) OVER(ORDER BY age),
	LEAD(age,3,0) OVER(ORDER BY age)
FROM customers;

-- FIRST_VALUE, LAST_VALUE

SELECT
	*,
	FIRST_VALUE(first_name) OVER(PARTITION BY department_id ORDER BY age),
	LAST_VALUE(first_name) OVER(PARTITION BY department_id ORDER BY age RANGE BETWEEN UNBOUNDED AND UNBOUNDED FOLLOWING)
FROM employees;

-- NTILE

SELECT 
	age,
	NTILE(10) OVER(ORDER BY age)
FROM employees
-- WHERE NTILE(10) OVER(ORDER BY age) = 8
;


SELECT * 
FROM (
    SELECT 
        age,
        NTILE(10) OVER(ORDER BY age) AS ntile_value
    FROM employees
) AS tmp
WHERE tmp.ntile_value = 8;




-- SQLの実行順序
-- FORM,JOIN -> WHERE -> GROUP BY -> 集計関数 -> HAVING -> WINDOW関数 -> SELECT -> DISTINCT -> UNION/INTERSECT/EXCEPT -> ORDER BY -> OFFSET -> LIMIT


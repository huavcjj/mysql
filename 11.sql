SELECT * FROM departments;

SELECT * FROM employees;

-- EXISTS

SELECT * 
FROM employees AS em
WHERE EXISTS (
    SELECT 1
    FROM departments AS dt
    WHERE em.department_id = dt.id
);

-- IN

SELECT * 
FROM employees AS em
WHERE em.department_id IN (
    SELECT id 
    FROM departments
);

SELECT * 
FROM departments AS dt
WHERE dt.name IN ('営業部', '開発部');


SELECT * 
FROM employees AS em
WHERE EXISTS (
    SELECT 1
    FROM departments AS dt
    WHERE dt.name IN ('営業部', '開発部')
    AND em.department_id = dt.id
);
------------------------------------------------------------

SELECT * 
FROM customers AS cd
WHERE NOT EXISTS (
    SELECT 1
    FROM orders AS od
    WHERE cd.id = od.customer_id
    AND od.order_date = '2020-12-31'
);


SELECT * 
FROM employees AS em1
WHERE EXISTS (
	SELECT 1
	FROM employees AS em2
	WHERE em1.manager_id = em2.id
);
------------------------------------------------------------
-- EXISTS NULLを返さない

-- NOT EXISTS NULLを返す

-- NULLを表示しない場合
SELECT * 
FROM customers AS c1
WHERE EXISTS (
    SELECT 1
    FROM customers_2 AS c2 
    WHERE c1.first_name = c2.first_name
    AND c1.last_name = c2.last_name
	AND c1.phone_number = c2.phone_number
);

-- NULLを表示する場合
SELECT *
FROM customers AS c1
WHERE EXISTS (
    SELECT 1
    FROM customers_2 AS c2
    WHERE c1.first_name = c2.first_name
    AND c1.last_name = c2.last_name
    AND (
        c1.phone_number = c2.phone_number
        OR (
            c1.phone_number IS NULL
            AND c2.phone_number IS NULL
        )
    )
);	

-- NOT EXISTS (NULLを表示)

SELECT *
FROM customers AS c1
WHERE NOT EXISTS (
	SELECT *
	FROM customers_2 AS c2
	WHERE c1.first_name = c2.first_name
	AND c1.last_name = c2.last_name
	AND c1.phone_number = c2.phone_number
);

-- NOT IN (NULLを非表示)

SELECT *
FROM customers AS c1
WHERE (c1.first_name, c1.last_name, c1.phone_number) NOT IN (
    SELECT c2.first_name, c2.last_name, c2.phone_number
    FROM customers_2 AS c2
);

-- EXISTS をINで書く

SELECT *
FROM customers AS c1
WHERE (c1.first_name, c1.last_name, c1.phone_number) IN (
    SELECT c2.first_name, c2.last_name, c2.phone_number
    FROM customers_2 AS c2
);
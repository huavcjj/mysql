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


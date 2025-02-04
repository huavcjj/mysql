SELECT * FROM employees;

UPDATE employees SET age = age + 1 WHERE id = 1;


SELECT *
FROM employees AS emp
WHERE emp.department_id = (
	SELECT id 
	FROM departments 
	WHERE name = "営業部"
);


UPDATE employees AS emp
SET emp.age = emp.age + 2
WHERE emp.department_id = (
	SELECT id 
	FROM departments 
	WHERE name = "営業部"
);

-- INNER JOIN

SELECT * FROM employees;

ALTER TABLE employees
ADD department_name VARCHAR(255);


SELECT 
	emp.*,
	COALESCE(dt.name,"不明")
FROM  employees AS emp
LEFT JOIN departments AS dt
	ON emp.department_id = dt.id;



UPDATE employees AS emp
LEFT JOIN departments AS dt
	ON emp.department_id = dt.id
SET emp.department_name = COALESCE(dt.name,'不明');

SELECT * FROM employees;
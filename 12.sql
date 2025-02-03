-- INNER JOIN

SHOW TABLES;

SELECT * FROM employees;

SELECT * FROM departments;

SELECT *
FROM employees AS emp
INNER JOIN departments AS dt
ON emp.department_id = dt.id;


SELECT 
	emp.id,
	emp.first_name,
	emp.last_name,
	dt.id AS department_id,
	dt.name AS department_name
FROM employees AS emp
INNER JOIN departments AS dt
ON emp.department_id = dt.id;


SELECT * 
FROM students AS std
INNER JOIN users AS usr
ON std.first_name = usr.first_name
AND std.last_name = usr.last_name;

SELECT * 
FROM employees AS emp
INNER JOIN students AS std
ON emp.id < std.id;

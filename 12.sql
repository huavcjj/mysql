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

------------------------------------------------------------
-- LEFT JOIN

SELECT 
	emp.id,
	emp.first_name,
	emp.last_name,
	COALESCE(dt.id,"該当なし"),
	dt.name AS department_name
FROM employees AS emp
LEFT JOIN departments AS dt
ON emp.department_id = dt.id;

SELECT * FROM enrollments;

SELECT * FROM classes;

-- 多対多
SELECT * 
FROM students AS std
LEFT JOIN enrollments AS enr
ON std.id = enr.student_id
LEFT JOIN classes AS cs
ON enr.class_id = cs.id;


-- RIGHT JOIN

SELECT * 
FROM students AS std
RIGHT JOIN enrollments AS enr
ON std.id = enr.student_id
RIGHT JOIN classes AS cs
ON enr.class_id = cs.id;

-- FULL OUTER JOINを実現

SELECT * 
FROM students AS std
LEFT JOIN enrollments AS enr
ON std.id = enr.student_id
LEFT JOIN classes AS cs
ON enr.class_id = cs.id
UNION
SELECT * 
FROM students AS std
RIGHT JOIN enrollments AS enr
ON std.id = enr.student_id
RIGHT JOIN classes AS cs
ON enr.class_id = cs.id;

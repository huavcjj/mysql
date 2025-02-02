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
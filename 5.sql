-- 算術演算子

SELECT 1 + 2;

SELECT name, age+3 AS age_3 FROM users LIMIT 10;

SELECT age-1 AS age_1 FROM users;

SELECT birth_day,birth_day+2 FROM users;

SELECT 3 * 5;

SELECT * FROM employees;

SELECT department, name, salary, salary*1.1 AS salary_next_year FROM employees;

SELECT 10/3;

SELECT salary/10 FROM employees;

SELECT age % 12 FROM users;

-- CONCAT

SELECT CONCAT(department,":",name) AS "部署 名前" FROM employees;

SELECT CONCAT(name,"(",age,")") FROM users;

-- NOW, CURDATE, DATE_FORMAT

SELECT NOW();

SELECT NOW(), name, age FROM users;

SELECT CURDATE();

SELECT DATE_FORMAT(NOW(),"%Y");
------------------------------------------------------------
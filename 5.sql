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
-- LENGTH, CHAR_LENGTH

SELECT LENGTH("ABC");
SELECT LENGTH("あいう");

SELECT name, LENGTH(name) FROM users;

-- CHAR_LENGTH

SELECT CHAR_LENGTH("ABC");
SELECT CHAR_LENGTH("あいう");

SELECT name, CHAR_LENGTH(name) FROM users;

-- TRIM, LTRIM, RTRIM

SELECT LTRIM("  ABC  ");
SELECT RTRIM("  ABC  ");
SELECT TRIM("  ABC  ");

SELECT name,CHAR_LENGTH(name) 
FROM employees 
WHERE CHAR_LENGTH(name) <> CHAR_LENGTH(TRIM(name));

UPDATE employees 
SET name=TRIM(name)
WHERE CHAR_LENGTH(name) <> CHAR_LENGTH(TRIM(name));

-- LENGTH, CHAR_LENGTH

SELECT LENGTH("ABC");
SELECT LENGTH("あいう");

SELECT name, LENGTH(name) FROM users;

-- CHAR_LENGTH

SELECT CHAR_LENGTH("ABC");
SELECT CHAR_LENGTH("あいう");

SELECT name, CHAR_LENGTH(name) FROM users;

-- TRIM, LTRIM, RTRIM

SELECT LTRIM("  ABC  ");
SELECT RTRIM("  ABC  ");
SELECT TRIM("  ABC  ");

SELECT name,CHAR_LENGTH(name) 
FROM employees 
WHERE CHAR_LENGTH(name) <> CHAR_LENGTH(TRIM(name));

UPDATE employees 
SET name=TRIM(name)
WHERE CHAR_LENGTH(name) <> CHAR_LENGTH(TRIM(name));

-- REPLACE

SELECT REPLACE("I like golang","golang","python");

SELECT REPLACE(name,"Mrs","Mr") FROM users WHERE name LIKE "Mrs%";

UPDATE users SET name = REPLACE(name,"Mrs","Mr") WHERE name LIKE "Mrs%";

SELECT * FROM users;

-- UPPER LOWER

SELECT UPPER("golang");

SELECT LOWER("APPLE");

SELECT name, UPPER(name), LOWER(name) FROM users;

-- SUBSTRING 

SELECT SUBSTRING(name,2,3), name FROM employees;

SELECT * FROM employees WHERE SUBSTRING(name,2,1)= "田";

-- REVERSE

SELECT REVERSE(name), name FROM employees;
------------------------------------------------------------
-- ROUND, FLOOR, CEILING

SELECT ROUND(13,14);

SELECT FLOOR(3.14);

SELECT CEILING(3.14);

SELECT RAND();

SELECT FLOOR(RAND() * 10);

-- POWER

SELECT POWER(3,4);

SELECT weight / POWER(height/100,2) AS BMI FROM students;

-- COALESCE

SELECT * FROM tests_score;

SELECT COALESCE(NULL, NULL, NULL, "A", NULL, "B");

SELECT COALESCE(test_score_1, test_score_2, test_score_3) AS score FROM tests_score;


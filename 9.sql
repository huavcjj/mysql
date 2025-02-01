-- UNION

SELECT * FROM new_students
UNION
SELECT * FROM students
ORDER BY id;

-- UNION ALL:重複削除しない
SELECT * FROM new_students
UNION ALL
SELECT * FROM students
ORDER BY id;

SELECT * FROM students WHERE id < 10
UNION ALL
SELECT * FROM students WHERE id > 250;

SELECT id, name FROM students WHERE id < 10
UNION
SELECT age, name FROM users WHERE id < 10
ORDER BY id;

------------------------------------------------------------
-- INTERSECT

SELECT * FROM new_students
INTERSECT
SELECT * FROM students;

-- EXCEPT

SELECT * FROM new_students
EXCEPT
SELECT * FROM students
ORDER BY id;

SELECT * FROM students
EXCEPT
SELECT * FROM new_students
ORDER BY id;


-- どちらかに存在

(SELECT * FROM new_students
EXCEPT
SELECT * FROM students)
UNION ALL
(SELECT * FROM students
EXCEPT
SELECT * FROM new_students)
ORDER BY id;


SELECT * FROM students WHERE id < 10
EXCEPT
SELECT * FROM new_students WHERE id < 10;

------------------------------------------------------------
SELECT * FROM customers WHERE name IS NULL;

-- COUNT

SELECT COUNT(*) FROM customers; -- NULLをカウント

SELECT COUNT(name) FROM customers; -- NULLをカウントしない

SELECT COUNT(name) FROM customers WHERE id > 80;

-- MAX, MIN

SELECT MAX(age), MIN(age) FROM users WHERE birth_place = "日本";

SELECT MAX(birth_day), MIN(birth_day) FROM users;

-- SUM

SELECT SUM(salary) FROM employees;

-- AVG (NULLの場合面倒)

SELECT AVG(salary) FROM employees;


CREATE TABLE tmp_count(
	num INT
);

INSERT INTO tmp_count VALUES(1);
INSERT INTO tmp_count VALUES(2);
INSERT INTO tmp_count VALUES(3);
INSERT INTO tmp_count VALUES(NULL);

SELECT * FROM tmp_count;

SELECT AVG(COALESCE(num,0)) FROM tmp_count;




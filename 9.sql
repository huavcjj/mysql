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

------------------------------------------------------------

-- GROUP BY

SELECT age, COUNT(*), MAX(birth_day), MIN(birth_day) FROM users
WHERE birth_place = "日本"
GROUP BY age
ORDER BY COUNT(*);

SELECT department, SUM(salary), FLOOR(AVG(salary)), MIN(salary) FROM employees
WHERE age > 40
GROUP BY department;

SELECT
    CASE
        WHEN birth_place = '日本' THEN '日本人'
        ELSE 'その他'
    END AS "国籍",
    COUNT(*) AS "人数",
    MAX(age) AS "最大年齢"
FROM users
GROUP BY
    CASE
        WHEN birth_place = '日本' THEN '日本人'
        ELSE 'その他'
    END;
	
SELECT
    CASE
        WHEN name IN ('高知県', '愛媛県', '徳島県', '香川県') THEN '四国'
        ELSE 'その他'
    END AS "地域名",
    COUNT(*) AS "都道府県数"
FROM prefectures
GROUP BY
    CASE
        WHEN name IN ('高知県', '愛媛県', '徳島県', '香川県') THEN '四国'
        ELSE 'その他'
    END;
    
-- CASE

SELECT
	age,
	CASE
		WHEN age < 20 THEN "未成年"
		ELSE "成人"
		END AS "分類",
	COUNT(*)
FROM users
GROUP BY age;

------------------------------------------------------------
-- HAVING

SELECT department, AVG(salary) 
FROM employees 
GROUP BY department 
HAVING AVG(salary) > 398000;

SELECT birth_place, age, COUNT(*) FROM users
GROUP BY birth_place,age
HAVING COUNT(*) > 2
ORDER BY COUNT(*);
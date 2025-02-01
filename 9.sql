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




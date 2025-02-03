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
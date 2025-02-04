SELECT 
	first_name,
	last_name
FROM employees
WHERE id < 10
UNION
SELECT
	first_name,
	last_name
FROM customers
WHERE id < 10;


SELECT 
	MAX(payment), 
	MIN(payment), 
	AVG(payment),
	SUM(payment) 
FROM salaries AS sa
INNER JOIN employees AS emp
	ON sa.employee_id = emp.id
INNER JOIN departments AS dt
	ON emp.department_id = dt.id
WHERE dt.name = "営業部";


SELECT * FROM classes;

SELECT * FROM enrollments;

SELECT * FROM students;



SELECT 
    CASE
        WHEN cls.id < 5 THEN 'クラス1'
        ELSE 'クラス2'
    END AS クラス分類,
    COUNT(std.id) AS 学生数
FROM classes AS cls
INNER JOIN enrollments AS enr
    ON cls.id = enr.class_id
INNER JOIN students AS std
    ON enr.student_id = std.id
GROUP BY 
    CASE
        WHEN cls.id < 5 THEN 'クラス1'
        ELSE 'クラス2'
    END;
    
  
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
    
  SELECT 
    emp.id,
	SUM(sa.payment),
    AVG(sa.payment)
FROM employees AS emp
INNER JOIN salaries AS sa
    ON emp.id = sa.employee_id
WHERE emp.age < 40
GROUP BY emp.id
HAVING AVG(sa.payment) > 7000000;


SELECT * FROM customers;

SELECT * FROM orders;

SELECT 
    cst.*,
    (SELECT SUM(od.order_amount) 
     FROM orders AS od
     WHERE od.customer_id = cst.id) AS sum_order_amount
FROM customers AS cst;

SELECT 
    CONCAT(customers.last_name, customers.first_name) AS full_name,
    COUNT(*) AS order_count
FROM (
    SELECT *
    FROM customers
    WHERE last_name LIKE "%田%"
) AS customers
INNER JOIN (
    SELECT * 
    FROM orders 
    WHERE order_date >= "2020-12-01"
) AS orders
    ON customers.id = orders.customer_id
INNER JOIN items
    ON orders.item_id = items.id
INNER JOIN (
    SELECT *
    FROM stores
    WHERE name = "山田商店"
) AS stores
    ON stores.id = items.store_id
GROUP BY CONCAT(customers.last_name, customers.first_name);
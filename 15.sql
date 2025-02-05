SELECT * FROM employees;

UPDATE employees SET age = age + 1 WHERE id = 1;


SELECT *
FROM employees AS emp
WHERE emp.department_id = (
	SELECT id 
	FROM departments 
	WHERE name = "営業部"
);


UPDATE employees AS emp
SET emp.age = emp.age + 2
WHERE emp.department_id = (
	SELECT id 
	FROM departments 
	WHERE name = "営業部"
);

-- INNER JOIN

SELECT * FROM employees;

ALTER TABLE employees
ADD department_name VARCHAR(255);


SELECT 
	emp.*,
	COALESCE(dt.name,"不明")
FROM  employees AS emp
LEFT JOIN departments AS dt
	ON emp.department_id = dt.id;



UPDATE employees AS emp
LEFT JOIN departments AS dt
	ON emp.department_id = dt.id
SET emp.department_name = COALESCE(dt.name,'不明');

SELECT * FROM employees;

-- WITH UPDATE

SELECT * FROM stores;

ALTER TABLE stores
ADD all_sales INT;

SELECT * FROM stores;

SELECT * FROM items;

SELECT * FROM orders;


WITH tmp_sales AS (
	SELECT 
		it.store_id,
		SUM(od.order_amount * od.order_price) AS summary
	FROM items AS it
	INNER JOIN orders AS od
		ON it.id = od.item_id
	GROUP BY it.store_id
)
UPDATE stores AS st
INNER JOIN tmp_sales AS ts
	ON st.id = ts.store_id
SET st.all_sales = ts.summary;

SELECT * FROM stores;


-- DELETE

DELETE FROM employees
WHERE department_id IN(
	SELECT id
	FROM departments
	WHERE name = "開発部"
);

SELECT * FROM employees;

-- INSERT

SELECT * FROM customers;

SELECT * FROM orders;


CREATE TABLE customer_orders(
	name VARCHAR(255),
	order_date DATE,
	sales INT,
	total_sales INT
);

INSERT INTO customer_orders
SELECT
	CONCAT(ct.last_name,ct.first_name),
	od.order_date,
	od.order_amount * od.order_price,
	SUM(od.order_amount * od.order_price) OVER(PARTITION BY CONCAT(ct.last_name,ct.first_name) ORDER BY od.order_date)
FROM customers AS ct
INNER JOIN orders AS od
	ON ct.id = od.customer_id;

SELECT * FROM customer_orders;

SHOW TABLES;

-- NOT NULL, DEFAULT

CREATE TABLE users (
    id INT PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255) NOT NULL DEFAULT ''
);

INSERT INTO users(id) VALUES(1);

SELECT * FROM users;

CREATE TABLE users_2(
	id INT PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255) NOT NULL,
    age INT DEFAULT 0
);

INSERT INTO users_2(id,first_name,last_name) VALUES(1,"Rola","Yamada");

SELECT * FROM users_2;

INSERT INTO users_2 VALUES(2,"Jiro","Suzuki",NULL);

-- UNIQUE

CREATE TABLE login_users(
	id INT PRIMARY KEY,
	name VARCHAR(255) NOT NULL,
	email VARCHAR(255) NOT NULL UNIQUE
);

INSERT INTO login_users VALUES(1,"Go","go@mail.com");
INSERT INTO login_users VALUES(2,"Java","java@mail.com");

CREATE TABLE tmp_names(
	name VARCHAR(255) UNIQUE
);

INSERT INTO tmp_names VALUES(NULL);

-- CHECK

CREATE TABLE customers(
	id INT PRIMARY KEY,
	name VARCHAR(255),
	age INT CHECK(age >= 20)
);

INSERT INTO customers VALUES(1,"Taro",22);

-- INSERT INTO customers VALUES(2,"Mike",19);


CREATE TABLE students (
	id INT PRIMARY KEY,
	name VARCHAR(255),
	age INT,
	gender CHAR(1),
	CONSTRAINT chk_students CHECK((age >= 15 AND age <= 20) AND (gender = "F" or gender = "M"))
);

INSERT INTO students VALUES (1,"Taro",15,"M");

-- INSERT INTO students VALUES (2,"Sachiko",22,"M");

-- INSERT INTO students VALUES (3,"Mike",18,"O");


CREATE TABLE employees (
	company_id INT,
	employee_code CHAR(8),
	name VARCHAR(255),
	age INT,
	PRIMARY KEY (company_id,employee_code)
);


INSERT INTO employees VALUES (1,"00000001","Taro",19);

INSERT INTO employees VALUES (2,"00000001", "Mike",20);

INSERT INTO employees VALUES (2,"00000002", "Role",20);


-- INSERT INTO employees VALUES (1,"00000001", "Miku", 29);

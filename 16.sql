DROP TABLE students;

CREATE TABLE schools(
	id INT PRIMARY KEY,
	name VARCHAR(255)
);

CREATE TABLE students(
	id INT PRIMARY KEY,
	name VARCHAR(255),
	age INT,
	school_id INT,
	FOREIGN KEY(school_id) REFERENCES schools(id)
);

-- INSERT INTO students VALUES(1,'Taro',18,1);

INSERT INTO schools VALUES(1,'北高校');

INSERT INTO students VALUES(1,'Taro',18,1);

-- 参照整合性エラー

-- UPDATE schools SET id = 2;

-- DELETE FROM schools;

-- UPDATE students SET school_id = 3;

-- DROP TABLE schools;


DESCRIBE employees;

-- 複数のカラムに外部キー

CREATE TABLE salaries(
	id INT PRIMARY KEY,
	company_id INT,
	employee_code CHAR(8),
	payment INT,
	paid_date DATE,
	FOREIGN KEY (company_id, employee_code) REFERENCES employees(company_id, employee_code)
);

SELECT * FROM employees;

INSERT INTO salaries VALUES(1,1,'00000001',1000,'2020-01-01');

-- INSERT INTO salaries VALUES(2,1,'00000003',2000,'2022-01-01');
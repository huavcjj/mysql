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


-- ON DELETE, ON UPDATE
CREATE TABLE students(
	id INT PRIMARY KEY,
	name VARCHAR(255),
	age INT,
	school_id INT,
	FOREIGN KEY (school_id) REFERENCES schools(id)
	ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO students VALUES(1,'Taro',18,1);

SELECT * FROM students;
SELECT * FROM schools;

UPDATE schools SET id = 3 WHERE id =1;
SELECT * FROM students;

DELETE FROM schools;
SELECT * FROM students;

DROP TABLE students;

-- ON DELETE, ON UPDATE (SET NULL)
CREATE TABLE students(
	id INT PRIMARY KEY,
	name VARCHAR(255),
	age INT,
	school_id INT,
	FOREIGN KEY (school_id) REFERENCES schools(id)
	ON DELETE SET NULL ON UPDATE SET NULL
);

INSERT INTO schools VALUES(1,'北高校');
INSERT INTO students VALUES(1,'Taro',19,1);
SELECT * FROM students;

UPDATE schools SET id = 3 WHERE id = 1;
SELECT * FROM students;
UPDATE students SET school_id = 3 WHERE school_id IS NULL;

INSERT INTO schools VALUES(2,'南高校');
INSERT INTO students VALUES(2,'Mike',17,2);
SELECT * FROM students;

DELETE FROM schools WHERE id = 3;
SELECT * FROM students;

DROP TABLE students;


-- ON DELETE, ON UPDATE (SET DEFAULT)
CREATE TABLE students(
	id INT PRIMARY KEY,
	name VARCHAR(255),
	age INT,
	school_id INT DEFAULT -1,
	FOREIGN KEY (school_id) REFERENCES schools(id)
	ON DELETE SET DEFAULT ON UPDATE SET DEFAULT
);

INSERT INTO schools VALUES(1,'北高校');

INSERT INTO students VALUES(1,'Mike',17,1);

SELECT * FROM students;

UPDATE schools SET id = 3 WHERE id = 1;


SELECT * FROM employees;

DESCRIBE employees;

UPDATE employees SET name = 'Mike' WHERE employee_code= 2;

-- unique制約の追加
ALTER TABLE employees ADD CONSTRAINT uniq_employees_name UNIQUE(name);

-- 制約一覧
SELECT *
FROM information_schema.key_column_usage
WHERE table_name = 'employees';

-- 制約の削除
ALTER TABLE employees DROP CONSTRAINT uniq_employees_name;

-- unique制約の追加
ALTER TABLE employees ADD CONSTRAINT uniq_employees_name_age UNIQUE(name,age);

INSERT INTO employees VALUES(2,'00000003','Taro',18);

-- CREATE文の確認

SHOW CREATE TABLE employees;



SELECT * FROM customers;

SHOW CREATE TABLE customers;

ALTER TABLE customers DROP CONSTRAINT customers_chk_1;

DESCRIBE customers;

-- DEFAULTを追加

ALTER TABLE customers ALTER age SET DEFAULT 20;

INSERT INTO customers(id, name) VALUES(2,'Joke');

SELECT * FROM customers;

-- NOT NULLを追加

ALTER TABLE customers MODIFY name VARCHAR(255) NOT NULL;

DESCRIBE customers;

-- INSERT INTO customers(id,name) VALUES(3, NULL);

-- CHECK 制約の追加

ALTER TABLE customers ADD CONSTRAINT check_age CHECK(age > 10);


DESCRIBE customers;

ALTER TABLE customers DROP PRIMARY KEY;

-- 主キーを追加

ALTER TABLE customers ADD CONSTRAINT pk_customers PRIMARY KEY (id, name);


-- 外部キーを追加

DESCRIBE students;
SHOW CREATE TABLE students;
ALTER TABLE students DROP CONSTRAINT students_ibfk_1;


ALTER TABLE students ADD CONSTRAINT fk_schools_students FOREIGN KEY(school_id) REFERENCES schools(id);


-- AUTO_INCREMENT

CREATE TABLE animals (
	id INT PRIMARY KEY AUTO_INCREMENT COMMENT '主キーのID',
	name VARCHAR(50) NOT NULL COMMENT '動物の名前'
);

SHOW FULL COLUMNS FROM animals;

INSERT INTO animals VALUES(NULL,'Dog');

SELECT * FROM animals;

INSERT INTO animals(name) VALUES('Cat');


SELECT AUTO_INCREMENT FROM information_schema.tables WHERE TABLE_NAME = 'animals';

INSERT INTO animals VALUES(4,'Panda');

INSERT INTO animals VALUES(NULL,'Fish');

ALTER TABLE animals AUTO_INCREMENT = 100;

INSERT INTO animals VALUES(NULL, 'Bird');



INSERT INTO animals(name)
SELECT 'Snake'
UNION ALL
SELECT 'Dino'
UNION ALL
SELECT 'Gibra';


SELECT * FROM animals;

INSERT INTO animals(name)
SELECT name FROM animals;
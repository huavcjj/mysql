SELECT DATABASE();

USE my_db;

CREATE TABLE people(
 id INT PRIMARY KEY,
 name VARCHAR(50),
 birth_day DATE DEFAULT "1990-01-01"
 );
 
 INSERT INTO people VALUES(1,"RARA","2003-03-04");
 
 SELECT * FROM people;
 
 INSERT INTO people(id, name) VALUES(2,"JOJO");
 
 INSERT INTO people(id, name) VALUES(3,'Saburo');
 
 INSERT INTO people VALUES(4,"Jike's son","2020-01-13");
 
 SELECT * FROM people;

------------------------------------------------------------
SHOW TABLES;

SELECT * FROM people;

SELECT name,id, birth_day,name FROM people;

SELECT id AS "番号", name AS "名前" FROM people;

SELECT * FROM people WHERE id=3;

SELECT * FROM people WHERE id>2;

UPDATE people SET birth_day="1200-01-02",name="";

SELECT * FROM people;

UPDATE people SET name="Taro", birth_day="2003-04-27" WHERE id=3;

UPDATE people SET name="Joro", birth_day="2000-07-11" WHERE id>4;

DELETE FROM people WHERE id>4;

DELETE FROM people;

SHOW TABLES;

SELECT * FROM people;
------------------------------------------------------------
SHOW TABLES;

DESCRIBE people;

ALTER TABLE people ADD age INT AFTER name;

INSERT INTO people VALUES(1,"John",18, "2002-01-01");
INSERT INTO people VALUES(2,"Alice",13, "2002-01-01");
INSERT INTO people VALUES(3,"Paul",38, "2002-01-01");
INSERT INTO people VALUES(4,"Chris",19, "2002-01-01");
INSERT INTO people VALUES(5,"Vette",49, "2002-01-01");
INSERT INTO people VALUES(6,"Tsuyoshi",41, "2002-01-01");

SELECT * FROM people;

SELECT * FROM people ORDER BY age;

SELECT * FROM people ORDER BY age DESC;

SELECT * FROM people ORDER BY name;

SELECT * FROM people ORDER BY birth_day DESC, name DESC, age ASC;

SELECT DISTINCT birth_day FROM people ORDER BY birth_day;

SELECT DISTINCT name, birth_day FROM people;

SELECT id, name, age FROM people LIMIT 3;

SELECT * FROM people LIMIT 3,2;

SELECT * FROM people LIMIT 2 OFFSET 2;
------------------------------------------------------------

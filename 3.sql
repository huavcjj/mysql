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
 
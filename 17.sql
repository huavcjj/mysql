CREATE TABLE messages (
	name_code CHAR(8),
	name VARCHAR(25),	
	message TEXT
);

INSERT INTO messages VALUES('00000001','Yoshida Miku','message');
INSERT INTO messages VALUES('00000002','Yamada Tarou','message');


-- INT

CREATE TABLE patients(
	id SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT, -- 0~65535
	name VARCHAR(50),
	age TINYINT UNSIGNED DEFAULT 0 -- 0 ~ 255
);

INSERT INTO patients(name, age) VALUES('Sachiko',34);

ALTER TABLE patients MODIFY id MEDIUMINT UNSIGNED AUTO_INCREMENT;

SHOW FULL COLUMNS FROM patients;



-- FLOAT DOUBLE 

ALTER TABLE patients ADD COLUMN (height FLOAT);
ALTER TABLE patients ADD COLUMN (weight FLOAT);

INSERT INTO patients(name,age,height,weight) VALUES('Taro',44,178.9,89.5);

SELECT * FROM patients;


CREATE TABLE tmp_float(
	num FLOAT
);

INSERT INTO tmp_float VALUES(123456789);

SELECT * FROM tmp_float; -- 123457000

CREATE TABLE tmp_double(
	num DOUBLE
);

INSERT INTO tmp_double VALUES(123456789);

INSERT INTO tmp_double VALUES(123456789.123456789);

SELECT * FROM tmp_double;


-- DECIMAL

ALTER TABLE patients ADD COLUMN score DECIMAL(7,3);

SELECT * FROM patients;

INSERT INTO patients(name,age,score) VALUES('Jiro',54,98.345);


CREATE TABLE tmp_decimal(
	num_float FLOAT,
	num_double DOUBLE,
	num_decimal DECIMAL(20,10)
);

INSERT INTO tmp_decimal VALUES(1111111111.8888888888,1111111111.8888888888,1111111111.8888888888);

SELECT * FROM tmp_decimal;


-- BOOLEAN

CREATE TABLE managers(
	id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(50),
	is_superuser BOOLEAN
);

INSERT INTO managers(name,is_superuser) VALUES('Mike',true);
INSERT INTO managers(name,is_superuser) VALUES('Rola',false);

SELECT * FROM managers WHERE is_superuser = false;

-- DATE TIME

CREATE TABLE alarms (
	id INT PRIMARY KEY AUTO_INCREMENT,
	alarm_day DATE,
	alarm_time TIME,
	create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

SELECT CURRENT_TIMESTAMP, NOW(), CURRENT_DATE, CURRENT_TIME;


INSERT INTO alarms(alarm_day, alarm_time) VALUES('2019-01-01','19:20:19');
INSERT INTO alarms(alarm_day, alarm_time) VALUES('2023-01-01','23:30:19');
SELECT * FROM alarms;

UPDATE alarms SET alarm_time = CURRENT_TIME WHERE id = 1;


-- DATETIME, TIMESTAMP
CREATE TABLE tmp_datetime_timestamp(
	val_datetime DATETIME,
	val_timestamp TIMESTAMP,
	val_datetime_3 DATETIME(3),
	val_timestamp_3 TIMESTAMP(3)
);

INSERT INTO tmp_datetime_timestamp
VALUES (CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);

SELECT * FROM tmp_datetime_timestamp;
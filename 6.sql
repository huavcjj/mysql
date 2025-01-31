SELECT DATABASE();

SHOW TABLES;

SELECT IF(10 < 20, "A", "B");

SELECT 
    *, 
    IF(birth_place = "日本", "日本人", "その他") AS "国籍" 
FROM users;

SELECT 
    name, 
    age, 
    IF(age < 20, "未成年", "成人") AS "年齢区分"
FROM users;

SELECT 
    *, 
    IF(class_no = 6 AND height > 170, "6組の170cm以上の人", "その他") AS "分類"
FROM students;

SELECT 
    name, 
    IF(name LIKE "%田%", "名前に田を含む", "その他") AS "name_check"
FROM users;
------------------------------------------------------------

SELECT * FROM users;

SELECT 
    *, 
    CASE 
        WHEN birth_place = "日本" THEN "日本人"
        ELSE "外国人"
    END AS "国籍"
FROM users
WHERE age > 30;


SELECT * FROM prefectures;

SELECT 
    name,
    CASE 
        WHEN name IN ("香川県", "愛媛県", "徳島県", "高知県") THEN "四国"
        ELSE "その他"
    END AS "地域"
FROM prefectures;

SELECT 
	*,
	CASE
		WHEN student_id % 3 = 0 THEN test_score_1
		WHEN student_id % 3 = 1 THEN test_score_2
		WHEN student_id % 3 = 2 THEN test_score_3
	END AS score
FROM tests_score;
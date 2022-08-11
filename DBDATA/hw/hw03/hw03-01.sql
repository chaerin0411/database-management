-- (hw03-01.sql)

-- R(name, dept, gender)
-- S(name, dept, gender)
-- V(name, category, c_name, year, buy_date)

USE hwdb;

drop table if exists R;
drop table if exists S;
drop table if exists V;

-- 1번
/* 예제1 릴레이션 R, S */

/* 사원 테이블  R 생성 */
-- R(name, dept, gender)
CREATE TABLE R ( 
   name   CHAR(9) NOT NULL ,
   dept    CHAR(2),
   gender CHAR(1)
);

/* 사원 테이블  S 생성 */
-- S(name, dept, gender)
CREATE TABLE S ( 
   name   CHAR(9) NOT NULL ,
   dept    CHAR(2),
   gender CHAR(1)
);

-- 데이터 입력
-- R(name, dept, gender)
INSERT INTO R (name, dept, gender) VALUES ( '홍길동', 'AA', 'M');
INSERT INTO R (name, dept, gender) VALUES ( '임꺽정', 'AA', 'M');

-- S(name, dept, gender)
INSERT INTO S (name, dept, gender) VALUES ( '홍길동', 'AA', 'M');
INSERT INTO S (name, dept, gender) VALUES ( '박찬호', 'BB', 'M');
INSERT INTO S (name, dept, gender) VALUES ( '박세리', 'BB', 'F');

/* 예제2 릴레이션 V */
-- 테이블 생성
-- V(name, category, c_name, year, buy_date)
CREATE TABLE V ( 
   name      CHAR(9)       NOT NULL,
   category  VARCHAR(15), 
   c_name    VARCHAR(12),
   year        CHAR(4), 
   buy_date  CHAR(7) 
);

-- 데이터 입력
-- V(name, category, c_name, year, buy_date)
INSERT INTO V VALUES ('임꺽정','트럭','포토','1995','1997-05');
INSERT INTO V VALUES ('차범근','승용차','에쿠스','2001','2001-08');
INSERT INTO V VALUES ('홍길동','승용차','소나타','1998','1998-08');
INSERT INTO V VALUES ('박세리','승용차','싼타페','1999','1999-12');

-- 01
-- Quiz1
-- 1)
SELECT * FROM R
INTERSECT
SELECT * FROM S;

-- 2)
SELECT * FROM R
UNION
SELECT * FROM S;

-- 3)
SELECT * FROM R
MINUS
SELECT * FROM S;

-- 4)
SELECT *
FROM S
WHERE dept = 'BB';

-- 5)
SELECT gender
FROM S;

-- 6)
SELECT name, dept
FROM R
WHERE name = '홍길동';

-- Quiz2
-- 1)
SELECT name, C_name, year
FROM V;

-- 2)
SELECT DISTINCT category
FROM V;

-- 3)
SELECT *
FROM V
WHERE year > 1998;

-- 4)
SELECT *
FROM V
WHERE year >= 1998;

-- 5)
SELECT *
FROM V
WHERE year >= 1998 AND c_name = '소나타';
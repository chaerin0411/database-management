/* 조인 실습용  */

drop table if exists freshman;
drop table if exists dmember;


CREATE TABLE freshman ( 
 name    VARCHAR(12) NOT NULL ,
 address VARCHAR(9)
);

CREATE TABLE dmember ( 
 name      VARCHAR(12) NOT NULL ,
 dept_name VARCHAR(30)
);


INSERT INTO freshman VALUES('김광식', '서울');
INSERT INTO freshman VALUES('김현정', '대전');
INSERT INTO freshman VALUES('조영수', '대전');
INSERT INTO dmember VALUES('김광식', '컴퓨터공학과');
INSERT INTO dmember VALUES('김현정', '산업공학과');
INSERT INTO dmember VALUES('이진영', '전자공학과');


SELECT * FROM freshman;
SELECT * FROM dmember;

-- 동등조인
SELECT	F.name, address, dept_name
FROM	freshman as F, dmember as D
WHERE	F.name = D.name;

-- 동등조인(결과는 위와 같음)
SELECT	F.name, address, dept_name
FROM	freshman F INNER JOIN dmember D
ON		F.name = D.name;

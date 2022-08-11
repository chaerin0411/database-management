-- (ehan_ch2_outerjoin.sql)

-- freshman(name, address)
-- dmember(name, dept_name)

-- 테이블 삭제
drop table freshman;
drop table dmember;

-- 테이블 생성
-- freshman(name, address)
CREATE TABLE freshman ( 
	name VARCHAR(12) NOT NULL ,
	address VARCHAR(9)
);

-- dmember(name, dept_name)
CREATE TABLE dmember ( 
	name VARCHAR(12) NOT NULL ,
	dept_name VARCHAR(30)
);

-- 데이터 입력
-- freshman(name, address)
INSERT INTO freshman VALUES('김광식', '서울');
INSERT INTO freshman VALUES('김현정', '대전');
INSERT INTO freshman VALUES('조영수', '대전');

-- dmember(name, dept_name)
INSERT INTO dmember VALUES('김광식', '컴퓨터공학과');
INSERT INTO dmember VALUES('김현정', '산업공학과');
INSERT INTO dmember VALUES('이진영', '전자공학과');

-- 데이터 검색
SELECT * FROM freshman;
SELECT * FROM dmember;
-- (outerjoin02.sql)

-- emp(ename, pno)
-- project(pno, pname)

-- 테이블 삭제
drop table emp;
drop table project;

-- 테이블 생성
-- emp(ename, pno)
CREATE TABLE emp ( 
	ename VARCHAR(12) NOT NULL ,
    pno int
);

-- project(pno, pname)
CREATE TABLE project ( 
	pno int NOT NULL ,
    pname VARCHAR(20)
);

-- 데이터 입력
-- emp(ename, pno)
INSERT INTO emp VALUES('홍길동', 101);
INSERT INTO emp VALUES('임꺽정', 102);
INSERT INTO emp VALUES('박찬호', 101);
INSERT INTO emp VALUES('박찬호', 103);
INSERT INTO emp VALUES('신동엽', NULL);

-- project(pno, pname)
INSERT INTO project VALUES(101, '작전중');
INSERT INTO project VALUES(102, '특공대');
INSERT INTO project VALUES(103, '유레카');
INSERT INTO project VALUES(104, '다모여');

-- 데이터 검색
SELECT * FROM emp;
SELECT * FROM project;
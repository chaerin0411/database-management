drop table if exists emp;
drop table if exists project;


CREATE TABLE emp ( 
ename VARCHAR(12) NOT NULL ,
pno int
);


CREATE TABLE project ( 
pno int NOT NULL ,
pname VARCHAR(20)
);


INSERT INTO emp VALUES('홍길동', 101);
INSERT INTO emp VALUES('임꺽정', 102);
INSERT INTO emp VALUES('박찬호', 101);
INSERT INTO emp VALUES('박찬호', 103);
INSERT INTO emp VALUES('신동엽', NULL);


INSERT INTO project VALUES(101, '작전중');
INSERT INTO project VALUES(102, '특공대');
INSERT INTO project VALUES(103, '유레카');
INSERT INTO project VALUES(104, '다모여');


SELECT * FROM emp;
SELECT * FROM project;

-- 왼쪽 외부조인
SELECT	*
FROM	emp E LEFT OUTER JOIN project P
ON		E.pno = P.pno;

-- 오른쪽 외부조인
SELECT	*
FROM	emp E RIGHT OUTER JOIN project P
ON		E.pno = P.pno;

-- 완전 외부조인
-- MySQL에서는 문법 지원하지 않음

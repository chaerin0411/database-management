-- (self_mysql01.sql)

-- deptself(deptno,dname,college,loc)

-- 테이블 생성
-- deptself(deptno,dname,college,loc)
CREATE TABLE deptself (
	deptno char(3) NOT NULL, 
	dname varchar(30) NOT NULL,
	college char(3),
	loc varchar(7),
	CONSTRAINT dept_no_pk PRIMARY KEY(deptno)
);

-- 데이터 입력
-- deptself(deptno,dname,college,loc)
insert into deptself values ('101', '컴퓨터공학과', '100', '1호관');
insert into deptself values ('102', '멀티미디어학과', '100', '2호관');
insert into deptself values ('201', '전자공학과', '200', '3호관');
insert into deptself values ('202', '기계공학과', '200', '4호관');
insert into deptself values ('100', '정보미디어학부', '10', NULL);insert into deptself values ('200', '메카트로닉스학부', '10', NULL);
insert into deptself values ('10', '공과대학', NULL, NULL);

-- 데이터 검색
select * from deptself;

-- [자체조인 2]
-- deptself(deptno,dname,college,loc)
-- 학부이름, 학과이름
select A.dname as '학부이름', B.dname as '학과이름'
from deptself A, deptself B
where A.deptno = B.college
order by A.dname asc;

-- (quiz6-lectDB-SELECT-subquery.sql)

/*
ANY 서브쿼리의 여러 개의 결과 중 한가지만 만족해도 되며
ALL 서브쿼리의 여러 개의 결과를 모두 만족시켜야 된다
SOME은 ANY 와 동일한 의미
IN 는 =ANY 와 동일, NOT IN 은 <>ALL 과 동일
*/

-- stu(sno, sname, dept, sage)
-- pro(pno, pname, dept, page)

-- 테이블 생성
-- pro(pno, pname, dept, page)
CREATE TABLE pro (
	pno char(2),
	pname varchar(20), 
	dept varchar(20),
	page int,
	primary key(pno)
);

-- stu(sno, sname, dept, sage)
CREATE TABLE stu (
	sno char(2),
	sname varchar(20), 
	dept varchar(20),
	sage int,
	primary key(sno)
);

-- 데이터 입력
-- pro(pno, pname, dept, page)
insert into pro values('p1','이정무','컴퓨터',36);
insert into pro values('p2','우태하','컴퓨터',32);
insert into pro values('p3','이성민','건축',45);

-- stu(sno, sname, dept, sage)
insert into stu values('s1','유준호','컴퓨터',23);
insert into stu values('s2','오정민','컴퓨터',34);
insert into stu values('s3','이태현','건축',22);
insert into stu values('s4','신현주','건축',21);

-- 데이터 검색
select * from pro;
select * from stu;

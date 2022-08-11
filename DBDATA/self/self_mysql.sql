-- (self_mysql.sql)

/* 자체조인 */
-- (MySQL)
-- selfemp(empno,empname,manager,dno)

-- 데이터베이스 생성
create database week13db
default character set utf8;
use week13db;

-- 테이블 삭제
drop table selfemp;

-- 테이블 생성
-- selfemp(empno,empname,manager,dno)
create table selfemp (
	empno char(4) PRIMARY KEY ,
	empname varchar(12) ,
	manager char(4) ,
	dno char(1) ,
	FOREIGN KEY (manager) REFERENCES selfemp(empno)
);

-- 데이터 입력
-- selfemp(empno,empname,manager,dno)
insert into selfemp values('3011','이수민',NULL,'1');
insert into selfemp values('3426','박영권','3011','3');
insert into selfemp values('1003','조민희','3011','1');
insert into selfemp values('2106','김창섭','3426','2');
insert into selfemp values('3427','최종철','2106','3');

-- 데이터 검색
select * from selfemp;

-- [자체조인 1]
-- selfemp(empno,empname,manager,dno)
-- 사원명, 관리자이름 을 검색하라
select E.empname as '사원명', M.empname as '관리자이름'
from selfemp E, selfemp M
where E.manager = M.empno;

select E.empname as '사원명', M.empname as '관리자이름'
from selfemp E left outer join selfemp M
on E.manager = M.empno;
-- (ex08-09.sql)

--dept(deptid, dname, budget) 
--emp(empid, ename, deptid, hire_date, job, manager, salary)

-- 테이블 삭제
drop table emp;
drop table dept;

-- 테이블 생성
--dept(deptid, dname, budget) 
create table dept (
    deptid char(3) not null ,
    dname varchar(10) ,
    budget int ,
    primary key(deptid)
);

--emp(empid, ename, deptid, hire_date, job, manager, salary)
create table emp (
    empid char(4) not null ,
    ename varchar(20) ,
    deptid char(4) ,
    hire_date varchar(20) ,
    job varchar(20) ,
    manager char(4) ,
    salary int ,
    primary key(empid) ,
    foreign key(deptid) references dept(deptid)
);

-- 데이터 삽입
--dept(deptid, dname, budget) 
insert into dept values('100', '영업부', 100);
insert into dept values('200', '관리부', 300);
insert into dept values('300', '구매부', 220);
insert into dept values('400', '생산부', 500);

--emp(empid, ename, deptid, hire_date, job, manager, salary)
insert into emp values('1001', '홍성길', '100', '2001.2.1', '특수영업', '1002', 350);
insert into emp values('1002', '곽희준', '100', '1999.1.1', '영업관리', '1004', 400);
insert into emp values('1003', '김동준', '200', '2000.9.1', '품질관리', '1005', 300);
insert into emp values('1004', '성재규', '300', '1997.2.1', '급여', '1009', 450);
insert into emp values('1005', '박성범', '200', '2000.2.1', '수입자재', '1004', 320);

-- 데이터 검색
select * from dept;
select * from emp;

-- 1-7) 다음 SQL문제를 풀이 하시오 (SQL 문제 답안 작성)
-- 8) 담당업무가 ‘영업관리’ 인 사원의 모든 정보를 검색하라
select *
from emp
where jog = '영업관리';

-- 9) 급여가 400 이상인 사원 이름과 그 사원이 속한 부서이름을 검색하라
select ename, dname
from emp, dept
where emp.deptid = dept.dpetid;

-- 10) ‘영업부’ 와’구매부’ 사원의 급여 합계를 검색하라
select dname, sum(salary)
from dept
where dname in ('영업부', '구매부')
group by dname;

-- 11) 가장 급여를 많이 받는 사원과 가장 적게 받는 사원의 급여액 차이는 얼마인지 검색하라
select max(salary) - min(salary) as "차액 급여"
from emp;

-- 12) ‘영업’ 사원 중 급여가 380 이상인 사원 이름, 담당업무, 급여액을 검색하라
select ename, job, salary
from emp
where ename = '영업부';

-- 13) ‘성재규’ 사원의 소속 부서이름을 검색하라
select dname
from dept, emp
where dept.deptid = emp.deptid
and ename = '성재규';

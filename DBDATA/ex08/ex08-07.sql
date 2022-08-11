-- (ex08-07.sql)

--dept(deptid, dname, budget)
--emp(empid, ename, deptid, hire_date, job, salary)

-- 테이블 삭제
drop table emp;
drop table dept;?

-- 데이터 삽입
--dept(deptid, dname, budget)
INSERT INTO dept VALUES(100,'영업부',100);
INSERT INTO dept VALUES(200,'관리부',300);
INSERT INTO dept VALUES(300,'구매부',220);
INSERT INTO dept VALUES(400,'생산부',500);

--emp(empid, ename, deptid, hire_date, job, salary)
INSERT INTO emp VALUES(1001,'홍성길',100,'2001-02-01','특수영업',350);
INSERT INTO emp VALUES(1002,'곽희준',100,'1999-01-01','영업관리',400);
INSERT INTO emp VALUES(1003,'김동준',200,'2000-09-01','품질관리',300);
INSERT INTO emp VALUES(1004,'성재규',300,'1997-02-01','급여',450);
INSERT INTO emp VALUES(1005,'박성범',200,'2000-02-01','수입자재',320);

-- 데이터 조회
select * from dept;
select * from emp;

--(실습) SELECT
--dept(deptid, dname, budget)
--emp(empid, ename, deptid, hire_date, job, salary)

--1) 사원에 대한 모든 정보를 보이시오
select *
from emp;

--2) 곽희준 사원의 담당업무는 무엇인가?
select job
form emp
where ename = '곽희준';

--3) 급여가 300을 넘고 담당업무가 영업관리인 사원의 모든 정보를 보이시오
select *
from emp
where salary > 300
and job = '영업관리';

--4) 모든 사원의 이름과 급여를 보이되 사원 이름을 가나다순으로 보이시오
select ename, salary
from emp
order by ename asc;

--5) 부서번호와 그 부서에 속한 사원들의 급여액 합계를 보이시오
select deptid, sum(salary)
from dept, emp
where dept.deptid = emp.deptid;

--6) 가장 많은 급여를 받는 사원의 급여액과 가장 적은 급여를 받는 사원의 급여액을 보이시오
select max(salary) as 최고급여 min(salary) as 최저급여
from emp;

--7) 가장 많은 급여를 받는 사원의 이름을 보이시오
select ename
from emp
where salary = (select max(salary)
                from emp);

--8) 사원들의 현재 급여와 급여를 10% 인상했을 때의 예상 급여를 보이시오
select salary as 현재급여, salary *1.1 as 10% 인산된 급여
from emp;

--9) 모든 사원들의 이름과 부서이름을 보이시오
select ename, dname
from dept, emp
where dept.deptid = emp.depid;

--10) 곽희준 사원이 속한 부서의 예산은 얼마인가?
select budget
from dept
where dname = (select dname
               from emp
               where ename = '곽희준');
?
--(실습) INSERT
INSERT INTO emp(empid, ename, deptid, hire_date, job, salary) VALUES(1006,'강윤호',200,'2001-01-10','연말정산',400);
INSERT INTO emp(empid, ename, deptid, salary) VALUES(1007,'남진선','200',500);
INSERT INTO emp(empid, ename, deptid, salary) VALUES(200,'홍성길','200',300);

select * from dept;
select * from emp;

--(실습) UPDATE
--dept(deptid, dname, budget)
--emp(empid, ename, deptid, hire_date, job, salary)

--홍성길 사원의 부서번호를 400으로, 급여를 500으로 변경하시오
update emp
set deptid = '400' 
and salary = '500'
from ename = '홍성길';

--영업부에 속한 사원의 급여를 20% 인상하시오
update emp
set salary = salary*1.2
where dname = '영업부';

--(실습) DELETE
--dept(deptid, dname, budget)
--emp(empid, ename, deptid, hire_date, job, salary)



--홍성길 사원의 정보를 사원 정보에서 삭제하시오
delete
from emp
where ename = '홍성길';

--모든 사원의 정보를 사원 정보에서 삭제하시오
delete *
from emp;

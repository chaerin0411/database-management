/* =================================================== */
-- 조인/하위질의 실습용
/* =================================================== */

/* (quiz-booksr_deptemp-select-mysql) */

/* department(deptno, deptname, floor) */
/* employee(empno, empname, title, manager, salary, dno) */

drop table if exists employee;
drop table if exists department;

CREATE TABLE department (
deptno int NOT NULL,
deptname varchar(10),
floor int,
PRIMARY KEY(deptno)
);

INSERT INTO department VALUES(1, '영업', 8);
INSERT INTO department VALUES(2, '기획', 10);
INSERT INTO department VALUES(3, '개발', 9);
INSERT INTO department VALUES(4, '총무', 7);

CREATE TABLE employee (
empno int NOT NULL,
empname varchar(10) UNIQUE,
title varchar(10) DEFAULT '사원',
manager int,
salary int ,
dno int ,
PRIMARY KEY(empno),
FOREIGN KEY(dno) REFERENCES department(deptno)
);

INSERT INTO employee VALUES(2106, '김창섭','대리',1003, 2500000, 2);
INSERT INTO employee VALUES(3426, '박영권','과장',4377, 3000000, 1);
INSERT INTO employee VALUES(3011, '이수민','부장',4377, 4000000, 3);
INSERT INTO employee VALUES(1003, '조민희','과장',4377, 3000000, 2);
INSERT INTO employee VALUES(3427, '최종철','사원',3011, 1500000, 3);
INSERT INTO employee VALUES(1365, '김상원','사원',3426, 1500000, 1);
INSERT INTO employee(empno, empname, title, salary, dno) VALUES(4377, '이성래','이사', 5000000, 2);

select * from department;
select * from employee;

-- --------------------------
/* department(deptno, deptname, floor) */
/* employee(empno, empname, title, manager, salary, dno) */

-- [하위질의] 
-- 17) 사원의 이름과 이 사원이 속한 부서이름을 검색하라 (조인)
select	empname 사원이름, deptname 부서이름
from	employee E, department D
where	E.dno = D.deptno;

-- 19) 사원에 대해 부서이름, 사원이름, 직급, 급여를 검색하라
-- 	   부서이름에 대해 오름차순, 부서이름이 같을 경우에는 salary에 대해서 내림차수능로 정렬
select	deptname 부서이름, empname 사원이름, title 직급, salary 급여
from	department D, employee E
where	D.deptno = E.dno
order by deptname ASC, salary DESC;

-- 20) 박영권과 같은 직급을 갖는 모든 사원들의 이름과 직급을 검색하라
select	empname 이름, title 직급
from	employee
where	title=(
	select	title
    from	employee
    where	empname='박영권'
);

-- 21) 영업부나 개발부에 근무하는 사원들의 이름을 검색하라(IN 사용)
select	empname
from	employee
where	dno in (
	select	deptno
    from	department
    where	deptname in ('영업', '개발')
);

select	empname
from	employee, department
where	employee.dno = department.deptno
	AND (deptname = '영업' OR deptname = '개발');

-- 22) 영업부나 개발부에 근무하는 사원들의 이름을 검색하라(EXISTS 사용)
select	empname
from	employee E
where	EXISTS (
	select	*
    from	department D
    where	E.dno = D.deptno
		AND deptname in ('영업', '개발')
);

-- 24) 직원이 한 명도 없는 부서의 이름을 검색하라(NOT EXISTS 사용)
select	deptname
from	department D
where	NOT EXISTS (
	select	*
	from	employee E
	where	D.deptno = E.dno
);

-- [추가문제]
-- 영업부나 개발부에 근무하지 않는 사원들의 이름을 검색하라(NOT IN 사용)
select	empname
from	employee
where	dno NOT in (
	select	deptno
    from	department
    where	deptname in ('영업', '개발')
);
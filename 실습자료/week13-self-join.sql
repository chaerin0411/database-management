/* 자체조인 */
drop table if exists selfemp;

-- selfemp(empno,empname,manager,dno)

create table selfemp (
empno char(4) PRIMARY KEY ,
empname varchar(12) ,
manager char(4) ,
dno char(1) ,
FOREIGN KEY (manager) REFERENCES selfemp(empno)
);

/* NULL값을 먼저 입력, 상위계층부터 입력해야 함 */
insert into selfemp values('3011','이수민',NULL,'1');
insert into selfemp values('3426','박영권','3011','3');
insert into selfemp values('1003','조민희','3011','1');
insert into selfemp values('2106','김창섭','3426','2');
insert into selfemp values('3427','최종철','2106','3');

/* 기본키를 기준으로 정렬됨 */
select * from selfemp;

-- selfemp(empno,empname,manager,dno)
-- 사원명, 관리자이름을 검색하라(내부조인)
select	E.empname as 사원명, M.empname as 관리자이름
from	selfemp E, selfemp M
where	E.manager = M.empno;

-- 사원명, 관리자이름을 검색하라(외부조인)
select	E.empname as 사원명, M.empname as 관리자이름
from	selfemp E LEFT OUTER JOIN selfemp M
on		E.manager = M.empno;

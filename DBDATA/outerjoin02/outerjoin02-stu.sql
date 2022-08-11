-- (outerjoin02-stu.sql)

-- emp(ename, pno)
-- project(pno, pname)

select *
from emp, project
where emp.pno = project.pno;

select *
from emp E, project P
where E.pno = P.pno;

select *
from emp E inner join project P
on E.pno = P.pno;

select *
from emp E left outer join project P
on E.pno = P.pno;

select *
from emp left outer join project
on emp.pno = project.pno;

select *
from emp E right outer join project P
on E.pno = P.pno;
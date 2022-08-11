-- (ex08-07.sql)

--dept(deptid, dname, budget)
--emp(empid, ename, deptid, hire_date, job, salary)

-- ���̺� ����
drop table emp;
drop table dept;?

-- ������ ����
--dept(deptid, dname, budget)
INSERT INTO dept VALUES(100,'������',100);
INSERT INTO dept VALUES(200,'������',300);
INSERT INTO dept VALUES(300,'���ź�',220);
INSERT INTO dept VALUES(400,'�����',500);

--emp(empid, ename, deptid, hire_date, job, salary)
INSERT INTO emp VALUES(1001,'ȫ����',100,'2001-02-01','Ư������',350);
INSERT INTO emp VALUES(1002,'������',100,'1999-01-01','��������',400);
INSERT INTO emp VALUES(1003,'�赿��',200,'2000-09-01','ǰ������',300);
INSERT INTO emp VALUES(1004,'�����',300,'1997-02-01','�޿�',450);
INSERT INTO emp VALUES(1005,'�ڼ���',200,'2000-02-01','��������',320);

-- ������ ��ȸ
select * from dept;
select * from emp;

--(�ǽ�) SELECT
--dept(deptid, dname, budget)
--emp(empid, ename, deptid, hire_date, job, salary)

--1) ����� ���� ��� ������ ���̽ÿ�
select *
from emp;

--2) ������ ����� �������� �����ΰ�?
select job
form emp
where ename = '������';

--3) �޿��� 300�� �Ѱ� �������� ���������� ����� ��� ������ ���̽ÿ�
select *
from emp
where salary > 300
and job = '��������';

--4) ��� ����� �̸��� �޿��� ���̵� ��� �̸��� �����ټ����� ���̽ÿ�
select ename, salary
from emp
order by ename asc;

--5) �μ���ȣ�� �� �μ��� ���� ������� �޿��� �հ踦 ���̽ÿ�
select deptid, sum(salary)
from dept, emp
where dept.deptid = emp.deptid;

--6) ���� ���� �޿��� �޴� ����� �޿��װ� ���� ���� �޿��� �޴� ����� �޿����� ���̽ÿ�
select max(salary) as �ְ�޿� min(salary) as �����޿�
from emp;

--7) ���� ���� �޿��� �޴� ����� �̸��� ���̽ÿ�
select ename
from emp
where salary = (select max(salary)
                from emp);

--8) ������� ���� �޿��� �޿��� 10% �λ����� ���� ���� �޿��� ���̽ÿ�
select salary as ����޿�, salary *1.1 as 10% �λ�� �޿�
from emp;

--9) ��� ������� �̸��� �μ��̸��� ���̽ÿ�
select ename, dname
from dept, emp
where dept.deptid = emp.depid;

--10) ������ ����� ���� �μ��� ������ ���ΰ�?
select budget
from dept
where dname = (select dname
               from emp
               where ename = '������');
?
--(�ǽ�) INSERT
INSERT INTO emp(empid, ename, deptid, hire_date, job, salary) VALUES(1006,'����ȣ',200,'2001-01-10','��������',400);
INSERT INTO emp(empid, ename, deptid, salary) VALUES(1007,'������','200',500);
INSERT INTO emp(empid, ename, deptid, salary) VALUES(200,'ȫ����','200',300);

select * from dept;
select * from emp;

--(�ǽ�) UPDATE
--dept(deptid, dname, budget)
--emp(empid, ename, deptid, hire_date, job, salary)

--ȫ���� ����� �μ���ȣ�� 400����, �޿��� 500���� �����Ͻÿ�
update emp
set deptid = '400' 
and salary = '500'
from ename = 'ȫ����';

--�����ο� ���� ����� �޿��� 20% �λ��Ͻÿ�
update emp
set salary = salary*1.2
where dname = '������';

--(�ǽ�) DELETE
--dept(deptid, dname, budget)
--emp(empid, ename, deptid, hire_date, job, salary)



--ȫ���� ����� ������ ��� �������� �����Ͻÿ�
delete
from emp
where ename = 'ȫ����';

--��� ����� ������ ��� �������� �����Ͻÿ�
delete *
from emp;

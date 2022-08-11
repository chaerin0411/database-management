-- (ex08-09.sql)

--dept(deptid, dname, budget) 
--emp(empid, ename, deptid, hire_date, job, manager, salary)

-- ���̺� ����
drop table emp;
drop table dept;

-- ���̺� ����
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

-- ������ ����
--dept(deptid, dname, budget) 
insert into dept values('100', '������', 100);
insert into dept values('200', '������', 300);
insert into dept values('300', '���ź�', 220);
insert into dept values('400', '�����', 500);

--emp(empid, ename, deptid, hire_date, job, manager, salary)
insert into emp values('1001', 'ȫ����', '100', '2001.2.1', 'Ư������', '1002', 350);
insert into emp values('1002', '������', '100', '1999.1.1', '��������', '1004', 400);
insert into emp values('1003', '�赿��', '200', '2000.9.1', 'ǰ������', '1005', 300);
insert into emp values('1004', '�����', '300', '1997.2.1', '�޿�', '1009', 450);
insert into emp values('1005', '�ڼ���', '200', '2000.2.1', '��������', '1004', 320);

-- ������ �˻�
select * from dept;
select * from emp;

-- 1-7) ���� SQL������ Ǯ�� �Ͻÿ� (SQL ���� ��� �ۼ�)
-- 8) �������� ������������ �� ����� ��� ������ �˻��϶�
select *
from emp
where jog = '��������';

-- 9) �޿��� 400 �̻��� ��� �̸��� �� ����� ���� �μ��̸��� �˻��϶�
select ename, dname
from emp, dept
where emp.deptid = dept.dpetid;

-- 10) �������Ρ� �͡����źΡ� ����� �޿� �հ踦 �˻��϶�
select dname, sum(salary)
from dept
where dname in ('������', '���ź�')
group by dname;

-- 11) ���� �޿��� ���� �޴� ����� ���� ���� �޴� ����� �޿��� ���̴� ������ �˻��϶�
select max(salary) - min(salary) as "���� �޿�"
from emp;

-- 12) �������� ��� �� �޿��� 380 �̻��� ��� �̸�, ������, �޿����� �˻��϶�
select ename, job, salary
from emp
where ename = '������';

-- 13) ������ԡ� ����� �Ҽ� �μ��̸��� �˻��϶�
select dname
from dept, emp
where dept.deptid = emp.deptid
and ename = '�����';

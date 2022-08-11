--(ex08-02.sql)

-- view
-- emp(empid,ename,dept,hire_date,birthdaty.address,job,salary)

-- ���̺� ����
drop table emp;

-- ���̺� ����
-- emp(empid,ename,dept,hire_date,birthdaty.address,job,salary)
CREATE TABLE EMP ( 
    empid int NOT NULL ,
    ename char(20) ,
    dept varchar(9) ,
    hire_date char(10) ,
    birthday char(10) ,
    Address varchar(30) ,
    job char(20) ,
    salary int ,
    PRIMARY KEY(empid)
);

-- ������ ����
-- emp(empid,ename,dept,hire_date,birthdaty.address,job,salary)
INSERT INTO emp VALUES(1001,'ȫ����','������','2001-02-01','1985-10-12','���� �븲��','Ư������',350);
INSERT INTO emp VALUES(1002,'������','������','1999-01-01','1984-09-10','�Ⱦ� �����','��������',400);
INSERT INTO emp VALUES(1003,'�赿��','�����','2000-09-01','1986-05-16','�λ� ���ϵ�','ǰ������',300);
INSERT INTO emp VALUES(1004,'�����','�λ��','1997-02-01','1982-04-10','�뱸 �޼���','�޿�',450);
INSERT INTO emp VALUES(1005,'�ڼ���','���ź�','2000-02-01','1986-12-04','���� �ݳ���','��������',320);

-- ������ ��ȸ
select * from emp;

-- �� ����
CREATE VIEW view_emp1
as
SELECT empid, ename, hire_date, salary
FROM emp;

-- �� ��ȸ
select * from view_emp1; 

-- ���̺� ��ȸ
select * from emp;

-- �� �Է�
-- view_emp1(empid,ename,hire_date,salary)
insert into view_emp1 values('9999', '�躹��', '2020-03-16', 500);

-- �� ��ȸ
select * from view_emp1; 

-- ���̺� ��ȸ
select * from emp;

select *
from view_emp1
where empid = '9999';

select empid, ename, hire_date, salary
from emp
where empid = '9999';

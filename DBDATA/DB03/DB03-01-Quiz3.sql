-- (DB03-01-Quiz3.sql)
--dept(deptid, dname, budget)
--emp(empid, ename, deptid, hire_date, job, salary)

-- ���̺� ����
--dept(deptid, dname, budget)
CREATE TABLE dept
(
	deptid               CHAR(18) NOT NULL ,
	dname                VARCHAR(18) NULL ,
	budget               INT NULL ,
    PRIMARY KEY (deptid)
);

--emp(empid, ename, deptid, hire_date, job, salary)
CREATE TABLE emp
(
	empid                CHAR(18) NOT NULL ,
	ename                VARCHAR(18) NULL ,
    deptid               CHAR(18) NULL ,
	hire_date            CHAR(18) NULL ,
	job                  VARCHAR(18) NULL ,
	salary               INT NULL ,
    PRIMARY KEY (empid) ,
    FOREIGN KEY (deptid) references dept(deptid)
	 
);

-- ������ �Է�
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

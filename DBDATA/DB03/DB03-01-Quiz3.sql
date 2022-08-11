-- (DB03-01-Quiz3.sql)
--dept(deptid, dname, budget)
--emp(empid, ename, deptid, hire_date, job, salary)

-- 테이블 생성
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

-- 데이터 입력
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

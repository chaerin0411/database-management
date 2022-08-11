-- (quiz-booksr_deptemp-select.sql)

-- department(deptno, deptname, floor)
-- employee(empno, empname, title, manager, salary, dno)
-- 사원(직원코드,성명,직책,연봉)

use studydb;

-- 테이블 삭제
drop table if exists employee;
drop table if exists department;

-- 테이블 생성
-- department(deptno, deptname, floor)
CREATE TABLE department (
	deptno int NOT NULL,
	deptname varchar(10),
	floor int,
	PRIMARY KEY(deptno)
);

-- 데이터 입력
-- department(deptno, deptname, floor)
INSERT INTO department VALUES(1, '영업', 8);
INSERT INTO department VALUES(2, '기획', 10);
INSERT INTO department VALUES(3, '개발', 9);
INSERT INTO department VALUES(4, '총무', 7);

-- 테이블 생성
-- employee(empno, empname, title, manager, salary, dno)
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

-- 데이터 입력
-- employee(empno, empname, title, manager, salary, dno)
INSERT INTO employee VALUES(2106, '김창섭','대리',1003, 2500000, 2);
INSERT INTO employee VALUES(3426, '박영권','과장',4377, 3000000, 1);
INSERT INTO employee VALUES(3011, '이수민','부장',4377, 4000000, 3);
INSERT INTO employee VALUES(1003, '조민희','과장',4377, 3000000, 2);
INSERT INTO employee VALUES(3427, '최종철','사원',3011, 1500000, 3);
INSERT INTO employee VALUES(1365, '김상원','사원',3426, 1500000, 1);
INSERT INTO employee(empno, empname, title, salary, dno) VALUES(4377, '이성래','이사', 5000000, 2);

-- 테이블 생성
-- 사원(직원코드,성명,직책,연봉)
CREATE TABLE 사원 (

직원코드 int NOT NULL ,

성명 char(20) UNIQUE ,

직책 char(10) CHECK (직책 IN ('사원','대리','과장','팀장')),

연봉 int 

);

-- 데이터 입력
-- 사원(직원코드,성명,직책,연봉)
insert into 사원(직원코드,성명,직책,연봉) values(161353,'김미나','대리',2300);
insert into 사원(직원코드,성명,직책,연봉) values(181323,'최영락','사원',1900);
insert into 사원(직원코드,성명,직책,연봉) values(151453,'홍진호','과장',2800);
insert into 사원(직원코드,성명,직책,연봉) values(135485,'구준표','과장',3000);
insert into 사원(직원코드,성명,직책,연봉) values(104895,'강나래','팀장',3600);
insert into 사원(직원코드,성명,직책,연봉) values(165485,'김하늘','대리',2400);

-- 데이터 검색
select * from department;
select * from employee;
select * from 사원;
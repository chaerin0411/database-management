-- (ehan-mysql-stu.sql)

/* 학사 데이터베이스 스키마
-- department(dept_id, dept_name, office)
-- student(stu_id, resident_id, name, year, address, dept_id)
-- professor(prof_id, resident_id, name, dept_id, position, year_emp)
-- course(course_id, title, credit)
-- class(class_id, course_id, year, semester, division, prof_id, classroom, enroll)
-- takes(stu_id, class_id, grade)
*/

-- 스키마 생성(데이터베이스 생성)
CREATE SCHEMA `ehandb` DEFAULT CHARACTER SET utf8 ;

-- 사용할 데이터베이스 선택
USE ehandb;

-- 테이블 삭제
DROP TABLE if exists takes; 
DROP TABLE if exists class; 
DROP TABLE if exists professor; 
DROP TABLE if exists course; 
DROP TABLE if exists student;
DROP TABLE if exists department;

-- 테이블 생성
-- department(dept_id, dept_name, office)
CREATE TABLE department ( 
	dept_id varchar(10) NOT NULL ,
	dept_name varchar(20) NOT NULL ,
	office varchar(10) ,
	CONSTRAINT pk_department PRIMARY KEY(dept_id)
);

-- 데이터 입력
-- department(dept_id, dept_name, office)
insert into department values('920','컴퓨터공학과','201호');
insert into department values('923','산업공학과','207호');
insert into department values('925','전자공학과','308호');

-- 테이블 생성
-- student(stu_id, resident_id, name, year, address, dept_id)
CREATE TABLE student( 
	stu_id varchar(10) NOT NULL ,
	resident_id varchar(14) NOT NULL ,
	name varchar(12) NOT NULL ,
	year int ,
	address varchar(10) ,
	dept_id varchar(10) NOT NULL ,
	CONSTRAINT pk_student PRIMARY KEY(stu_id) ,
	CONSTRAINT fk_student FOREIGN KEY (dept_id) 
	REFERENCES department(dept_id)
);

-- 데이터 입력
-- student(stu_id, resident_id, name, year, address, dept_id)
insert into student values('1292001','900424-1825409','김광식',2,'서울','920');
insert into student values('1292002','900305-1730021','김정현',2,'서울','920');
insert into student values('1292003','891021-2308302','김현정',2,'대전','920');
insert into student values('1292301','890902-2704012','김현정',2,'대구','923');
insert into student values('1292303','910715-1524390','박광수',1,'광주','923');
insert into student values('1292305','921011-1809003','김우주',2,'부산','923');
insert into student values('1292501','900825-1506390','박철수',1,'대전','925');
insert into student values('1292502','911011-1809003','백태성',2,'서울','925');

-- 테이블 생성
-- professor(prof_id, resident_id, name, dept_id, position, year_emp)
CREATE TABLE professor( 
	prof_id varchar(10) NOT NULL ,
	resident_id varchar(14) NOT NULL ,
	name varchar(12) NOT NULL ,
	dept_id varchar(10) NOT NULL ,
	position varchar(10) ,
	year_emp int ,
	CONSTRAINT pk_professor PRIMARY KEY(prof_id) ,
	CONSTRAINT fk_professor FOREIGN KEY (dept_id) 
	REFERENCES department(dept_id)
);

-- 데이터 입력
-- professor(prof_id, resident_id, name, dept_id, position, year_emp)
insert into professor values('92001','590327-1839240','이태규','920','교수',1997);
insert into professor values('92002','690702-1350026','고희석','920','부교수',2003);
insert into professor values('92301','741011-2765501','최성희','923','부교수',2005);
insert into professor values('92302','750728-1102458','김태석','923','교수',1999);
insert into professor values('92501','620505-1400546','박철재','925','조교수',2007);
insert into professor values('92502','740101-1830264','장민석','925','부교수',2005);

-- 테이블 생성
-- course(course_id, title, credit)
CREATE TABLE course( 
	course_id varchar(10) NOT NULL ,
	title varchar(20) NOT NULL ,
	credit int ,
	CONSTRAINT pk_course PRIMARY KEY(course_id)
);

-- 데이터 입력
-- course(course_id, title, credit)
insert into course values('C101','전산개론',3);
insert into course values('C102','자료구조',3);
insert into course values('C103','데이터베이스',4);
insert into course values('C301','운영체제',3);
insert into course values('C302','컴퓨터구조',3);
insert into course values('C303','이산수학',4);
insert into course values('C304','객체지향언어',4);
insert into course values('C501','인공지능',3);
insert into course values('C502','알고리즘',2);

-- 테이블 생성
-- class(class_id, course_id, year, semester, division, prof_id, classroom, enroll)
CREATE TABLE class( 
	class_id varchar(10) NOT NULL ,
	course_id varchar(10) NOT NULL ,
	year int ,
	semester int ,
	division CHAR(1) ,
	prof_id varchar(10) NOT NULL ,
	classroom varchar(9) ,
	enroll int ,
	CONSTRAINT pk_class PRIMARY KEY(class_id) ,
	CONSTRAINT fk_class1 FOREIGN KEY (course_id) 
	REFERENCES course(course_id),
	CONSTRAINT fk_class2 FOREIGN KEY (prof_id) 
	REFERENCES professor(prof_id)
);

-- 데이터 입력
-- class(class_id, course_id, year, semester, division, prof_id, classroom, enroll)
insert into class values('C101-01','C101',2012,1,'A','92301','301호',40);
insert into class values('C102-01','C103',2012,1,'A','92001','209호',30);
insert into class values('C103-01','C103',2012,1,'A','92501','208호',30);
insert into class values('C103-02','C103',2012,1,'B','92301','301호',30);
insert into class values('C501-01','C501',2012,1,'A','92501','103호',45);
insert into class values('C501-02','C501',2012,1,'B','92502','204호',25);
insert into class values('C301-01','C301',2012,2,'A','92502','301호',30);
insert into class values('C302-01','C302',2012,2,'A','92501','209호',45);
insert into class values('C502-01','C502',2012,2,'A','92001','209호',30);
insert into class values('C502-02','C502',2012,2,'B','92301','103호',26);

-- 테이블 생성
-- takes(stu_id, class_id, grade)
CREATE TABLE takes( 
	stu_id varchar(10) NOT NULL ,
	class_id varchar(10) NOT NULL ,
	grade CHAR(5) ,
	CONSTRAINT pk_takes PRIMARY KEY(stu_id, class_id),
	CONSTRAINT fk_takes1 FOREIGN KEY (stu_id) 
	REFERENCES student(stu_id) ,
	CONSTRAINT fk_takes2 FOREIGN KEY (class_id) 
	REFERENCES class(class_id)
);

-- 데이터 입력
-- takes(stu_id, class_id, grade)
insert into takes values('1292001','C101-01','B+');
insert into takes values('1292001','C103-01','A+');
insert into takes values('1292001','C301-01','A');
insert into takes values('1292002','C102-01','A');
insert into takes values('1292002','C103-01','B+');
insert into takes values('1292002','C502-01','C+');
insert into takes values('1292003','C103-02','B');
insert into takes values('1292003','C501-02','A+');
insert into takes values('1292301','C102-01','C+');
insert into takes values('1292303','C102-01','C');
insert into takes values('1292303','C103-02','B+');
insert into takes values('1292303','C501-01','A+');

COMMIT;

-- 데이터 검색
select * from department;
select * from student;
select * from professor;
select * from course;
select * from class;
select * from takes;

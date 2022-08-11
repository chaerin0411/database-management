-- (ehan_ch4_deptstu-mysql.sql)

/*

department(dept_id, dept_name, office)

student(stu_id, resident_id, name, year, address, dept_id)

professor(prof_id, resident_id, name, dept_id, position, year_emp)

course(course_id, title, credit)

class(class_id, course_id, year, semester, division, prof_id, classroom, enroll)

takes(stu_id, class_id, grade)

*/

/*

   학과(학과번호, 학과명, 사무실위치)

   학생(학번, 주민등록번호, 학생명, 학년, 주소, 학과번호)

   교수(교수번호, 주민등록번호, 교수명, 소속학과, 직위, 임용년도)

   과목(과목번호, 과목명, 학점수)

   강좌(강좌번호, 과목번호, 연도, 학기, 분반, 담당교수, 강의실, 수강인원)

   수강(학번, 강좌번호, 성적)

*/

/*

department(dept_id, dept_name, office)

student(stu_id, resident_id, name, year, address, dept_id)

professor(prof_id, resident_id, name, dept_id, position, year_emp)

*/

-- department(dept_id, dept_name, office)
-- student(stu_id, resident_id, name, year, address, dept_id)
-- professor(prof_id, resident_id, name, dept_id, position, year_emp)

use hwdb;

DROP TABLE if exists professor; 
DROP TABLE if exists student;
DROP TABLE if exists department;
 -- 테이블 생성
 -- department(dept_id, dept_name, office)
CREATE TABLE department ( 
	dept_id              varchar(10)  NOT NULL ,
	dept_name          varchar(24)  NOT NULL ,
	office                 varchar(10) ,
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
	stu_id               varchar(10)  NOT NULL ,
	resident_id         varchar(14)  NOT NULL ,
	name                varchar(20)  NOT NULL ,
	year                 int  ,
	address             varchar(10) ,
	dept_id             varchar(10)  NOT NULL ,
        CONSTRAINT pk_student PRIMARY KEY(stu_id) ,
        CONSTRAINT fk_student FOREIGN KEY (dept_id) 
                     REFERENCES department(dept_id)
);

-- 데이터 입력
-- student(stu_id, resident_id, name, year, address, dept_id)
insert into student values('1292001','900424-1825409','김광식',3,'서울','920');
insert into student values('1292002','900305-1730021','김정현',3,'서울','920');
insert into student values('1292003','891021-2308302','김현정',4,'대전','920');
insert into student values('1292301','890902-2704012','김현정',2,'대구','923');
insert into student values('1292303','910715-1524390','박광수',3,'광주','923');
insert into student values('1292305','921011-1809003','김우주',4,'부산','923');
insert into student values('1292501','900825-1506390','박철수',3,'대전','925');
insert into student values('1292502','911011-1809003','백태성',3,'서울','925');

-- 테이블 생성
-- professor(prof_id, resident_id, name, dept_id, position, year_emp)
CREATE TABLE professor( 
	prof_id              varchar(10)  NOT NULL ,
	resident_id          varchar(14)  NOT NULL ,
	name                 varchar(20)  NOT NULL ,
	dept_id              varchar(10)  NOT NULL ,
	position             varchar(10)   ,
	year_emp           int   ,
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

COMMIT;

-- 데이터 조회
select * from department;
select * from student;
select * from professor;


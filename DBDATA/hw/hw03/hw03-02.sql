-- (hw03-02.sql)

-- 2번
/* 예제2 릴레이션 student, department, professor */
-- department(dept_id, dept_name, office)
-- student(stu_id, resident_id, name, year, address, dept_id)

DROP TABLE if exists professor; 
DROP TABLE if exists student;
DROP TABLE if exists department;

-- 테이블 생성
-- department(dept_id, dept_name, office)
CREATE TABLE department ( 
     dept_id            varchar(10)  NOT NULL ,
     dept_name        varchar(20)  NOT NULL ,
     office               varchar(10) ,
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
      name                varchar(12)  NOT NULL ,
      year                 int  ,
      address             varchar(10) ,
      dept_id             varchar(10)  NOT NULL ,
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
      prof_id              varchar(10)  NOT NULL ,
      resident_id         varchar(14)  NOT NULL ,
      name                varchar(12)  NOT NULL ,
      dept_id             varchar(10)  NOT NULL ,
      position            varchar(10)   ,
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

-- 데이터 조회
select * from department;
select * from student;
select * from professor;

-- 02
-- department(dept_id, dept_name, office)
-- student(stu_id, resident_id, name, year, address, dept_id)
-- professor(prof_id, resident_id, name, dept_id, position, year_emp)

-- 질의1) student 테이블에서 address 가 서울인 레코드 검색하라
SELECT *
FROM student
WHERE address = '서울';

-- 질의2) 2000년 이후에 임용된 교수들에 대한 레코드 검색하라
SELECT *
FROM professor
WHERE year_emp >= 2000;

-- 질의3) 2000년 이후에 임용된 부교수들의 레코드를 검색하라
SELECT *
FROM professor
WHERE year_emp >= 2000 AND position = '부교수';

-- 질의4) student 테이블에서 stu_id 와 name 를 검색하라
SELECT stu_id, name
FROM student;

-- 질의5) student 테이블에서 dept_id 를 검색하라
SELECT dept_id
FROM student;

-- 질의8) professor 테이블에서 name, position 을 검색하라
SELECT name, position
FROM professor;

-- 질의10) 2000년 이후에 임용된 부교수 의 이름을 검색하라
SELECT name
FROM professor
WHERE year_emp >= 2000;
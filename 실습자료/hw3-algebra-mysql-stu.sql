/* [과제3] 관계대수 (hw3-algebra-mysql-stu.sql) */

-- MySQL 실습(데이터베이스: hwdb)
/* =================================== */
-- (MySQL)

-- 스키마 생성(데이터베이스 생성)
CREATE SCHEMA `hwdb` DEFAULT CHARACTER SET utf8 ;

-- 사용할 데이터베이스 선택
USE hwdb;
/*======================================*/
drop table if exists R;
drop table if exists S;
drop table if exists V;

-- 1번
/* 예제1 릴레이션 R, S */

/* 사원 테이블  R 생성 */
CREATE TABLE R ( 
   name   CHAR(9) NOT NULL ,
   dept    CHAR(2),
   gender CHAR(1)
);

/* 사원 테이블  S 생성 */
CREATE TABLE S ( 
   name   CHAR(9) NOT NULL ,
   dept    CHAR(2),
   gender CHAR(1)
);

INSERT INTO R (name, dept, gender) VALUES ( '홍길동', 'AA', 'M');
INSERT INTO R (name, dept, gender) VALUES ( '임꺽정', 'AA', 'M');

INSERT INTO S (name, dept, gender) VALUES ( '홍길동', 'AA', 'M');
INSERT INTO S (name, dept, gender) VALUES ( '박찬호', 'BB', 'M');
INSERT INTO S (name, dept, gender) VALUES ( '박세리', 'BB', 'F');

/* 예제2 릴레이션 V */
CREATE TABLE V ( 
   name      CHAR(9)       NOT NULL,
   category  VARCHAR(15), 
   c_name    VARCHAR(12),
   year        CHAR(4), 
   buy_date  CHAR(7) 
);

INSERT INTO V VALUES ('임꺽정','트럭','포토','1995','1997-05');
INSERT INTO V VALUES ('차범근','승용차','에쿠스','2001','2001-08');
INSERT INTO V VALUES ('홍길동','승용차','소나타','1998','1998-08');
INSERT INTO V VALUES ('박세리','승용차','싼타페','1999','1999-12');
/*--------------------------------------------------------*/
-- 2번
/* 예제2 릴레이션 student, department, professor */

DROP TABLE if exists professor; 
DROP TABLE if exists student;
DROP TABLE if exists department;

CREATE TABLE department ( 
     dept_id            varchar(10)  NOT NULL ,
     dept_name        varchar(20)  NOT NULL ,
     office               varchar(10) ,
     CONSTRAINT pk_department PRIMARY KEY(dept_id)
);

insert into department values('920','컴퓨터공학과','201호');
insert into department values('923','산업공학과','207호');
insert into department values('925','전자공학과','308호');

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

insert into student values('1292001','900424-1825409','김광식',2,'서울','920');
insert into student values('1292002','900305-1730021','김정현',2,'서울','920');
insert into student values('1292003','891021-2308302','김현정',2,'대전','920');
insert into student values('1292301','890902-2704012','김현정',2,'대구','923');
insert into student values('1292303','910715-1524390','박광수',1,'광주','923');
insert into student values('1292305','921011-1809003','김우주',2,'부산','923');
insert into student values('1292501','900825-1506390','박철수',1,'대전','925');
insert into student values('1292502','911011-1809003','백태성',2,'서울','925');

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

insert into professor values('92001','590327-1839240','이태규','920','교수',1997);
insert into professor values('92002','690702-1350026','고희석','920','부교수',2003);
insert into professor values('92301','741011-2765501','최성희','923','부교수',2005);
insert into professor values('92302','750728-1102458','김태석','923','교수',1999);
insert into professor values('92501','620505-1400546','박철재','925','조교수',2007);
insert into professor values('92502','740101-1830264','장민석','925','부교수',2005);

select * from department;
select * from student;
select * from professor;
/*--------------------------------------------------------*/
-- 3번
/* 예제3 릴레이션 gmember, group_ex */

drop table if exists gmember;
drop table if exists group_ex;

CREATE TABLE gmember ( 
   id        CHAR(3)     NOT NULL ,
   groupid CHAR(1)
);

CREATE TABLE group_ex ( 
   groupid   CHAR(1)   NOT NULL ,
   position   VARCHAR(12)
);

INSERT INTO gmember VALUES('100', 'A');
INSERT INTO gmember VALUES('101', 'B');
INSERT INTO gmember VALUES('102', 'A');
INSERT INTO gmember VALUES('102', 'F');

INSERT INTO group_ex VALUES('A', '서울');
INSERT INTO group_ex VALUES('B', '대구');
INSERT INTO group_ex VALUES('C', '광주');
INSERT INTO group_ex VALUES('D', '부산');
INSERT INTO group_ex VALUES('E', '대전');

SELECT * FROM gmember;
SELECT * FROM group_ex;
/*--------------------------------------------------------*/
-- 4번
/* 예제4 릴레이션 R2, S2 */
/* [Quiz 4] */

drop table if exists R2;
drop table if exists S2;

CREATE TABLE R2 (
	A char(2),
	B char(2),
	C char(2)
);

INSERT INTO R2 VALUES ('a1','b1','c7');
INSERT INTO R2 VALUES ('a2','b1','c5');
INSERT INTO R2 VALUES ('a3','b4','c3');

CREATE TABLE S2 (
	B char(2),
	D char(2)
);

INSERT INTO S2 VALUES ('b1','d1');
INSERT INTO S2 VALUES ('b5','d2');
/*--------------------------------------------------------*/

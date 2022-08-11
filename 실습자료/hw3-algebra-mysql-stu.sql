/* [����3] ������ (hw3-algebra-mysql-stu.sql) */

-- MySQL �ǽ�(�����ͺ��̽�: hwdb)
/* =================================== */
-- (MySQL)

-- ��Ű�� ����(�����ͺ��̽� ����)
CREATE SCHEMA `hwdb` DEFAULT CHARACTER SET utf8 ;

-- ����� �����ͺ��̽� ����
USE hwdb;
/*======================================*/
drop table if exists R;
drop table if exists S;
drop table if exists V;

-- 1��
/* ����1 �����̼� R, S */

/* ��� ���̺�  R ���� */
CREATE TABLE R ( 
   name   CHAR(9) NOT NULL ,
   dept    CHAR(2),
   gender CHAR(1)
);

/* ��� ���̺�  S ���� */
CREATE TABLE S ( 
   name   CHAR(9) NOT NULL ,
   dept    CHAR(2),
   gender CHAR(1)
);

INSERT INTO R (name, dept, gender) VALUES ( 'ȫ�浿', 'AA', 'M');
INSERT INTO R (name, dept, gender) VALUES ( '�Ӳ���', 'AA', 'M');

INSERT INTO S (name, dept, gender) VALUES ( 'ȫ�浿', 'AA', 'M');
INSERT INTO S (name, dept, gender) VALUES ( '����ȣ', 'BB', 'M');
INSERT INTO S (name, dept, gender) VALUES ( '�ڼ���', 'BB', 'F');

/* ����2 �����̼� V */
CREATE TABLE V ( 
   name      CHAR(9)       NOT NULL,
   category  VARCHAR(15), 
   c_name    VARCHAR(12),
   year        CHAR(4), 
   buy_date  CHAR(7) 
);

INSERT INTO V VALUES ('�Ӳ���','Ʈ��','����','1995','1997-05');
INSERT INTO V VALUES ('������','�¿���','����','2001','2001-08');
INSERT INTO V VALUES ('ȫ�浿','�¿���','�ҳ�Ÿ','1998','1998-08');
INSERT INTO V VALUES ('�ڼ���','�¿���','��Ÿ��','1999','1999-12');
/*--------------------------------------------------------*/
-- 2��
/* ����2 �����̼� student, department, professor */

DROP TABLE if exists professor; 
DROP TABLE if exists student;
DROP TABLE if exists department;

CREATE TABLE department ( 
     dept_id            varchar(10)  NOT NULL ,
     dept_name        varchar(20)  NOT NULL ,
     office               varchar(10) ,
     CONSTRAINT pk_department PRIMARY KEY(dept_id)
);

insert into department values('920','��ǻ�Ͱ��а�','201ȣ');
insert into department values('923','������а�','207ȣ');
insert into department values('925','���ڰ��а�','308ȣ');

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

insert into student values('1292001','900424-1825409','�豤��',2,'����','920');
insert into student values('1292002','900305-1730021','������',2,'����','920');
insert into student values('1292003','891021-2308302','������',2,'����','920');
insert into student values('1292301','890902-2704012','������',2,'�뱸','923');
insert into student values('1292303','910715-1524390','�ڱ���',1,'����','923');
insert into student values('1292305','921011-1809003','�����',2,'�λ�','923');
insert into student values('1292501','900825-1506390','��ö��',1,'����','925');
insert into student values('1292502','911011-1809003','���¼�',2,'����','925');

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

insert into professor values('92001','590327-1839240','���±�','920','����',1997);
insert into professor values('92002','690702-1350026','����','920','�α���',2003);
insert into professor values('92301','741011-2765501','�ּ���','923','�α���',2005);
insert into professor values('92302','750728-1102458','���¼�','923','����',1999);
insert into professor values('92501','620505-1400546','��ö��','925','������',2007);
insert into professor values('92502','740101-1830264','��μ�','925','�α���',2005);

select * from department;
select * from student;
select * from professor;
/*--------------------------------------------------------*/
-- 3��
/* ����3 �����̼� gmember, group_ex */

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

INSERT INTO group_ex VALUES('A', '����');
INSERT INTO group_ex VALUES('B', '�뱸');
INSERT INTO group_ex VALUES('C', '����');
INSERT INTO group_ex VALUES('D', '�λ�');
INSERT INTO group_ex VALUES('E', '����');

SELECT * FROM gmember;
SELECT * FROM group_ex;
/*--------------------------------------------------------*/
-- 4��
/* ����4 �����̼� R2, S2 */
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

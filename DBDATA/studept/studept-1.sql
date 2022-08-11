-- 2개 테이블 (기본키, 외래키실습) : 학과, 학생 (studept-1.sql)
use studydb;
drop database studydb;

-- 테이블 삭제
drop table 학생;
drop table 학과;

-- 테이블 생성
-- 학과(학과코드, 학과명)
create table 학과 (
	학과코드 char(2) not null ,
    학과명 varchar(30) ,
    primary key (학과코드)
);

-- 학생(학번, 학생명, 학년, 학과코드)
create table 학생 (
	학번 char(4) not null ,
    학생명 varchar(12) ,
    학년 int ,
    학과코드 char(2) ,
    primary key (학번) ,
    foreign key (학과코드) references 학과(학과코드)
);


delete
from student
where id = "배수지";

select * from student;
-- (InputEx1-sql.sql)

-- student(id, name, dept)

-- 데이터베이스 생성
create database sampledb;

-- 사용할 데이터베이스 선택
use sampledb;

-- 테이블 삭제
drop table student;

-- 테이블 생성
-- student(id, name, dept)
create table student (
	id char(7) primary key ,
    name varchar(10) ,
    dept varchar(20)
);

-- 데이터 입력
-- student(id, name, dept)
insert into student values('2020001', '김철수', '컴퓨터공학과');
insert into student values('2020002', '이영희', '정보통신학과');
insert into student values('2020003', '박철수', '경영학과');

-- 데이터 조회
select * from student;
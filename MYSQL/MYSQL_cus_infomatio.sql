-- (cus_infomatio.sql)

-- 테이블 생성

-- 고객정보(아이디, 비밀번호, 이름, 연락처, 주소, 적립금)
create table 고객정보 (
	아이디 varchar(10) not null primary key ,
    비밀번호 varchar(10) ,
    이름 char(5) ,
    연락처 varchar(20) ,
    주소 varchar(50) ,
    적립금 int
);

-- 데이터 입력
insert into 고객정보 values ('apple', '1234', '정소화', '02-111-1111', '서울시 마포구', 1000);
insert into 고객정보 values ('banana', '9876' ,'김선우', '02-222-2222', '경기도 부천시', 500);

-- 데이터 검색
select * from 고객정보;

-- 데이터 삭제
drop table 고객정보;

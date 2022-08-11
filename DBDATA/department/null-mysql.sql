-- (null-mysql.sql)
-- 1단계 스키마 생성
create schema `studydb`
	default character set utf8;
    
use studydb;

-- 2단계 테이블 생성
-- 주소록(이름, 전화번호, 주소, 생일)
create table 주소록 (
	이름 char(10) not null ,
    전화번호 char(13) ,
    주소 varchar(10) ,
    생일 varchar(11) ,
    primary key(이름)
);

-- 주소록(이름, 전화번호, 주소, 생일) 데이터 입력
insert into 주소록(이름, 전화번호, 주소, 생일) values('홍길동', '010-1234-5678', '서울', '3월 15일');
insert into 주소록(이름, 전화번호, 주소, 생일) values('이몽룡', '010-3354-5643', '부산', '12월 14일');
insert into 주소록(이름, 전화번호, 주소, 생일) values('최용만', '321-2345', '대전', '5월 8일');

delete
from 주소록
where 이름 = '최용만';

insert into 주소록 values('최용만', '321-2345', '대전', '5월 8일');


select * from 주소록;

-- 널 값 데이터 입력
insert into 주소록 values('이건우', '010-2132-2345', null, null);

delete
from 주소록
where 이름 = '이건우';

insert into 주소록(이름, 전화번호) values('이건우', '010-2132-2345');

insert into 주소록(전화번호, 이름) values('010-2132-2345', '이건우');




    

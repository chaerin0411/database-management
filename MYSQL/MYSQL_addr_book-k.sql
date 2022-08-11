-- (addr_book-k.sql)

-- 테이블 생성

-- 주소록(이름, 전화번호, 주소, 생일)
create table 주소록 (
	이름 varchar(10) not null primary key ,
    전화번호 char(13) null ,
    주소 varchar(10) null ,
    생일 varchar(10) null
);

-- 데이터 입력
insert into 주소록 values ('이건우', '010-2132-2345', null, null);
insert into 주소록 values ('이몽룡', '010-3354-5643', '부산', '12월 14일');
insert into 주소록 values ('최용만', '321-2345', '대전', '5월 8일');
insert into 주소록 values ('홍길동', '010-1234-5678', '서울', '3월 15일');

-- 데이터 검색
select * from 주소록;

-- 데이터 삭제
drop table 주소록;
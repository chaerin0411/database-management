-- (auto_increment-mysql.sql)
drop table 주소록;

create table 주소록 (
	번호 int auto_increment ,
	이름 char(10) not null ,
    전화번호 char(13) ,
    주소 varchar(10) ,
    생일 varchar(11) ,
    primary key(번호)
);

-- 주소록(번호, 이름, 전화번호, 주소, 생일) 데이터 입력
insert into 주소록(이름, 전화번호, 주소, 생일) values('홍길동', '010-1234-5678', '서울', '3월 15일');
insert into 주소록(이름, 전화번호, 주소, 생일) values('이몽룡', '010-3354-5643', '부산', '12월 14일');
insert into 주소록(이름, 전화번호, 주소, 생일) values('최용만', '321-2345', '대전', '5월 8일');

insert into 주소록(이름, 전화번호, 주소, 생일) values('이건우', '010-2132-2345', null, null);


-- 데이터 조회
select * from 주소록;
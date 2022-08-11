-- (customer.sql)

-- 사용할 데이터베이스 선택
use studydb;

-- 테이블 생성

-- customer(고객번호, 고객이름, 주소, 적립금)
create table customer (
		cno char(4) not null primary key ,
        cname varchar(10) not null ,
        city varchar(20) ,
        point int
);

-- 데이터 입력
insert into customer values('c101', '홍길동', '서울', 500);
insert into customer values('c102', '임꺽정', '인천', 300);
insert into customer values('c103', '박찬호', '안양', 800);
insert into customer values('c204', '신동엽', '과천', 350);
insert into customer values('c205', '정진우', '고양', 400);

-- 데이터 검색
select * from customer;

-- 데이터 삭제
drop table customer;
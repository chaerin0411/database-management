-- (customer.sql)
use studydb;

-- 테이블 생성
-- customer(cno, cname, city, point)
create table customer (
	cno char(4) not null ,
    cname varchar(10) not null ,
    city varchar(20) ,
    point int ,
    constraint pk_customer_cno primary key(cno)
);

-- 데이터 입력
-- customer(cno, cname, city, point)
insert into customer values('c101', '홍길동', '서울', 500);
insert into customer values('c102', '임꺽정', '인천', 300);
insert into customer values('c103', '박찬호', '안양', 800);
insert into customer values('c204', '신동엽', '과천', 350);
insert into customer values('c205', '정진우', '고양', 400);

-- null 값 데이터 입력
insert into customer values('c307', '정동우', '서울', null);

-- 데이터 조회
select * from customer;
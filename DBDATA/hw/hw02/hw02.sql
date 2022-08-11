-- (hw02.sql)
use hwdb;

drop table 재고현황;
drop table 주문;

-- 테이블 생성
-- 재고현황(제품코드, 제품명, 입고량, 출고량, 현재수량, 단가)
create table 재고현황 (
제품코드 char(4) not null ,
제품명 varchar(10) ,
입고량 int ,
출고량 int ,
현재수량 int ,
단가 int ,
constraint pk_재고현황_제품코드 primary key(제품코드)
);

-- 주문(주문번호, 제품번호, 수량, 주문자, 주문날짜, 적립금)
create table 주문 (
	주문번호 char(4) not null ,
    제품번호 char(4) ,
    수량 int ,
    주문자 varchar(5) ,
    주문날짜 varchar(20) ,
    적립금 int ,
    constraint pk_주문_주문번호 primary key(주문번호) ,
    constraint fk_주문_제품번호 foreign key(제품번호) references 재고현황(제품코드)
);


-- 데이터 입력
-- 재고현황(제품코드, 제품명, 입고량, 출고량, 현재수량, 단가)
insert into 재고현황 values('a001', '삼성전자에어컨', 100, 50, 50, 1300000);
insert into 재고현황 values('a002', 'LG전자에어컨', 70, 40, 30, 1400000);
insert into 재고현황 values('a003', '캐리어에어컨', 50, 25, 25, 300000);
insert into 재고현황 values('a004', '위니아딤채에어컨', 40, 15, 25, 400000);
insert into 재고현황 values('a005', '파세코에어컨', 50, 40, 10, 700000);

-- 주문(주문번호, 제품번호, 수량, 주문자, 주문날짜, 적립금)
insert into 주문 values('b001', 'a001', 10, '전채린', '2020-10-10', 100000);
insert into 주문 values('b002', 'a003', 5, '전성용', '2020-10-10', NULL);
insert into 주문 values('b003', 'a005', 10, '이바다', '2020-10-11', 100000);
insert into 주문 values('b004', 'a001', 7, '이산', '2020-10-12', 70000);
insert into 주문 values('b005', 'a002', 20, '김보아', '2020-10-12', 200000);

-- 데이터 조회
select * from 재고현황;
select * from 주문;



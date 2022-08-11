-- (ex08-05.sql)

-- 사원(사원번호, 이름, 부서명)
-- 제품(제품번호, 제품명, 단가)
-- 판매(사원번호, 제품번호, 수량)

-- 테이블 삭제
drop table 판매;
drop table 사원;
drop table 제품;

-- 테이블 생성
-- 사원(사원번호, 이름, 부서명)
create table 사원 (
    사원번호 int not null ,
    이름 varchar(10) ,
    부서명 varchar(20) ,
    primary key(사원번호)
);

-- 제품(제품번호, 제품명, 단가)
create table 제품 (
    제품번호 char(4) not null ,
    제품명 varchar(10) ,
    단가 int ,
    primary key(제품번호)
);

-- 판매(사원번호, 제품번호, 수량)
create table 판매 (
    사원번호 int not null ,
    제품번호 char(4) not null ,
    수량 int ,
    primary key(사원번호, 제품번호) ,
    foreign key(사원번호) references 사원(사원번호) ,
    foreign key(제품번호) references 제품(제품번호)
);

-- 데이터 입력
-- 사원(사원번호, 이름, 부서명)
insert into 사원 values(1, '김하나', '영업1과');
insert into 사원 values(2, '이두한', '영업2과');
insert into 사원 values(3, '박태성', '영업3과');

-- 제품(제품번호, 제품명, 단가)
insert into 제품 values('PD01', 'RS-101', 21500);
insert into 제품 values('PD02', 'RS-102', 18700);
insert into 제품 values('PD03', 'RS-103', 23100);

-- 판매(사원번호, 제품번호, 수량)
insert into 판매 values(1, 'PD01', 500);
insert into 판매 values(2, 'PD03', 487);
insert into 판매 values(1, 'PD03', 95);

-- 데이터 검색
select * from 사원;
select * from 제품;
select * from 판매;

-- (3개 테이블 조인)
-- 제품을 판매한 사원번호, 사원명, 제품번호, 제품명, 수량을 검색하라
-- 1) select from where 절 사용
select 사원.사원번호, 이름, 제품.제품번호, 제품명, 수량
from 사원, 제품, 판매
where 사원.사원번호 = 판매.사원번호 
and 제품.제품번호 = 판매.제품번호;

-- 2) select from on 절 사용
select 사원.사원번호, 이름, 제품.제품번호, 제품명, 수량
from 사원 inner join 판매
on 사원.사원번호 = 판매.사원번호 
inner join 제품
on 제품.제품번호 = 판매.제품번호;

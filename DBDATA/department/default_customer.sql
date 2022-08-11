-- (default_customer.sql)

-- 거래고객(번호, 성별, 적립금, 담당사원, 담당일자)
-- 테이블 삭제
drop table 거래고객;

-- 테이블 생성
-- 거래고객(번호, 성별, 적립금, 담당사원, 담당일자)
create table 거래고객 (
	번호 int not null ,
    이름 char(10) ,
    성별 char(2) ,
    적립금 int default 0 ,
    담당사원 varchar(10) default '신아로미' ,
    담당일자 timestamp default now() ,
    constraint pk_거래고객_번호 primary key(번호) ,
    constraint ck_거래고객_적립금 check (적립금 >= 0 and 적립금 <= 10000)
);

-- 데이터 입력
-- 거래고객(번호, 성별, 적립금, 담당사원, 담당일자)
insert into 거래고객 values(1, '홍길동', '남', 200, '유민정', '2019-12-23');
insert into 거래고객(번호, 이름, 성별, 적립금) values(2, '임꺽정', '남', 300);

-- 오류
insert into 거래고객(번호, 이름, 성별, 적립금) values(3, '신동엽', '남', -100);

-- 데이터 검색
select * from 거래고객;
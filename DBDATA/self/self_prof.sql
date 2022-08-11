-- (self_prof.sql)

-- 테이블 생성
-- 교수(교수번호, 주민등록번호, 이름, 학과명, 학과장)
create table 교수 (
	교수번호 char(5) not null ,
    주민등록번호 char(14) not null ,
    이름 varchar(20) not null ,
    학과명 varchar(20) not null ,
    학과장 char(5) ,
    constraint pk_교수_교수번호 primary key(교수번호)
);

-- 데이터 입력
insert into 교수 values('92001', '590327-1839240', '이태규', '컴퓨터공학과', '92001');
insert into 교수 values('92002', '690702-1350026', '고희석', '컴퓨터공학과', '92001');
insert into 교수 values('92301', '741011-2765501', '최성희', '산업공학과', '92302');
insert into 교수 values('92302', '750728-1102458', '김태석', '산업공학과', '92302');
insert into 교수 values('92501', '620505-1400546', '박철재', '전자공학과', null);
insert into 교수 values('92502', '740101-1830264', '장민석', '전자공학과', null);

-- 데이터 조회
select * from 교수;

-- 실습(참조무결성 실습)
insert into 교수 values('99999','190101-3999999','홍길동','컴퓨터공학과','99999');

delete
from 교수
where 교수번호 = '99999';

-- 외래키 추가
alter table 교수
add constraint fk_교수_학과장 foreign key (학과장) references 교수(교수번호);
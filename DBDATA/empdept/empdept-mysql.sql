-- (empdept-mysql.sql)
-- DDL ( CREATE TABLE 실습)

-- 부서(부서코드, 부서명)
-- 사원(사원번호, 이름, 부서코드)

use studydb;

drop table if exists 사원;
drop table if exists 부서;

-- 부서(부서코드, 부서명) 테이블 생성
create table 부서 (
	부서코드 char(2) not null ,
    부서명 varchar(10) ,
    constraint pk_부서_부서코드 primary key(부서코드)
);

-- 사원(사원번호, 이름, 부서코드) 테이블 생성
create table 사원 (
	사원번호 char(4) not null ,
    이름 varchar(12) ,
    부서코드 char(2) ,
    constraint pk_사원_사원번호 primary key(사원번호) ,
    constraint fk_사원_부서코드 foreign key(부서코드) references 부서(부서코드)
);

-- 부서(부서코드, 부서명) 데이터 생성
insert into 부서 values('AA', '총무부');
insert into 부서 values('BB', '영업부');
insert into 부서 values('CC', '기획부');

-- 사원(사원번호, 이름, 부서코드) 데이터 생성
insert into 사원 values('1111', '홍길동', 'AA');
insert into 사원 values('2222', '임꺽정', 'AA');
insert into 사원 values('3333', '박찬호', 'BB');
insert into 사원 values('4444', '선동열', 'BB');
insert into 사원 values('5555', '차두리', 'AA');
insert into 사원 values('6666', '신동엽', 'BB');

-- 데이터 조회
select * from 부서;
select * from 사원;

-- (실습)
insert into 사원 values('7777', '이승엽', 'BB');

update 부서
set 부서코드
where 부서코드 = 'BB';

insert into 부서 values('DD', '개발부');

delete
from 부서
where 부서코드 = 'DD';

update 사원
set 부서코드 = 'AA'
where 사원번호 = '7777';

update 사원
set 부서코드 = 'FF'
where 사원번호 = '7777';

delete
from 사원
where 사원번호 = '7777';
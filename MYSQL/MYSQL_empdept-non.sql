-- (empdept-non.sql)

-- 부서(부서코드, 부서명)
-- 사원(사원번호, 이름, 부서코드)

drop table 부서;
drop table 사원;

-- 부서 테이블 생성
create table 부서 (
	부서코드 char(2) not null ,
    부서명 varchar(10) ,
    primary key(부서코드)
);

-- 사원 테이블 생성
create table 사원 (
	사원번호 char(4) ,
    이름 varchar(12) ,
    부서코드 char(2) ,
    primary key(사원번호) ,
    foreign key(부서코드) references 부서(부서코드)
);

-- 부서 데이터 입력
insert into 부서(부서코드, 부서명) values('AA', '총무부');
insert into 부서(부서코드, 부서명) values('BB', '영업부');
insert into 부서(부서코드, 부서명) values('CC', '기획부');

-- 사원 데이터 입력
insert into 사원 values('1111', '홍길동', 'AA');
insert into 사원 values('2222', '임꺽정', 'AA');
insert into 사원 values('3333', '박찬호', 'BB');
insert into 사원 values('4444', '선동열', 'BB');
insert into 사원 values('5555', '차두리', 'AA');
insert into 사원 values('6666', '신동엽', 'BB');

select * from 부서;
select * from 사원;

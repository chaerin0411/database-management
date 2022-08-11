-- (member_set.sql)
-- 정회원(번호, 이름, 주민번호, 휴대폰번호, 이메일, 등록일)
-- 준회원(번호, 이름, 주민번호, 휴대폰번호, 이메일, 등록일)

use hanch06db;

-- 테이블 생성
-- 정회원(번호, 이름, 주민번호, 휴대폰번호, 이메일, 등록일)
create table 정회원 (
	번호 int primary key ,
    이름 varchar(12) not null ,
    주민번호 char(14) not null ,
    휴대폰번호 char(14) not null ,
    이메일 varchar(30) ,
    등록일 char(8)
);

-- 준회원(번호, 이름, 주민번호, 휴대폰번호, 이메일, 등록일)
create table 준회원 (
	번호 int primary key ,
    이름 varchar(12) not null ,
    주민번호 char(14) not null ,
    휴대폰번호 char(14) not null ,
    이메일 varchar(30) ,
    등록일 char(8)
);

-- 데이터 입력
-- 정회원(번호, 이름, 주민번호, 휴대폰번호, 이메일, 등록일)
insert into 정회원(번호, 이름, 주민번호, 휴대폰번호, 이메일, 등록일)
values(1, '홍길동', '820416-1234567', '(011) 123-1231', 'gdhong@hitel.net', '20070302');
insert into 정회원(번호, 이름, 주민번호, 휴대폰번호, 이메일, 등록일)
values(2, '임꺽정', '830507-2345678', '(010) 122-1222', 'jung@hanmail.net', '20050422');

-- 준회원(번호, 이름, 주민번호, 휴대폰번호, 이메일, 등록일)
insert into 준회원(번호, 이름, 주민번호, 휴대폰번호, 이메일, 등록일)
values(1, '홍길동', '820416-1234567', '(011) 123-1231', 'gdhong@hitel.net', '20070302');
insert into 준회원(번호, 이름, 주민번호, 휴대폰번호, 이메일, 등록일)
values(3, '박찬호', '850321-1456789', '(010) 133-1231', 'chpark@hanmail.net', '20090512');
insert into 준회원(번호, 이름, 주민번호, 휴대폰번호, 이메일, 등록일)
values(4, '선동열', '761122-1889911', '(010) 144-1222', 'sun@naver.com', '20080605');

-- 데이터 검색
select * from 정회원;
select * from 준회원;

-- [실습1] 집합연산(합집합, 교집합, 차집합)

-- 1) 정회원과 준회원을 UNION 연산을 이용하여 검색하라
select * from 정회원
union
select * from 준회원;

-- 2) 정회원과 준회원을 INTERSECT 연산을 이용하여 검색하라

-- 3) 정회원과 준회원을 MINUS 연산을 이용하여 검색하라(MS SQL은 EXCEPT 연산자 이용)

-- [Quiz] 정회원과 준회원을 UNION 연산자를 사용한 것과, UNION ALL 연산자를 사용한 것의 차이점을 확인하라
-- 합집합
select 번호, 이름 from 정회원
union
select 번호, 이름 from 준회원;

-- 합집합(중복 포함)
select 번호, 이름 from 정회원
union all
select 번호, 이름 from 준회원;
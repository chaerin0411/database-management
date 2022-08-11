-- (week08.sql)
-- (Oracle)

-- 학과(학과코드, 학과명)
-- 학생(학번, 이름, 학과코드)

-- 테이블 삭제
drop table 학생;
drop table 학과;

-- 테이블 생성
-- 학과(학과코드, 학과명)
create table 학과 (
    학과코드 char(4) not null ,
    학과명 varchar(30) ,
    constraint pk_학과_학과코드 primary key(학과코드)
);

-- 학생(학번, 이름, 학과코드)
create table 학생 (
    학번 char(4) not null ,
    이름 varchar(10) ,
    학과코드 char(4) ,
    constraint pk_학생_학번 primary key(학번) ,
    constraint fk_학과_학과코드 foreign key(학과코드) references 학과(학과코드)
);

-- 데이터 입력
-- 학과(학과코드, 학과명)
insert into 학과 values('1001', '컴퓨터학과');
insert into 학과 values('2001', '체육학과');

-- 학생(학번, 이름, 학과코드)
insert into 학생 values('501', '박지성', '1001');
insert into 학생 values('401', '김연아', '2001');
insert into 학생 values('402', '장미란', '2001');
insert into 학생 values('502', '추신수', '1001');

col 학과코드 for a8
col 학과명 for a10
col 학번 for a4

-- 데이터 조회
select * from 학과;
select * from 학생;

/*------------------------------------------------------------------------*/

-- 학과2(학과코드, 학과명)
-- 학생2(학번, 이름, 학과코드)

-- 테이블 삭제
drop table 학생2;
drop table 학과2;

-- 테이블 생성
-- 학과2(학과코드, 학과명)
create table 학과2 (
    학과코드 char(4) not null ,
    학과명 varchar(30) ,
    constraint pk_학과2_학과코드 primary key(학과코드)
);

-- 학생2(학번, 이름, 학과코드)
create table 학생2 (
    학번 char(4) not null ,
    이름 varchar(10) ,
    학과코드 char(4) ,
    constraint pk_학생2_학번 primary key(학번) ,
    constraint fk_학과2_학과코드 foreign key(학과코드) references 학과2(학과코드) on delete cascade
);

-- 데이터 입력
-- 학과2(학과코드, 학과명)
insert into 학과2 values('1001', '컴퓨터학과');
insert into 학과2 values('2001', '체육학과');

-- 학생2(학번, 이름, 학과코드)
insert into 학생2 values('501', '박지성', '1001');
insert into 학생2 values('401', '김연아', '2001');
insert into 학생2 values('402', '장미란', '2001');
insert into 학생2 values('502', '추신수', '1001');

-- 데이터 조회
select * from 학과2;
select * from 학생2;

/*------------------------------------------------------------------------*/

-- 학과3(학과코드, 학과명)
-- 학생3(학번, 이름, 학과코드)

-- 테이블 삭제
drop table 학생3;
drop table 학과3;

-- 테이블 생성
-- 학과3(학과코드, 학과명)
create table 학과3 (
    학과코드 char(4) not null ,
    학과명 varchar(30) ,
    constraint pk_학과3_학과코드 primary key(학과코드)
);

-- 학생3(학번, 이름, 학과코드)
create table 학생3 (
    학번 char(4) not null ,
    이름 varchar(10) ,
    학과코드 char(4) ,
    constraint pk_학생3_학번 primary key(학번) ,
    constraint fk_학과3_학과코드 foreign key(학과코드) references 학과3(학과코드) on delete set null
);

-- 데이터 입력
-- 학과3(학과코드, 학과명)
insert into 학과3 values('1001', '컴퓨터학과');
insert into 학과3 values('2001', '체육학과');

-- 학생3(학번, 이름, 학과코드)
insert into 학생3 values('501', '박지성', '1001');
insert into 학생3 values('401', '김연아', '2001');
insert into 학생3 values('402', '장미란', '2001');
insert into 학생3 values('502', '추신수', '1001');

-- 데이터 조회
select * from 학과3;
select * from 학생3;

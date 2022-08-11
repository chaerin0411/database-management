-- (week14_01.sql)
-- 학과(학과번호, 학과명)
-- 학생(학번, 소속학과)

-- 테이블 삭제
drop table 학생;
drop table 학과;

-- 테이블 생성
-- 학과(학과번호, 학과명)
create table 학과 (
	학과번호 char(10) primary key ,
    학과명 char(10)
);

-- 학생(학번, 소속학과)
create table 학생 (
	학번 char(10) primary key ,
    소속학과 char(10) ,
    foreign key(소속학과) references 학과(학과번호)
    on delete cascade
    on update set null
);

-- 데이터 입력
-- 학과(학과번호, 학과명)
insert into 학과 values('1', '전산과');
insert into 학과 values('2', '전기과');

-- 학생(학번, 소속학과)
insert into 학생 values('100', '1');
insert into 학생 values('200', '2');
insert into 학생 values('300', '2');

-- 데이터 검색
select * from 학과;
select * from 학생;

select count(학번) from 학생;
delete from 학과 where 학과번호 = '2';
select count(학번) from 학생;

set sql_safe_updates = 0;
update 학과
set 학과번호 = '5'
where 학과번호 = '1';
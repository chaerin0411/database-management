-- (join01-stu.sql)
-- R1(A, B)
-- S1(A, C, D)

/*
조인(join)
동등조인(equi join)
자연조인(natural join)
*/

-- 테이블 생성
-- R1(A, B)
create table R1 (
	A char(2) ,
    B char(2)
);

-- S1(A, C, D)
create table S1 (
	A char(2) ,
    C char(2) ,
    D char(2)
);

-- 데이터 입력
-- R1(A, B)
insert into R1 values('1', '4');
insert into R1 values('2', '5');

-- S1(A, C, D)
insert into S1 values('1', '3', '4');
insert into S1 values('2', '2', '6');
insert into S1 values('3', '1', '9');

-- 데이터 검색
select * from R1;
select * from S1;

-- 카디션 프로덕트(product)
select * 
from R1, S1;

-- 동등조인(equi join)
select *
from R1, S1
where R1.A = S1.A;

-- 자연조인(natural join)
select R1.A, B, C, D
from R1, S1
where R1.A = S1.A;

-- 세타조인(theta join)
select *
from R1, S1
where R1.A >= C;
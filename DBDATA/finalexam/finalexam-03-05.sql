-- (finalexam-03-05.sql)

-- R(A, B)
-- S(C, D)

-- 테이블 삭제
drop table R;
drop table S;

-- 테이블 생성
-- R(A, B)
create table R (
	A char(2) ,
    B int
);

-- S(C, D)
create table S (
	C char(2) ,
    D int
);

-- 데이터 입력
-- R(A, B)
insert into R values('a', 2);
insert into R values('b', 4);
insert into R values('a', 6);
insert into R values('a', 4);
insert into R values('c', 6);

-- S(C, D)
insert into S values('a', 1);
insert into S values('b', 2);
insert into S values('c', 4);

-- 데이터 조회
select * from R;
select * from S;

-- Q1)
select count(*)
from R
where B = some (select D
		  from S);
          
-- Q2)
select D, avg(B)
from R, S
where A = C
group by D
having count(*) > 1;
-- (week14_02.sql)

-- 테이블 생성
-- 과일(과일코드, 과일명)
create table 과일 (
	 과일코드 int primary key ,
     과일명 char(20)
);

-- 데이터 입력
-- 과일(과일코드, 과일명)
insert into 과일 values(10, '오렌지');
insert into 과일 values(15, '키위');
insert into 과일 values(19, '파인애플');

-- 데이터 검색
select *
from 과일
where 과일코드 not in (select 과일코드
						from 과일
                        where 과일코드 = 10);
                        
select *
from 과일
where 21 not in (select 과일코드 from 과일);
                        
select *
from 과일
where 19 < any (select 과일코드 from 과일);

select *
from 과일
where 19 <= any (select 과일코드 from 과일);

select *
from 과일
where 15 < all (select 과일코드 from 과일);

select *
from 과일
where 19 = all (select 과일코드 from 과일);

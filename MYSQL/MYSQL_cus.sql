-- (cus.sql)

-- 사용할 데이터베이스 선택
use studydb;

-- 테이블 생성

-- 고객(고객아이디, 고객이름, 나이, 등급, 직업, 적립금)
create table 고객 (
	고객아이디 char(20) not null primary key ,
    고객이름 char(20) ,
    나이 int ,
    등급 char(10) ,
    직업 char(10) ,
    적립금 int 
);

-- 데이터 입력
insert into 고객 values('apple', '김현준', 20, 'gold', '학생', 1000),
					  ('banana', '정소화', 25, 'vip', '간호사', 2500),
                      ('carrot', '원유선', 28, 'gold', '교사', 4500),
                      ('orange', '정지영', 22, 'silver', '학생', 0);
				
-- 데이터 검색
select * from 고객;
-- 05_Quiz02 자체 릴레이션

drop table if exists 추천고객;

-- 테이블 생성
-- 추천고객(고객아이디, 고객이름, 나이, 등급, 직업, 적립금, 추천고객)
create table 추천고객 (
	고객아이디 char(20) not null primary key ,
    고객이름 char(5) ,
    나이 int ,
    등급 varchar(20) ,
    직업 varchar(10) ,
    적립금 int ,
    추천고객 char(20) ,
    foreign key (추천고객) references 추천고객(고객아이디)
);

-- 데이터 입력
insert into 추천고객 values('orange', '정지영', 22, 'silver', '학생', 0, null);
insert into 추천고객 values('apple', '김현준', 20, 'gold', '학생', 1000, 'orange');
insert into 추천고객 values('banana', '정소화', 25, 'vip', '간호사', 2500, 'orange');
insert into 추천고객 values('carrot', '원유선', 28, 'gold', '교사', 4500, 'apple');
insert into 추천고객 values('cherry', '전채린', 20, 'vip', '학생', 3000, 'carrot');

-- 데이터 조회
select * from 추천고객;
/* =================================================== */

-- 기본예제 실습용

/* =================================================== */

/* (quiz_fruit.sql) */

-- [Quiz] fruit


----------------------------


drop table fruit;

-- fruit(과일번호,과일이름,가격,색상, 원산지)

create table fruit (

과일번호 int NOT NULL ,

과일이름 varchar(30) ,

가격 int,

색상 char(12) ,

원산지 varchar(30) , 

PRIMARY KEY(과일번호)

);


insert into fruit values(1,'사과',2000,'빨간색','한국');

insert into fruit values(2,'배',5000,'노란색','한국');

insert into fruit values(3,'바나나',1500,'노란색','인도네시아');

insert into fruit values(4,'키위',4000,'초록색','호주');

insert into fruit values(5,'수박',8000,'초록색','한국');


-- NULL 값 입력


insert into fruit values(6,'망고',5000,'노란색', NULL);

insert into fruit values(7,'레몬',6000,'노란색','미국');


-- 추가 입력


insert into fruit values('8','오렌지',1000,'주황색','한국');

insert into fruit values('9','망고',5000,'노랑색','페루');

insert into fruit values('10','체리',4800,'빨간색','소아시아');

insert into fruit values('11','포도',2500,'보라색','한국');

insert into fruit values('12','아보카도',2000,'초록색','남아프리카');


-- --------------------------

select * from fruit order by 과일번호 asc;


-- [기본예제 1]

-- 1-1) 노란색 과일의 이름, 색상을 검색하라.

select 과일이름, 색상
from fruit;

-- 1-2) 과일이름을 오름차순으로 정렬하여 모든 필드를 검색하라

select *
from fruit
order by 과일이름 asc;

-- 1-3) 가격이 5000 이하인 빨간색 과일의 이름을 검색하라

select 과일이름
from fruit
where 과일이름 <= 5000;

-- 1-4) 가격이 2000 ~ 5000 사이의 과일 이름과 가격, 원산지를 검색하라(BETWEEN AND)

select 과일이름, 가격, 원산지
from fruit
where 과일이름 between 2000 and 5000;

-- 1-5) 색상이 노란색이거나 초록색인 과일이름, 색상을 검색하라(IN 사용)

select 과일이름, 색상
from fruit
where 색상 in ('노란색', '초록색');

-- 1-6) 색상이 노란색이거나 초록색인 과일이름, 색상을 검색하라(논리연산자 OR 사용)

select 과일이름, 색상
from fruit
where 색상 = '노란색' or 색상 = '초록색';

-- 1-7) 원산지가 한국이 아닌 과일이름, 원산지를 검색하라

select 과일이름, 원산지
from fruit
where 원산지 != '한국';


-- --------------------------


-- fruit(과일번호,과일이름,가격,색상, 원산지)


-- [기본예제 2]


-- 2-1) UPDATE 문을 이용하여 사과의 가격을 2배로 하여 수정하라

update fruit
set 가격 = 가격 * 2
where 과일이름 = '사과';

-- 2-2) DELETE 문을 이용하여 원산지가 호주인 과일의 목록을 삭제하라

delete 
from fruit
where 원산지 = '호주';


-- 3-1) ALTER TABLE 문을 이용하여 과일정보 필드를 추가하라(데이터형식 varchar(20))

alter table fruit
add 과일정보 varchar(20);


-- --------------------------

-- [추가예제 1]


-- NULL 값 입력

insert into fruit values(6,'망고',5000,'노란색', NULL);

insert into fruit values(7,'레몬',6000,'노란색','미국');


-- 1-8) 원산지를 알 수 없는 과일의 과일이름, 원산지를 검색하라

select 과일이름, 원산지
from fruit
where 원산지 is null;

-- 1-9) 과일 가격의 내림차순으로 정렬하는데,
-- 가격이 같은 경우, 원산지의 오름차순 정렬로 검색하라

select *
from fruit
order by 가격 desc, 원산지 asc;

-- 1-10) 원산지가 국으로 끝나는 과일이름, 원산지를 검색하라

select 과일이름, 원산지
from fruit
where 원산지 like '%국';

-- 1-11) 원산지가 인으로 시작하는 과일이름, 원산지를 출력하라

select 과일이름, 원산지
from fruit
where 원산지 like '인%';


-- [출처] [강의보충](조인) 12주차 강의보충 (지나가는 만남과 기억되는 만남) | 작성자 김희숙
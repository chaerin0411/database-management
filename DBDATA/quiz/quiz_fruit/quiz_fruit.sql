-- (quiz_fruit.sql)

-- [Quiz1] fruit
-- [Quiz2] fruitSales-k
-- fruit(과일번호,과일이름,가격,색상, 원산지)

use studydb;

-- 테이블 삭제
drop table fruit;

-- 1. 다음과 같은 fruit 테이블을 생성하고 데이터 입력하는 SQL문법을 작성하라(기본키: 과일번호)
-- 과일번호 과일이름 가격 색상 원산지
-- 1 사과 2000 빨간색 한국
-- 2 배 5000 노란색 한국
-- 3 바나나 1500 노란색 인도네시아
-- 4 키위 4000 초록색 호주
-- 5 수박 8000 초록색 한국

-- 테이블 생성
-- fruit(과일번호,과일이름,가격,색상, 원산지)
create table fruit (
	과일번호 int NOT NULL ,
	과일이름 varchar(30) ,
	가격 int,
	색상 char(12) ,
	원산지 varchar(30) , 
	PRIMARY KEY(과일번호)
);

-- 데이터 입력
-- fruit(과일번호,과일이름,가격,색상, 원산지)
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

-- 데이터 검색
select * from fruit;
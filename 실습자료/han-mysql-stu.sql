-- (MySQL)
-- 고객(고객아이디, 고객이름, 나이, 등급, 직업, 적립금)
-- 제품(제품번호, 제품명, 재고량, 단가, 제조업체)
-- 주문(주문번호, 주문고객, 주문제품, 수량, 배송지, 주문일자)

drop database if exists handb;

CREATE DATABASE `handb` 
  DEFAULT CHARACTER SET utf8mb4;

use handb;

DROP TABLE if exists 고객;
DROP TABLE if exists 제품;
DROP TABLE if exists 주문;

CREATE TABLE 고객 (
	고객아이디  VARCHAR(20)	NOT NULL,
	고객이름    VARCHAR(10),
	나이         INT,
	등급         VARCHAR(10)	NOT NULL,
	직업         VARCHAR(20),
	적립금      INT	            DEFAULT 0,
	PRIMARY KEY(고객아이디)
);

CREATE TABLE 제품 (
	제품번호    CHAR(3)	NOT NULL,
	제품명       VARCHAR(20),
	재고량       INT,
	단가         INT,
	제조업체    VARCHAR(20),
	PRIMARY KEY(제품번호)
	-- CHECK (제품번호 >= 0 AND 제품번호 <= 10000)
);

CREATE TABLE 주문 (
	주문번호    CHAR(3)	NOT NULL,
	주문고객    VARCHAR(20),
	주문제품    CHAR(3),
	수량         INT,
	배송지      VARCHAR(30),
	주문일자    DATE,
	PRIMARY KEY(주문번호),
	FOREIGN KEY(주문고객) REFERENCES 고객(고객아이디),
	FOREIGN KEY(주문제품) REFERENCES 제품(제품번호)
);

-- 고객(고객아이디, 고객이름, 나이, 등급, 직업, 적립금)
INSERT INTO 고객 VALUES ('apple', '정소화', 20, 'gold', '학생', 1000);
INSERT INTO 고객 VALUES ('banana', '김선우', 25, 'vip', '간호사', 2500);
INSERT INTO 고객 VALUES ('carrot', '고명석', 28, 'gold', '교사', 4500);
INSERT INTO 고객 VALUES ('orange', '김용욱', 22, 'silver', '학생', 0);
INSERT INTO 고객 VALUES ('melon', '성원용', 35, 'gold', '회사원', 5000);
INSERT INTO 고객 VALUES ('pear', '채광주', 31, 'silver', '회사원', 500);
INSERT INTO 고객 VALUES ('peach', '오형준', NULL, 'silver', '의사', 300);

-- 제품(제품번호, 제품명, 재고량, 단가, 제조업체)
INSERT INTO 제품 VALUES ('p01', '그냥만두', 5000, 4500, '대한식품');
INSERT INTO 제품 VALUES ('p02', '매운쫄면', 2500, 5500, '민국푸드');
INSERT INTO 제품 VALUES ('p03', '콩떡파이', 3600, 2600, '한빛제과');
INSERT INTO 제품 VALUES ('p04', '맛난초콜렛', 1250, 2500, '한빛제과');
INSERT INTO 제품 VALUES ('p05', '멀큰라면', 2200, 1200, '대한식품');
INSERT INTO 제품 VALUES ('p06', '통통우동', 1000, 1550, '민국푸드');
INSERT INTO 제품 VALUES ('p07', '달콤비스켓', 1650, 1500, '한빛제과');

-- 주문(주문번호, 주문고객, 주문제품, 수량, 배송지, 주문일자)
INSERT INTO 주문 VALUES ('o01', 'apple', 'p03', 10, '서울시 마포구', '13/01/01');
INSERT INTO 주문 VALUES ('o02', 'melon', 'p01', 5, '인천시 계양구', '13/01/10');
INSERT INTO 주문 VALUES ('o03', 'banana', 'p06', 45, '경기도 부천시', '13/01/11');
INSERT INTO 주문 VALUES ('o04', 'carrot', 'p02', 8, '부산시 금정구', '13/02/01');
INSERT INTO 주문 VALUES ('o05', 'melon', 'p06', 36, '경기도 용인시', '13/02/20');
INSERT INTO 주문 VALUES ('o06', 'banana', 'p01', 19, '충천북도 보은군', '13/03/02');
INSERT INTO 주문 VALUES ('o07', 'apple', 'p03', 22, '서울시 영등포구', '13/03/15');
INSERT INTO 주문 VALUES ('o08', 'pear', 'p02', 50, '강원도 춘천시', '13/04/10');
INSERT INTO 주문 VALUES ('o09', 'banana', 'p04', 15, '전라남도 목포시', '13/04/11');
INSERT INTO 주문 VALUES ('o10', 'carrot', 'p03', 20, '경기도 안양시', '13/05/22');

COMMIT;

-- 고객(고객아이디, 고객이름, 나이, 등급, 직업, 적립금)
-- 제품(제품번호, 제품명, 재고량, 단가, 제조업체)
-- 주문(주문번호, 주문고객, 주문제품, 수량, 배송지, 주문일자)

select * from 고객;
select * from 제품;
select * from 주문;




-- 예제7-10) 고객 테이블에서 고객아이디, 고객이름, 등급 속성을 검색한다
SELECT	고객아이디, 고객이름, 등급
FROM	고객;

-- 예제7-11) 고객 테이블에 존재하는 모든 속성을 검색한다
SELECT *
FROM 고객;

-- 예제7-13) 제품 테이블에서 제조업체를 검색한다
SELECT 제조업체
FROM 제품;

-- 예제7-14) 제품 테이블에서 제조업체를 검색하되, ALL 키워드를 사용한다
SELECT ALL 제조업체
FROM 제품;

-- 예제7-15) 제품 테이블에서 제조업체 속성을 중복 없이 검색한다(중복 제거)
SELECT distinct 제조업체
FROM 제품;

-- 예제7-16) 제품 테이블에서 제품명과 단가를 검색하되, 단가를 가격이라는 새 이름으로 출력한다
SELECT 제품명, 단가 as 가격
FROM 제품;

-- 예제7-17) 제품 테이블에서 제품명과 단가 속성을 검색하되, 
-- 단가에 500원을 더해 조정단가라는 새 이름으로 출력한다
SELECT 제품명, (단가+500) as 조정단가
FROM 제품;

-- 예제7-18) 제품 테이블에서 한빛제과가 제조한 제품의 제품명, 재고량, 단가를 검색한다
SELECT 제품명, 재고량, 단가
FROM 제품
WHERE 제조업체 = '한빛제과';

-- 예제7-19) 주문 테이블에서 apple 고객이 15개 이상 주문한 주문제품, 수량, 주문일자를 검색한다
SELECT 주문제품, 수량, 주문일자
FROM 주문
WHERE 주문고객 = 'apple' AND 수량 >= 15;

-- 예제7-20) 주문 테이블에서 apple 고객이 주문했거나 
-- 15개 이상 주문된 제품의 주문제품, 수량, 주문일자, 주문고객을 검색한다
SELECT 주문제품, 수량, 주문일자, 주문고객
FROM 주문
WHERE 주문고객 = 'apple' OR 수량 >= 15;

-- 예제7-21) 제품 테이블에서 단가가 2000원 이상이면서 3000원 이하인 제품의 
-- 제품명, 단가, 제조업체를 검색한다
SELECT 제품명, 단가, 제조업체
FROM 제품
WHERE 단가 >= 2000 AND 단가 <= 3000;

-- 예제7-22) 고객 테이블에서 성이 김씨인 고객의 고객이름, 나이, 등급, 적립금을 검색한다
SELECT 고객이름, 나이, 등급, 적립금
FROM 고객
WHERE 고객이름 LIKE'김%';

-- 예제7-23) 고객 테이블에서 고객아이디가 5자인 고객의 고객아이디, 고객이름, 등급을 검색한다
SELECT 고객아이디, 고객이름, 등급
FROM 고객
WHERE 고객아이디 LIKE '_____';

-- 예제7-24) 고객 테이블에서 나이가 아직 입력되지 않은 고객의 고객이름을 검색한다
SELECT 고객이름
FROM 고객
WHERE 나이 IS NULL;

-- 예제7-25) 고객 테이블에서 나이가 이미 입력된 고객의 고객이름을 검색한다
SELECT 고객이름
FROM 고객
WHERE 나이 IS NOT NULL;

-- 예제7-26) 고객 테이블에서 고객이름, 등급, 나이를 검색하되, 나이를 기준으로 내림차순 정렬한다
SELECT 고객이름, 등급, 나이
FROM 고객
ORDER BY 나이 DESC;

-- 예제7-27) 주문 테이블에서 수량이 10개 이상인 주문의 주문고객, 주문제품, 수량, 주문일자를 검색한다. 
-- 단, 주문제품을 기준으로 오름차순 정렬하고, 동일 제품은 수량을 기준으로 내림차순 정렬한다​
SELECT 주문고객, 주문제품, 수량, 주문일자
FROM 주문
WHERE 수량 >= 10
ORDER BY 주문제품 ASC, 수량 DESC;

-- [실습2] 집계함수, group by(p235~243)

-- 예제7-28) 제품 테이블에서 모든 제품의 단가 평균을 검색한다
SELECT AVG(단가)
FROM 제품;

-- 예제7-29) 한빛제과에서 제조한 제품의 재고량 합계를 제품 테이블에서 검색한다
SELECT SUM(재고량)
FROM 제품
WHERE 제조업체 = '한빛제과';

-- 예제7-30) 고객 테이블에 고객이 몇 명 등록되어 있는지 검색한다

-- --1) 고객아이디 속성을 이용해 계산하는 경우
SELECT COUNT(고객아이디)
FROM 고객;

-- --2) 나이 속성을 이용해 계산하는 경우(널 값 제외)
SELECT COUNT(나이)
FROM 고객;

-- --3) * 을 이용해 계산하는 경우
SELECT COUNT(*)
FROM 고객;

-- 예제7-31) 제품 테이블에서 제조업체의 수를 검색한다
SELECT COUNT(제조업체)
FROM 제품;

-- 예제7-32) 주문 테이블에서 주문제품별 수량의 합계를 검색한다
SELECT SUM(수량)
FROM 주문
GROUP BY 주문제품;

-- 예제7-33) 제품 테이블에서 제조업체별로 제조한 제품의 개수와 제품 중 가장 비싼 단가를 검색하되, 
-- 제품의 개수는 제품수라는 이름으로 출력하고 가장 비싼 단가는 최고가라는 이름으로 출력한다​
SELECT 제조업체, COUNT(제품명) as 제품수, MAX(단가) as 최고가
FROM 제품
GROUP BY 제조업체;

-- 예제7-34) 제품 테이블에서 제품을 3개 이상 제조한 제조업체별로 제품의 개수와 제품 중
-- 가장 비싼 단가를 검색한다
SELECT 제조업체, COUNT(*), MAX(단가)
FROM 제품
GROUP BY 제조업체
HAVING COUNT(제조업체) >= 3;

-- 예제7-35) 고객 테이블에서 적립금 평균이 1000원 이상인 등급에 대해 
-- 등급별 고객 수와 적립금 평균을 검색한다
SELECT 등급, COUNT(*), AVG(적립금)
FROM 고객
GROUP BY 등급
HAVING AVG(적립금) >= 1000;

-- 예제7-36) 주문 테이블에서 각 주문고객이 주문한 제품의 총주문수량을 주문제품별로 검색한다
SELECT 주문제품, SUM(수량)
FROM 주문
GROUP BY 주문제품;

-- [실습3] 조인(p243~246)

-- 예제7-37) 판매 데이터베이스에서 banana 고객이 주문한 제품의 이름을 검색해보자

-- 방법1) SELECT … FROM … WHERE
SELECT 제품명
FROM 제품, 주문
WHERE 제품.제품번호 = 주문.주문제품 AND 주문고객 = 'banana';

-- 방법2) SELECT … FROM … ON​
SELECT 제품명
FROM 제품 INNER JOIN 주문
ON 제품.제품번호 = 주문.주문제품
WHERE 주문고객 = 'banana';

-- 7-38) 판매 데이터베이스에서 나이가 30세 이상의 고객이 주문한 제품의 주문제품과 주문일자를 검색하라
SELECT 주문제품, 주문일자
FROM 고객 INNER JOIN 주문
ON 고객.고객아이디=주문.주문고객
WHERE 나이 >= 30;

-- 예제7-39) 판매 데이터베이스에서 고명석 고객이 주문한 제품의 제품명을 검색하라
SELECT 고객아이디, 제품명
FROM 고객 INNER JOIN 주문
ON 고객.고객아이디 = 주문.주문고객
		INNER JOIN 제품
ON 주문.주문제품 = 제품.제품번호
WHERE 고객이름 = '고명석';

select * from 고객;
select * from 제품;
select * from 주문;


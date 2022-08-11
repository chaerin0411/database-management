/* customer(cno,cname,city,point) */
-- 고객(고객번호, 고객명, 거주지, 포인트)

-- 1-1) 테이블의 모든 열을 검색하라.
-- SELECT
-- FROM customer;

-- 1-2) 테이블의 모든 열을 검색(필드명 사용)
-- SELECT
-- FROM customer;

-- 1-3) 고객의 고객명, 거주지를 검색하라(테이블의 특정 열을 검색)
-- SELECT
-- FROM customer;

-- 1-4) cname은 성명, city는 거주지로 출력하라(화면에 표시되는 열 이름 변경하라)
-- SELECT
-- FROM customer;

-- 1-5) customer 테이블에서 거주지를 검색하라
-- SELECT
-- FROM customer;

-- 1-6) 거주지를 검색하는데 중복 행을 제거하여 한 번씩만 검색하라
-- SELECT
-- FROM customer;

/*
SELECT 필드명1, 필드명2
FROM 테이블명;

SELECT
FROM
WHERE
*/

-- 2-1) 고객번호가 c101인 고객의 모든 정보를 검색하라

-- (customer.sql)
-- drop database studydb;
create database studydb
	default character set utf8;

use studydb;

-- customer(cno,cname,city,point)
CREATE TABLE customer (
	cno char(4) NOT NULL,
    cname varchar(10) NOT NULL,
    city varchar(20),
    point int,
    CONSTRAINT pk_customer_cno PRIMARY KEY(cno)
);

-- customer(cno,cname,city,point)
INSERT INTO customer VALUES('c101','홍길동','서울',500);
INSERT INTO customer VALUES('c102','임꺽정','인천',300);
INSERT INTO customer VALUES('c103','박찬호','안양',800);
INSERT INTO customer VALUES('c204','신동엽','과천',350);
INSERT INTO customer VALUES('c205','정진우','고양',400);
-- NULL값 데이터 입력 (값을 알 수 없는 경우-값이 없는 경우가 아님)
INSERT INTO customer VALUES('c307','정동우','서울',NULL);

-- customer(cno,cname,city,point)


select * from customer;
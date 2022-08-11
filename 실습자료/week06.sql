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
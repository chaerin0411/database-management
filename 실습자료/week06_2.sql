-- (customer.sql)

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
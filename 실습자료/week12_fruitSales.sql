/* =================================================== */
-- 그릅화, 조인 실습용(quiz_fruitSales-k.sql)
/* =================================================== */


/* --------------과일판매 스키마------------------------------ */

-- (MySQL)
drop table if exists 판매상세;
drop table if exists 판매;
drop table if exists 거래처;
drop table if exists 과일;

create table 과일 (
과일번호 int NOT NULL ,
과일이름 varchar(30) ,
가격 int,
색상 char(12) ,
원산지 varchar(30) , 
PRIMARY KEY(과일번호)
);


CREATE TABLE 거래처 (
거래처번호 CHAR(6) NOT NULL ,
거래처이름 varchar(30) ,
담당자 varchar(10) ,
거래처주소 varchar(30) ,
거래처전화 varchar(13) ,
PRIMARY KEY (거래처번호)
);


CREATE TABLE 판매 (
판매번호 CHAR(12) NOT NULL ,
주문일자 CHAR(10) ,
결제방법 CHAR(4) ,
배송지 varchar(50) ,
거래처번호 CHAR(6) NOT NULL ,
PRIMARY KEY (판매번호) ,
FOREIGN KEY (거래처번호) REFERENCES 거래처(거래처번호)
);


CREATE TABLE 판매상세 (
판매번호 CHAR(12) NOT NULL ,
일련번호 int NOT NULL ,
과일번호 int NOT NULL ,
수량 int ,
PRIMARY KEY (판매번호, 일련번호) ,
FOREIGN KEY (판매번호) REFERENCES 판매(판매번호) ,
FOREIGN KEY (과일번호) REFERENCES 과일(과일번호)

);


insert into 과일 values('1','사과',2000,'빨간색','한국');
insert into 과일 values('2','배',5000,'노란색','한국');
insert into 과일 values('3','바나나',1500,'노란색','인도네시아');
insert into 과일 values('4','키위',4000,'초록색','호주');
insert into 과일 values('5','수박',8000,'초록색','한국');

insert into 과일 values('6','오렌지',1000,'주황색','한국');
insert into 과일 values('7','망고',5000,'노랑색','페루');
insert into 과일 values('8','체리',4800,'빨간색','소아시아');
insert into 과일 values('9','포도',2500,'보라색','한국');
insert into 과일 values('10','아보카도',2000,'초록색','남아프리카');

insert into 거래처 values('A-1001','과일나라','이효정','서울 서초','02-1111-1111');
insert into 거래처 values('A-1002','초록세상','김지명','서울 강서','02-2222-2222');
insert into 거래처 values('B-1001','영진상사','나준수','강원 삼척','033-5555-5555');
insert into 거래처 values('B-1002','명신무역','장명신','충남 서산','041-666-6666');
insert into 거래처 values('A-1003','신선상회','김민아','서울 영등포','02-3333-3333');

insert into 판매 values('201701040002','2017-01-04','카드','서울 서초','A-1001');
insert into 판매 values('201701160001','2017-01-16','현금','서울 강서','A-1002');
insert into 판매 values('201707010001','2017-07-01','카드','강원 삼척','B-1001');
insert into 판매 values('201703060002','2017-03-06','카드','서울 서초','A-1001');
insert into 판매 values('201704050001','2017-04-05','카드','충남 서산','B-1002');
insert into 판매 values('201705100002','2017-05-10','현금','서울 서초','A-1001');
insert into 판매 values('201706210001','2017-06-21','카드','강원 삼척','B-1001');

insert into 판매상세 values('201701040002',1,1,200);
insert into 판매상세 values('201701040002',2,2,150);
insert into 판매상세 values('201701160001',1,3,50);
insert into 판매상세 values('201707010001',1,3,120);
insert into 판매상세 values('201707010001',2,4,200);
insert into 판매상세 values('201707010001',3,5,50);
insert into 판매상세 values('201703060002',1,1,80);
insert into 판매상세 values('201704050001',1,4,100);
insert into 판매상세 values('201705100002',1,3,50);
insert into 판매상세 values('201706210001',1,5,150);

-- (Quiz08-05.sql)

-- 질병(질병코드, 질병명, 증상)
-- 환자(환자번호, 이름, 질병코드, 나이)

-- 테이블 삭제
drop table 환자;
drop table 질병;

-- 테이블 생성
-- 질병(질병코드, 질병명, 증상)
CREATE TABLE 질병 (
     질병코드 char(3) NOT NULL,
     질병명 varchar(20) NULL,
     증상 varchar(20) NULL,
     primary key(질병코드)
);
 
-- 환자(환자번호, 이름, 질병코드, 나이)
CREATE TABLE 환자 (
     환자번호 char(5) NOT NULL,
     이름 varchar(8) NULL,
     질병코드 char(3) NULL,
     나이 int NULL,
     primary key(환자번호) ,
     foreign key(질병코드) references 질병(질병코드)
);

-- 데이터 삽입
-- 질병(질병코드, 질병명, 증상)
insert into 질병 values('A01', '뇌졸증', '어지럼증');
insert into 질병 values('A02', '콜레라', '설사');
insert into 질병 values('A03', '기관지염', '발열');
insert into 질병 values('A04', '장티푸스', '발열');

-- 환자(환자번호, 이름, 질병코드, 나이)
insert into 환자(환자번호, 이름, 질병코드, 나이) values('P1001','김철수','A01',30);
insert into 환자(환자번호, 이름, 질병코드, 나이) values('P1002','양길현','A03',29);
insert into 환자(환자번호, 이름, 질병코드, 나이) values('P1003','임영수','A01',50);
insert into 환자(환자번호, 이름, 질병코드, 나이) values('Q1001','박한나','A04',40);

-- 데이터 조회
select * from 질병;
select * from 환자;

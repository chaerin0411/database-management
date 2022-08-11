--(DB03-02.sql)
-- 질병(질병코드, 질병명, 증상)
-- 환자(환자번호, 이름, 질병코드, 나이)

-- 테이블 생성
-- 질병(질병코드, 질병명, 증상)
CREATE TABLE 질병
(
	질병코드             CHAR(18) NOT NULL ,
	질병명               VARCHAR(18) NULL ,
	증상                 VARCHAR(18) NULL ,
    PRIMARY KEY (질병코드)
);

-- 환자(환자번호, 이름, 질병코드, 나이)
CREATE TABLE 환자
(
	환자번호             CHAR(18) NOT NULL ,
	이름                 VARCHAR(18) NULL ,
	질병코드             CHAR(18) NULL ,
	나이                 int NULL ,
    PRIMARY KEY (환자번호) ,
    FOREIGN KEY (질병코드) REFERENCES 질병(질병코드)
);

-- 데이터 입력
-- 질병(질병코드, 질병명, 증상)
insert into 질병 values('A01', '뇌졸증', '어지럼증');
insert into 질병 values('A02', '콜레라', '설사');
insert into 질병 values('A03', '기관지염', '발열');
insert into 질병 values('A04', '장티푸스', '발열');

-- 환자(환자번호, 이름, 질병코드, 나이)
insert into 환자 values('P1001', '김철수', 'A01', 30);
insert into 환자 values('P1002', '양길현', 'A03', 29);
insert into 환자 values('P1003', '임영수', 'A01', 50);
insert into 환자 values('Q1001', '박한나', 'A04', 40);

-- 데이터 조회
select * from 질병;
select * from 환자;

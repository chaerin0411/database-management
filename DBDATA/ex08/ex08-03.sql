--(ex08-03.sql)

-- 영화(영화코드, 영화제목, 장르, 관람기준, 상영시간)
-- 배우(배우번호, 배우이름, 성별)
-- 출연(일련번호, 영화코드, 배우번호, 출연료)

-- 테이블 삭제
drop table 출연;
drop table 영화;
drop table 배우;

-- 테이블 생성
-- 영화(영화코드, 영화제목, 장르, 관람기준, 상영시간)
create table 영화 (
    영화코드 char(4) NOT NULL PRIMARY KEY ,
    영화제목 varchar(50) NOT NULL ,
    장르 varchar(50) ,
    관람기준 int ,
    상영시간 int 
);
    
?-- 데이터 삽입
-- 영화(영화코드, 영화제목, 장르, 관람기준, 상영시간)
insert into 영화 values('MC01','과속스캔들','코미디',12,108);
insert into 영화 values('MC02','엽기적인그녀','코미디',15,122);
insert into 영화 values('MD01','키다리아저씨','드라마',12,110);
insert into 영화 values('MD02','바보','드라마',12,99);

?-- 테이블 생성
-- 배우(배우번호, 배우이름, 성별)
create table 배우 (
    배우번호 char(4) NOT NULL PRIMARY KEY ,
    배우이름 varchar(8) NOT NULL ,
    성별 char(3) 
);

?-- 데이터 삽입
-- 배우(배우번호, 배우이름, 성별)
insert into 배우 values('a001','차태현','남');
insert into 배우 values('a002','하지원','여');

-- 테이블 생성
?-- 출연(일련번호, 영화코드, 배우번호, 출연료)
create table 출연 (
    일련번호 int ,
    영화코드 char(4) NOT NULL ,
    배우번호 char(4) NOT NULL , 
    출연료 int ,
    CONSTRAINT PK_출연_일련번호 PRIMARY KEY(일련번호) ,
    FOREIGN KEY(영화코드) REFERENCES 영화코드(번호) ,
    FOREIGN KEY(배우번호) REFERENCES 배우번호(번호) ,
);

?-- 데이터 입력
-- 출연(일련번호, 영화코드, 배우번호, 출연료)
insert into 출연 values('MC01','a001',1000);
insert into 출연 values('MC02','a001',700);
insert into 출연 values('MD01','a002',400);
insert into 출연 values('MD02','a001',600);
insert into 출연 values('MD02','a002',600);


-- (Quiz08-04.sql)

-- 차량(사원번호, 종류)
-- 인사(성명, 소속, 사원번호)

-- 테이블 삭제
drop table 인사;
drop table 차량;

-- 테이블 생성
-- 차량(사원번호, 종류)
CREATE TABLE 차량 (
    사원번호 CHAR(2) NOT NULL ,
    종류 CHAR(1) NULL ,
    PRIMARY KEY (사원번호)
);

-- 인사(성명, 소속, 사원번호)
CREATE TABLE 인사 (
    성명 nvarchar2(3) NOT NULL ,
    소속 nvarchar2(3) NULL ,
    사원번호 CHAR(2) NULL ,
    PRIMARY KEY (성명) ,
    FOREIGN KEY (사원번호) REFERENCES 차량 (사원번호) 
    ON DELETE SET NULL
);

-- 데이터 입력
-- 차량(사원번호, 종류)
insert into 차량 values('23','A');
insert into 차량 values('25','B');
insert into 차량 values('43','C');
insert into 차량 values('56','D');

-- 인사(성명, 소속, 사원번호)
insert into 인사 values('김이순','총무과','25');
insert into 인사 values('박이준','자재과','56');
insert into 인사 values('이형수','영업과','23');
insert into 인사 values('오영우','보육과','43');

-- 데이터 조회
select * from 차량;
select * from 인사;

-- 다음 문법을 수행한 이후의 실행결과는?
select 종류
from 차량
where 사원번호 = (select 사원번호
                 from 인사
                 where 성명 = '오영우');
                 
-- 인라인 뷰(in-line view)
-- 이름 중에 '이' 가 들어가는 사원의 성명, 소속과 차량 종류를 검색하라
select t.성명, t.소속, 종류
from (select 성명, 소속, 사원번호
      from 인사
      where 성명 like '%이%') t, 차량
where t.사원번호 = 차량.사원번호;

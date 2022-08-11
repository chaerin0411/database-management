-- (studept-k.sql)

-- 사용할 데이터베이스 선택
use studydb;

 -- 테이블 삭제
 -- drop table 학과;
 drop table if exists 학과; -- (MySQL)
 
-- 테이블 생성
-- 학과(학과번호, 학과명)
create table 학과 (
	학과번호 int not null ,
    학과명 varchar(50) ,
    primary key(학과번호)
);

-- 데이터 입력
insert into 학과 values('1', '컴퓨터소프트웨어공학과'),
					  ('2', '컴퓨터정보공학과'),
                      ('3', '정보통신과');
                      
-- 데이터 검색
select * from 학과;
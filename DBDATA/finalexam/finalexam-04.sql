-- (finalexam-04.sql)

-- 부서(부서번호, 부서명, 위치)
-- 사원(사원, 이름, 연령, 급여, 부서번호)

-- 테이블 삭제
drop table 사원;
drop table 부서;

-- 테이블 생성
-- 부서(부서번호, 부서명, 위치)
CREATE TABLE 부서( 
  부서번호 int PRIMARY KEY, 
  부서명   char(15), 
  위치     char(15) 
); 

-- 사원(사원, 이름, 연령, 급여, 부서번호)
CREATE TABLE 사원( 
  사원 int PRIMARY KEY, 
  이름 char(10) NOT NULL , 
  연령 int,  
  급여 decimal(7,2) NOT NULL, 
  부서번호 int ,
  foreign key (부서번호) REFERENCES 부서(부서번호)
); 

-- 데이터 입력
-- 부서(부서번호, 부서명, 위치)
INSERT INTO 부서 VALUES(1, 'ACCOUNTING', 'SEOUL'); 

-- 사원(사원, 이름, 연령, 급여, 부서번호)
INSERT INTO 사원 VALUES(10, 'Jain', 20, 1000, 1); 
INSERT INTO 사원 VALUES(20, 'Tom', 21, 2000, 1); 

-- 데이터 검색
 select * from 부서; 
select * from 사원; 
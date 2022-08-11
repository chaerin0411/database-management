-- (finalexam-02.sql)

-- 학생(학번, 학생명,학년) 
-- 과목(과목번호, 과목명) 
-- 수강(학번, 과목번호, 중간,기말,학점) 
 
 -- 테이블 삭제
drop table if exists 수강; 
drop table if exists 학생; 
drop table if exists 과목; 
 
 -- 테이블 생성
 -- 학생(학번, 학생명,학년) 
create table 학생 ( 
  학번  char(5), 
  학생명  varchar(20), 
  학년  int, 
  primary key(학번) 
); 

-- 과목(과목번호, 과목명)
 create table 과목 ( 
  과목번호  char(5), 
  과목명  varchar(30), 
  primary key(과목번호) 
); 

-- 수강(학번, 과목번호, 중간,기말,학점) 
create table 수강 ( 
  학번 char(5), 
  과목번호  char(5), 
  중간 int, 
  기말 int, 
  학점 char(1), 
  primary key(학번, 과목번호), 
  foreign key (학번) references 학생(학번), 
  foreign key (과목번호) references 과목(과목번호) 
); 
 
 -- 데이터 입력
 -- 학생(학번, 학생명,학년) 
insert into 학생 values('111','홍길동',1); 
insert into 학생 values('222','김윤식',2); 
insert into 학생 values('333','이정진',1); 
insert into 학생 values('444','홍진아',2); 
insert into 학생 values('555','유동희',2); 
insert into 학생 values('666','이정무',1); 
insert into 학생 values('777','홍서범',1); 

-- 과목(과목번호, 과목명)
insert into 과목 values('CS310','데이터베이스'); 
insert into 과목 values('CS313','운영체제'); 
insert into 과목 values('CS345','자료구조'); 
insert into 과목 values('CS326','자바'); 
insert into 과목 values('CS546','DB프로그래밍'); 
insert into 과목 values('L001','인공지능'); 
insert into 과목 values('CS388','웹프로그래밍'); 

-- 수강(학번, 과목번호, 중간,기말,학점) 
insert into 수강 values('111','CS310',98,99,'A'); 
insert into 수강 values('111','CS313',88,86,'B'); 
insert into 수강 values('222','CS345',90,92,'A'); 
insert into 수강 values('333','CS546',78,84,'B'); 
insert into 수강 values('444','L001',86,70,'C'); 
insert into 수강 values('555','L001',94,90,'A'); 
insert into 수강 values('666','CS310',92,70,'B'); 

-- 데이터 검색
select * from 학생; 
select * from 과목; 
select * from 수강; 

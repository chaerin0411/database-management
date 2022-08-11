-- (finalexam-03-07.sql)

-- 교수(교수번호, 이름, 학과)
-- 학생 (학번, 이름, 학과)
-- 과목(과목번호, 과목명, 교수번호, 학점)
-- 수강(학번, 과목번호, 교수번호, 학점)

-- 테이블 삭제
drop table 수강;
drop table 과목;
drop table 학생;
drop table 교수;

-- 테이블 생성
-- 교수(교수번호, 이름, 학과)
create table 교수 (
	교수번호 char(4) not null ,
    이름 char(10) ,
    학과 varchar(10) ,
    primary key (교수번호)
);

-- 학생 (학번, 이름, 학과)
create table 학생 (
	학번 char(4) not null ,
    이름 char(10) ,
    학과 varchar(10) ,
    primary key (학번) ,
    foreign key (학과) references 교수(학과)
);

-- 과목(과목번호, 과목명, 교수번호, 학점)
create table 과목 (
	과목번호 char(4) not null ,
    과목명 varchar(10) ,
    교수번호 char(4) ,
    학점 int ,
    primary key (과목번호) ,
    foreign key (교수번호) references 교수(교수번호)
);

-- 수강(학번, 과목번호, 교수번호, 학점)
create table 수강 (
	학번 char(4) not null ,
    과목번호 char(4) ,
    교수번호 char(4) ,
    학점 char(4) ,
    primary key (학번, 과목번호) ,
    foreign key (학번) references 학생(학번) ,
    foreign key (과목번호) references 과목(과목번호) ,
    foreign key (교수번호) references 교수(교수번호)
);

-- 데이터 입력
-- 교수(교수번호, 이름, 학과)
insert into 교수 values('1000', '손기훈', '컴퓨터');
insert into 교수 values('2000', '남승민', '컴퓨터');
insert into 교수 values('3000', '양정상', '수학');
insert into 교수 values('4000', '장은상', '전자');
insert into 교수 values('5000', '김연호', '경영');

-- 학생 (학번, 이름, 학과)
insert into 학생 values('100', '강감찬', '컴퓨터');
insert into 학생 values('200', '안중근', '컴퓨터');
insert into 학생 values('300', '이순신', '수학');
insert into 학생 values('400', '김구', '전자');

-- 과목(과목번호, 과목명, 교수번호, 학점)
insert into 과목번호 values('C001', '데이터베이스', '1000', 3);
insert into 과목번호 values('C001', '데이터베이스', '2000', 3);
insert into 과목번호 values('C002', '자료구조', '1000', 3);
insert into 과목번호 values('M001', '이론수학', '3000', 3);
insert into 과목번호 values('E001', '회로이론', '4000', 3);

-- 수강(학번, 과목번호, 교수번호, 학점)
insert into 수강 values('100', 'C001', '1000', 'A+');
insert into 수강 values('200', 'C001', '2000', 'B+');
insert into 수강 values('200', 'C002', '1000', 'A');
insert into 수강 values('300', 'M001', '3000', 'C+');
insert into 수강 values('400', 'E001', '4000', 'B');

-- 데이터 검색
select * from 교수;
select * from 학생;
select * from 과목;
select * from 수강;

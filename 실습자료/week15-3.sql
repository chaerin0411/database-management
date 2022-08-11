use week15;

-- 다음 3개의 테이블 스키마를 보고 작성하시오
-- 학생(학번, 학생명, 학년)
-- 과목(과목번호, 과목명)
-- 수강(학번, 과목번호, 중간, 기말, 학점)

drop table if exists 수강;
drop table if exists 과목;
drop table if exists 교수;
drop table if exists 학생;

create table 학생 (
	학번 char(3),
	이름 varchar(20),
	학과 varchar(30),
	primary key(학번)
);

create table 교수 (
	교수번호 char(4),
    이름 varchar(20),
    학과 varchar(30),
    primary key(교수번호)
);

create table 과목 (
	과목번호 char(4),
	과목명 varchar(30),
    교수번호 char(4),
    학점 int,
	primary key(과목번호, 교수번호),
    foreign key(교수번호) references 교수(교수번호)
);

create table 수강 (
	학번 char(3),
	과목번호 char(4),
    교수번호 char(4),
	학점 varchar(2),
	primary key(학번, 과목번호),
	foreign key (학번) references 학생(학번),
	foreign key (과목번호) references 과목(과목번호),
    foreign key(교수번호) references 교수(교수번호)
);

insert into 학생 values('100', '강감찬', '컴퓨터');
insert into 학생 values('200', '안중근', '컴퓨터');
insert into 학생 values('300', '이순신', '수학');
insert into 학생 values('400', '김구', '전자');

insert into 교수 values('1000', '손기훈', '컴퓨터');
insert into 교수 values('2000', '남승민', '컴퓨터');
insert into 교수 values('3000', '양정상', '수학');
insert into 교수 values('4000', '장은상', '전자');
insert into 교수 values('5000', '김연호', '경영');

insert into 과목 values('C001', '데이터베이스', 1000, 3);
insert into 과목 values('C001', '데이터베이스', 2000, 3);
insert into 과목 values('C002', '자료구조', 1000, 3);
insert into 과목 values('M001', '이산수학', 3000, 3);
insert into 과목 values('E001', '회로이론', 4000, 3);

insert into 수강 values('100', 'C001', 1000, 'A+');
insert into 수강 values('200', 'C001', 2000, 'B+');
insert into 수강 values('200','C002', 1000, 'A');
insert into 수강 values('300','M001', 3000, 'C+');
insert into 수강 values('400','E001', 4000, 'B');

select * from 학생;
select * from 교수;
select * from 과목;
select * from 수강;

SET SQL_SAFE_UPDATES = 0;
UPDATE 교수
SET 교수번호= 2000
WHERE 이름='김연호';

DROP VIEW if exists 컴퓨터학과;
CREATE VIEW 컴퓨터학과
as 
SELECT 이름, 학과
FROM 학생
WHERE 학과= '컴퓨터';
SELECT * FROM 컴퓨터학과;
INSERT INTO 컴퓨터학과 VALUES('윤봉길','컴퓨터');

DROP VIEW if exists 교수별수강학생;
CREATE VIEW 교수별수강학생(교수번호, 학번, 과목번호, 성적)
as 
SELECT 교수번호, 학번, 과목번호, 성적
FROM   교수, 수강
WHERE  교수.교수번호=수강.교수번호;
-- CREATE VIEW 교수별수강학생(교수번호, 학번, 과목번호, 성적)
-- as 
-- SELECT 교수.교수번호, 학번, 과목번호, 학점 성적
-- FROM   교수, 수강
-- WHERE  교수.교수번호=수강.교수번호;
SELECT * FROM 교수별수강학생;
INSERT INTO 교수별수강학생(학번, 과목번호, 성적) VALUES('300','C002','B');

DROP VIEW if exists 교수명단;
CREATE VIEW 교수명단
as 
SELECT 교수번호, 이름
FROM  교수;
SELECT * FROM 교수명단;
INSERT INTO 교수명단 VALUES('6000','진상오');
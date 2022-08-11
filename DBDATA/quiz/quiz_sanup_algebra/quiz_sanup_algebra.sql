-- (quiz_sanup_algebra.sql)

-- 성적(이름, 국어, 영어, 수학, 과학)
-- 학적부(이름, 주소, 나이)

-- 테이블 생성
-- 성적(이름, 국어, 영어, 수학, 과학)
CREATE TABLE 성적 (
	이름 varchar(20) ,
	국어 int ,
    영어 int ,
    수학 int ,
    과학 int ,
    PRIMARY KEY(이름)
);

-- 학적부(이름, 주소, 나이)
CREATE TABLE 학적부 (
	이름 varchar(20) ,
	주소 varchar(50) ,
    나이 int ,
    PRIMARY KEY(이름) ,
    FOREIGN KEY(이름) REFERENCES 성적(이름)
);

-- 데이터 입력
-- 성적(이름, 국어, 영어, 수학, 과학)
insert into 성적 values('고길동',70,90,78,88);
insert into 성적 values('이순신',90,80,88,98);
insert into 성적 values('둘리',80,68,98,78);
insert into 성적 values('아무개',79,79,70,57);
insert into 성적 values('임꺽정',67,98,80,84);

-- 학적부(이름, 주소, 나이)
insert into 학적부 values('고길동','모진동',25);
insert into 학적부 values('이순신','화양동',20);
insert into 학적부 values('둘리','자양동',24);
insert into 학적부 values('아무개','화양동',19);
insert into 학적부 values('임꺽정','구의동',18);

-- 데이터 검색
select * from 성적;
select * from 학적부;
-- (테이블 3개) 학생, 수강, 과목 테이블 생성(기본키, 외래키)
--  테이블 삭제
drop table 수강;
drop table 과목;
drop table 학생;

-- 테이블 생성
-- 학생(학번, 학생명, 학년)
create table 학생 (
	학번 char(4) not null ,
    학생명 varchar(12) ,
    학년 int ,
    primary key (학번)
);

-- 과목(과목번호, 과목명)
create table 과목 (
	과목코드 char(5) ,
    과목명 varchar(30) ,
    primary key (과목코드)
);

-- 수강(학번, 과목번호, 성적)
create table 수강 (
	학번 char(4) ,
    과목번호 char(5) ,
    성적 int ,
    primary key (학번, 과목번호) ,
    foreign key (학번) references 학생(학번) ,
    foreign key (과목번호) references 과목(과목코드)
);

-- 데이터 입력
-- 학생(학번, 학생명, 학년)
insert into 학생 values('1111', '홍길동', 1);
insert into 학생 values('2222', '김윤식', 3);
insert into 학생 values('3333', '이정진', 2);
insert into 학생 values('4444', '홍진아', 1);

-- 과목(과목번호, 과목명)
insert into 과목 values('CS100', '데이터베이스');
insert into 과목 values('CS101', '운영체제');
insert into 과목 values('CS102', '자료구조');

-- 수강(학번, 과목번호, 성적)
insert into 수강 values('1111', 'CS100', 98);
insert into 수강 values('1111', 'CS102', 88);
insert into 수강 values('2222', 'CS102', 90);
insert into 수강 values('3333', 'CS100', 92);

-- 데이터 조회
select * from 학생;
select * from 과목;
select * from 수강;
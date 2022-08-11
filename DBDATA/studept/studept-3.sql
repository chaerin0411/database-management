-- (studept-3.sql)
-- 학과(학과번호, 학과명)
-- 학생(번호, 이름, 학년, 분반, 학과코드)

use studydb;

-- 테이블 삭제
drop table 학생;
drop table 학과;

-- 테이블 생성
-- 학과(학과번호, 학과명)
create table 학과 (
	학과번호 int not null ,
    학과명 varchar(50) ,
    primary key(학과번호)
);

-- 학생(번호, 이름, 학년, 분반, 학과코드)
create table 학생 (
	번호 int not null ,
    이름 varchar(12) ,
    학년 int ,
    분반 char(2) ,
    학과코드 int ,
    constraint pk_학생_번호 primary key(번호) ,
    constraint fk_학생_학과코드 foreign key(학과코드) references 학과(학과번호)
);

-- 데이터 입력
-- 학과(학과번호, 학과명)
insert into  학과 values(1, '컴퓨터소프트웨어공학과');
insert into  학과 values(2, '컴퓨터정보공학과');
insert into  학과 values(3, '정보통신과');

-- 학생(번호, 이름, 학년, 분반, 학과코드)
insert into 학생 values(1, '한지혜', 1, 'YB', 1);
insert into 학생 values(2, '이정우', 1, 'YA', 1);
insert into 학생 values(3, '오지영', 2, 'J1', 2);
insert into 학생 values(4, '강재미', 1, 'YB', 1);
insert into 학생 values(5, '박철호', 2, 'Y1', 2);

-- 데이터 검색
select * from 학과;
select * from 학생;
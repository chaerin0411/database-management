-- (practice-11.01.sql)
-- 테이블 3개 조인

-- 학생(학번, 학생명)
-- 과목(과목번호, 과목명)
-- 수강(학번, 과목번호, 성적)

use studydb;

-- 테이블 삭제
drop table if exists 수강;
drop table if exists 학생;
drop table if exists 과목;

-- 테이블 생성
-- 학생(학번, 학생명)
create table 학생 (
	학번 char(5),
	학생명 varchar(12),
	primary key(학번)
);

-- 과목(과목번호, 과목명)
create table 과목 (
	과목번호 char(5),
	과목명 varchar(30),
	primary key(과목번호)
);

-- 수강(학번, 과목번호, 성적)
create table 수강 (
	학번 char(5),
	과목번호 char(5),
	성적 int,
	primary key(학번, 과목번호),
	foreign key (학번) references 학생(학번),
	foreign key (과목번호) references 과목(과목번호)
);

-- 데이터 입력
-- 학생(학번, 학생명)
insert into 학생 values('11002','이홍근');
insert into 학생 values('24036','김순미');
insert into 학생 values('30419','박상웅');
insert into 학생 values('30555','홍서범');
insert into 학생 values('31890','유동희');
insert into 학생 values('31892','이정무');
insert into 학생 values('32000','김윤식');

-- 과목(과목번호, 과목명)
insert into 과목 values('CS310','데이터베이스');
insert into 과목 values('CS313','운영체제');
insert into 과목 values('CS345','자료구조');
insert into 과목 values('CS326','자바');
insert into 과목 values('CS546','DB프로그래밍');
insert into 과목 values('CS378','멀티미디어');
insert into 과목 values('CS388','웹프로그래밍');

-- 수강(학번, 과목번호, 성적)
insert into 수강 values('11002','CS310',98);
insert into 수강 values('11002','CS313',88);
insert into 수강 values('24036','CS345',90);
insert into 수강 values('30419','CS326',78);
insert into 수강 values('31892','CS388',86);
insert into 수강 values('32000','CS378',94);
insert into 수강 values('31890','CS310',92);

-- 데이터 검색
select * from 학생;
select * from 과목;
select * from 수강;
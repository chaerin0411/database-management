-- 테이블 3개 조인
-- 학생(학번, 학생명)
-- 과목(과목번호, 과목명)
-- 수강(학번, 과목번호, 성적)


use studydb;


drop table if exists 수강;
drop table if exists 학생;
drop table if exists 과목;


create table 학생 (
학번 char(5),
학생명 varchar(12),
primary key(학번)
);


create table 과목 (
과목번호 char(5),
과목명 varchar(30),
primary key(과목번호)
);


create table 수강 (
학번 char(5),
과목번호 char(5),
성적 int,
primary key(학번, 과목번호),
foreign key (학번) references 학생(학번),
foreign key (과목번호) references 과목(과목번호)
);


insert into 학생 values('11002','이홍근');
insert into 학생 values('24036','김순미');
insert into 학생 values('30419','박상웅');
insert into 학생 values('30555','홍서범');
insert into 학생 values('31890','유동희');
insert into 학생 values('31892','이정무');
insert into 학생 values('32000','김윤식');


insert into 과목 values('CS310','데이터베이스');
insert into 과목 values('CS313','운영체제');
insert into 과목 values('CS345','자료구조');
insert into 과목 values('CS326','자바');
insert into 과목 values('CS546','DB프로그래밍');
insert into 과목 values('CS378','멀티미디어');
insert into 과목 values('CS388','웹프로그래밍');


insert into 수강 values('11002','CS310',98);
insert into 수강 values('11002','CS313',88);
insert into 수강 values('24036','CS345',90);
insert into 수강 values('30419','CS326',78);
insert into 수강 values('31892','CS388',86);
insert into 수강 values('32000','CS378',94);
insert into 수강 values('31890','CS310',92);


select * from 학생;
select * from 과목;
select * from 수강;

-- ----------------------------------

-- 2-1) 수강한 학생의 학생명, 과목명, 성적을 검색하라(내부조인)
SELECT	학생명, 과목명, 성적
FROM	학생, 수강, 과목
WHERE	학생.학번=수강.학번 AND 과목.과목번호=수강.과목번호;

SELECT	학생명, 과목명, 성적
FROM	학생 INNER JOIN 수강
ON		학생.학번=수강.학번
			INNER JOIN 과목
ON		과목.과목번호=수강.과목번호;

-- 2-2) 이홍근의 학생명, 과목명, 성적을 검색하라
SELECT	학생명, 과목명, 성적
FROM	학생, 수강, 과목
WHERE	학생.학생명='이홍근' AND 학생.학번=수강.학번 AND 과목.과목번호=수강.과목번호;

SELECT	학생명, 과목명, 성적
FROM	학생 INNER JOIN 수강
ON	학생.학번=수강.학번
			INNER JOIN 과목
ON	과목.과목번호=수강.과목번호
WHERE 학생.학생명='이홍근';

-- 2-3) 전체 학생의 학생명, 과목명, 성적을 검색하라(외부조인)
SELECT	학생명, 과목명, 성적
FROM	학생 LEFT OUTER JOIN 수강
ON		학생.학번 = 수강.학번
			LEFT OUTER JOIN 과목
ON		수강.과목번호 = 과목.과목번호;

-- ----------------------------------

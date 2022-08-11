use week15;

-- 다음 3개의 테이블 스키마를 보고 작성하시오
-- 학생(학번, 학생명, 학년)
-- 과목(과목번호, 과목명)
-- 수강(학번, 과목번호, 중간, 기말, 학점)

drop table if exists 수강;
drop table if exists 학생;
drop table if exists 과목;

create table 학생 (
학번 char(5),
학생명 varchar(20),
학년 int,
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
중간 int,
기말 int,
학점 char(1),
primary key(학번, 과목번호),
foreign key (학번) references 학생(학번),
foreign key (과목번호) references 과목(과목번호)
);

insert into 학생 values('111', '홍길동', 1);
insert into 학생 values('222', '김윤식', 2);
insert into 학생 values('333', '이정진', 1);
insert into 학생 values('444', '홍진아', 2);
insert into 학생 values('555', '유동희', 2);
insert into 학생 values('666', '이정무', 1);
insert into 학생 values('777', '홍서범', 1);

insert into 과목 values('CS310', '데이터베이스');
insert into 과목 values('CS313', '운영체제');
insert into 과목 values('CS345', '자료구조');
insert into 과목 values('CS326', '자바');
insert into 과목 values('CS546', 'DB 프로그래밍');
insert into 과목 values('L001', '인공지능');
insert into 과목 values('CS388', '웹프로그래밍');

insert into 수강 values('111', 'CS310', 98, 99, 'A');
insert into 수강 values('111', 'CS313', 88, 86, 'B');
insert into 수강 values('222','CS345', 90, 92, 'A');
insert into 수강 values('333','CS546', 78, 84, 'B');
insert into 수강 values('444','L001', 86, 70, 'C');
insert into 수강 values('555','L001', 94, 90, 'A');
insert into 수강 values('666','CS310', 92, 70, 'B');

select * from 학생;
select * from 과목;
select * from 수강;

-- 다음에 대하여 문제, SQL문법, 실행결과를 작성하시오

-- 2-1) 수강 테이블에서 L로 시작하는 과목의 중간성적이 90점 이상인
-- 학생의 이름과 기말성적을 검색하는 SQL 문을 작성하시오.
-- 단, 이름을 기준으로 오름차순 정렬하고,
-- 만약 이름이 같으면 기말성적을 기준으로 내림차순 정렬하시오.

select	학생명 이름, 기말 기말성적
from	학생, 수강
where	학생.학번=수강.학번
	and 과목번호 like 'L%'
    and 중간>=90
order by 학생명 ASC, 기말 DESC;

-- 2-2) 수강 테이블에서 학생이 수강하는 과목에 대해
-- 과목별 등록 학생의 수와 중간성적의 평균을 구하는 SQL 문을 작성하시오.
-- 이 때, 등록한 학생의 총 수는 '학생수'로,
-- 중간성적의 평균은 '중간성적평균'으로 속성 이름을 새로 부여하시오.

select	과목번호, count(학번) 학생수, AVG(중간) 중간성적평균
from	수강
group by 과목번호;

-- 2-3) L001 과목을 수강하지 않는 학생의 이름과 학년을 검색하는 SQL 문을 작성하시오.
-- 단, IN 연산자를 이용해 작성하시오(하위질의)
select	학생명 이름, 학년
from	학생
where	학번 in (
	select	학번
    from	수강
    where	과목번호<>'L001'
);
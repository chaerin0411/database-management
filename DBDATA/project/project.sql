-- (project.sql)
-- project 테이블 생성

create table project (
	 projno int not null ,
     projname char(20) ,
     period int
);

desc project;

-- project(projno, projname, period)

-- 필드 추가
-- project(projno, projname, period, budget)
alter table project
add budget int;

-- 필드 수정
-- projname char(20) -> varchar(30)
-- (MySQL) (Oracle)
alter table project
modify projname varchar(30);

-- (MS SQL)
alter table project
alter column projname varchar(30);

-- 필드 삭제
alter table project
drop column budget;

-- 기본키 추가
alter table project
add constraint pk_project_projno primary key (projno);

-- 기본키 삭제
alter table project
drop primary key;

-- 데이터 입력
insert into project values(111, '작전중', 2);
insert into project values(222, '특공대', 3);
insert into project values(444, '다모여', 1);
insert into project values(333, '유레카', 2);

-- 데이터 조회
select * from project;
-- (ex08-08.sql)

-- 교수(ID, 이름)
-- 학생(학번, 이름, 전공, 지도교수)

-- 1-1) 학생, 교수 2개의 엔티티를 관계설정하여 Erwin 에서 작성하시오 (논리적설계 화면캡처)
-- 1-2) 학생, 교수 엔티티를 생성하는 SQL 문법을 작성하시오(MS SQL 또는 Oracle 에서 실습)
-- 1-3) 학생, 교수 테이블에 데이터입력하는 SQL문법을 작성하고 데이터 조회 하시오 (데이터 조회 화면캡처)

-- 테이블 삭제
drop table 학생;
drop table 교수;

-- 테이블 생성
-- 교수(ID, 이름)
create table 교수 (
    ID char(4) not null ,
    이름 varchar(10) ,
    primary key(ID)
);

-- 학생(학번, 이름, 전공, 지도교수)
create table 학생 (
    학번 char(10) not null ,
    이름 varchar(20) ,
    전공 varchar(20) ,
    지도교수 char(4) ,
    primary key(학번) ,
    foreign key(지도교수) references 교수(ID)
);

-- 데이터 입력
-- 교수(ID, 이름)
insert into 교수 values('P001', '한성식');
insert into 교수 values('P002', '김설훈');
insert into 교수 values('P003', '박광민');

-- 학생(학번, 이름, 전공, 지도교수)
insert into 학생 values('2003001', '김철수', '국문학', 'P001');
insert into 학생 values('2003002', '박선하', '국문학', 'P002');
insert into 학생 values('2003003', '안미희', '컴퓨터공학', 'P001');
insert into 학생 values('2003004', '유창식', '컴퓨터공학', 'P003');
insert into 학생 values('2003005', '임한솔', '산업공학', 'P002');

-- 데이터 검색
select * from 교수;
select * from 학생;

-- 1-4) 다음 SQL 문법을 작성하시오
--a) 이름이 유창식 인 학생의 모든 정보를 검색하라
select *
from 학생
where 이름 = '유창식';

--b) 학생이름과 지도교수 이름을 검색하라
select 학생.이름 as 학생이름, 교수.이름 as "지도교수 이름"
from 학생, 교수
where 학생.지도교수 = 교수.ID;

--c) 전공이 컴퓨터공학 인 학생 이름과 지도교수 이름을 검색하라
select 학생.이름 as 학생이름, 교수.이름 as "지도교수 이름"
from 학생, 교수
where 학생.지도교수 = 교수.ID
and 전공 = '컴퓨터공학';

--d) 전공이 국문학 이거나 산업공학 인 학생 수를 검색하라
select 전공, count(*)
from 학생
where 전공 in('국문학', '산업공학')
group by 전공;


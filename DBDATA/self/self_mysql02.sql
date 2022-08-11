-- (self_mysql02.sql)
-- prof_self(교수번호,주민등록번호,이름,학과명,학과장)

-- 테이블 삭제
drop table prof_self;

-- 테이블 생성
-- prof_self(교수번호,주민등록번호,이름,학과명,학과장)
CREATE TABLE prof_self ( 
	교수번호 char(5) NOT NULL ,
	주민등록번호 char(14) NOT NULL ,
	이름 varchar(20) NOT NULL ,
	학과명 varchar(20) NOT NULL ,
	학과장 char(5) ,
    CONSTRAINT pk_profself_교수번호 PRIMARY KEY(교수번호)
);

-- 데이터 조회
-- prof_self(교수번호,주민등록번호,이름,학과명,학과장)
insert into prof_self values('92001','590327-1839240','이태규','컴퓨터공학과','92001');
insert into prof_self values('92002','690702-1350026','고희석','컴퓨터공학과','92001');
insert into prof_self values('92301','741011-2765501','최성희','산업공학과','92302');
insert into prof_self values('92302','750728-1102458','김태석','산업공학과','92302');
insert into prof_self values('92501','620505-1400546','박철재','전자공학과',NULL);
insert into prof_self values('92502','740101-1830264','장민석','전자공학과',NULL);

-- 데이터 검색
select * from prof_self;

-- [자체조인 3]
-- prof_self(교수번호,주민등록번호,이름,학과명,학과장)
-- 학과명, 학과장이름 을 검색하라
select P1.학과명, P2.이름 as '학과장이름'
from prof_self P1, prof_self P2
where P1.학과장 = P2.교수번호;

-- 중복 제거
select distinct P1.학과명, P2.이름 as '학과장이름'
from prof_self P1, prof_self P2
where P1.학과장 = P2.교수번호;

-- 교수이름, 학과명, 학과장이름 을 검색하라
select P1.이름 as '교수이름', P1.학과명, P2.이름 as '학과장이름'
from prof_self P1, prof_self P2
where P1.학과장 = P2.교수번호;
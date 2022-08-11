/*---------------스키마--------------------------------*/

-- prof_self(교수번호,주민등록번호,이름,학과명,학과장)
drop table if exists prof_self;

CREATE TABLE prof_self ( 
교수번호 char(5) NOT NULL ,
주민등록번호 char(14) NOT NULL ,
이름 varchar(20) NOT NULL ,
학과명 varchar(20) NOT NULL ,
학과장 char(5) ,
CONSTRAINT pk_profself_교수번호 PRIMARY KEY(교수번호)
);

insert into prof_self values('92001','590327-1839240','이태규','컴퓨터공학과','92001');
insert into prof_self values('92002','690702-1350026','고희석','컴퓨터공학과','92001');
insert into prof_self values('92301','741011-2765501','최성희','산업공학과','92302');
insert into prof_self values('92302','750728-1102458','김태석','산업공학과','92302');
insert into prof_self values('92501','620505-1400546','박철재','전자공학과',NULL);
insert into prof_self values('92502','740101-1830264','장민석','전자공학과',NULL);

select * from prof_self;

/* ------------------------------------------------------ */

-- prof_self(교수번호,주민등록번호,이름,학과명,학과장)
-- 학과명, 학과장이름을 검색하라
select	p1.이름 as 교수이름, p1.학과명 as 학과명, p2.이름 as 학과장이름
from	prof_self p1, prof_self p2
where	p1.학과장 = p2.교수번호;


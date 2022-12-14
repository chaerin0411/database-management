-- ----------------------------------

-- stu(sno, sname, dept, sage)
-- pro(pno, pname, dept, page)

CREATE TABLE pro (
pno char(2),
pname varchar(20), 
dept varchar(20),
page int,
primary key(pno)
);

CREATE TABLE stu (
sno char(2),
sname varchar(20), 
dept varchar(20),
sage int,
primary key(sno)
);


insert into pro values('p1','이정무','컴퓨터',36);
insert into pro values('p2','우태하','컴퓨터',32);
insert into pro values('p3','이성민','건축',45);

insert into stu values('s1','유준호','컴퓨터',23);
insert into stu values('s2','오정민','컴퓨터',34);
insert into stu values('s3','이태현','건축',22);
insert into stu values('s4','신현주','건축',21);

select * from pro;
select * from stu;

-- --------------------------

-- stu(sno, sname, dept, sage)
-- pro(pno, pname, dept, page)

-- 3-1) 교수 테이블에서 이정무 의 학과와 같은 학생 이름, 학과, 나이를 검색하라
select	sname 학생이름, dept 학과, sage 나이
from	stu
where	dept=(
	select	dept
	from	pro
    where	pname='이정무'
);

-- 3-2) 교수 테이블에서 pno 가 p1 이거나 p2 인 학과와 같은 학생 이름, 학과, 나이를 검색하라
select	sno 학생이름, dept 학과, sage 나이
from	stu
where	dept in (
	select	dept
    from	pro
    where	pno in ('p1', 'p2')
);

-- 3-3) 학생 테이블과 교수 테이블에서 모든 학생들보다 나이가 많은 교수의
-- 교번, 이름, 나이를 ALL 구문을 이용하여 검색하라
select	pno 교번, pname 이름, page 나이
from	pro
where	page > ALL(
	select	sage
    from	stu
);

-- 3-4) 학생 테이블과 교수 테이블에서 한 명 이상 교수보다 
-- 나이가 많은 학생이 있을 경우 학생의 학번, 이름, 나이를 SOME 구문으로 검색하라
select	sno, sname, sage
from	stu
where	sage > SOME(
	select	page
    from	pro
);

-- 3-5) 가장 나이가 많은 학생의 이름, 나이를 검색하라
select	sname, sage
from	stu
where	sage = (
	select	MAX(sage)
    from	stu
);

-- 3-6) 각 학과마다 가장 나이가 많은 학생의 이름, 학과, 나이를 검색하라

-- ----------------------------------------------
-- (join02-stu.sql)
-- freshman(name, address)
-- dmember(name, dept_name)

drop table if exists freshman;
drop table if exists dmember;

-- 테이블 생성
-- freshman(name, address)
CREATE TABLE freshman ( 

name VARCHAR(12) NOT NULL ,

address VARCHAR(9)

);

-- dmember(name, dept_name)
CREATE TABLE dmember ( 

name VARCHAR(12) NOT NULL ,

dept_name VARCHAR(30)

);

-- 데이터 입력
-- freshman(name, address)
INSERT INTO freshman VALUES('김광식', '서울');
INSERT INTO freshman VALUES('김현정', '대전');
INSERT INTO freshman VALUES('조영수', '대전');

-- dmember(name, dept_name)
INSERT INTO dmember VALUES('김광식', '컴퓨터공학과');
INSERT INTO dmember VALUES('김현정', '산업공학과');
INSERT INTO dmember VALUES('이진영', '전자공학과');

-- 데이터 조회
SELECT * FROM freshman;
SELECT * FROM dmember;

-- 1) product
select *
from freshman, dmember;

-- 2) 동등조인
select *
from freshman, dmember
where freshman.name = dmember.name;

select *
from freshman inner join dmember
on freshman.name = dmember.name;

-- 자연조인
select freshman.name, address, dept_name
from freshman, dmember
where freshman.name = dmember.name;

select freshman.name, address, dept_name
from freshman inner join dmember
on freshman.name = dmember.name;

-- 왼쪽외부조인
select *
from freshman left outer join dmember
on freshman.name = dmember.name;

-- 오른쪽외부조인
select *
from fre shman right outer join dmember
on freshman.name = dmember.name;
 
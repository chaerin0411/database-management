-- (ehan_ch2_outerjoin-stu.sql)

-- freshman(name, address)
-- dmember(name, dept_name)

-- 1) 내부조인(동등조인)
SELECT *
FROM freshman, dmember
WHERE freshman.name = dmember.name;

select *
from freshman F, dmember D
where F.name = D.name;

select *
from freshman F inner join dmember D
on F.name = D.name;

-- 2) 내부조인(자연조인)
SELECT freshman.name, address, dept_name
FROM freshman, dmember
WHERE freshman.name = dmember.name;

SELECT freshman.name, address, dept_name
FROM freshman INNER JOIN dmember
ON freshman.name = dmember.name;

select F.name, address, dept_name
from freshman F, dmember D
where F.name = D.name;

select F.name, address, dept_name
from freshman F inner join dmember D
on F.name = D.name;

-- 3) 왼쪽외부조인
SELECT freshman.name, address, dept_name
FROM freshman LEFT OUTER JOIN dmember
ON freshman.name = dmember.name;

select *
from freshman left outer join dmember
on freshman.name = dmember.name;

select F.name, address, dept_name
from freshman F left outer join dmember D
on F.name = D.name;

select F.name, address, D.name, dept_name
from freshman F left outer join dmember D
on F.name = D.name;

-- 4) 오른쪽외부조인
SELECT freshman.name, address, dept_name
FROM freshman RIGHT OUTER JOIN dmember
ON freshman.name = dmember.name;

select F.name, address, D.name, dept_name
from freshman F right outer join dmember D
on F.name = D.name;

select *
from freshman F right outer join dmember D
on F.name = D.name;

-- 5) 완전외부조인 (MySQL 실행 안 됨)
SELECT freshman.name, address, dept_name
FROM freshman FULL OUTER JOIN dmember
ON freshman.name = dmember.name;
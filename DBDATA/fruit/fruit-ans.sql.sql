-- (fruit-ans.sql)

-- fruit(과일번호, 과일이름, 가격, 색상, 원산지)
-- 2-1) 노란색 과일의 이름, 색상을 검색하라
select 과일이름, 색상
from fruit
where 색상='노란색';

-- 2-2) 과일이름을 오름차순으로 정렬하여 모든 필드를 검색하라
select *
from fruit
order by 과일이름 asc;

-- 2-3) 가격이 5000 이하인 빨간색 과일의 이름을 검색하라
select 과일이름
from fruit
where 가격 <= 5000 and 색상 = '빨간색';
 
-- 2-4) 가격이 2000 ~ 5000 사이의 과일이름과 가격을 검색하라(BETWEEN AND)
select 과일이름, 가격
from fruit
where 가격 between 2000 and 5000;

-- 2-5) 색상이 노란색이거나 초록색인 과일이름, 색상을 검색하라(IN 사용)
select 과일이름, 색상
from fruit
where 색상 in('노란색', '초록색');

-- 2-6) 색상이 노란색이거나 초록색인 과일이름, 색상을 검색하라(논리연산자 OR 사용)
select 과일이름, 색상
from fruit
where 색상='노란색'or 색상='초록색';

-- 2-7) 원산지가 한국이 아닌 과일이름, 원산지를 검색하라
select 과일이름, 원산지
from fruit
where 원산지 <> '한국';

-- fruit(과일번호, 과일이름, 가격, 색상, 원산지)
select * from fruit;
set sql_safe_updates = 0;

-- 3-1) UPDATE 문을 이용하여 사과의 가격을 2배로 하여 수정하라
update fruit
set 가격 = 가격*2
where 과일이름='사과';

-- 3-2) DELETE 문을 이용하여 원산지가 호주인 과일의 목록을 삭제하라
delete
from fruit
where 원산지='호주';

-- 3-3) ALTER TABLE 문을 이용하여 과일정보 필드를 추가하라VT(데이터형식 varchar(20))
alter table fruit
add 과일정보 varchar(20);
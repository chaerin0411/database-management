-- (customerselect.sql)
/* ------------------------------------------------- */
-- [실습] (select 기초, null, like, order by)

/* 새 레코드를 추가하고 select문 예제 실습하시오 */
-- customer(cno, cname, city, point)
-- 고객(고객번호, 고객명, 거주지, 포인트)

/* select 필드명1, 필드명2, ...
   from 테이블명
   
   select
   from
   where */

/* 관계 연산자   
	>, >=, <>, <=, < */
    
/* 논리 연산자
	not, and, or */
   
/* 문자열 검색
	% 0개 이상 검색
	_ 1개 이상 검색 */

/* null 값 검색
	is null
    is not null */
    
/* 정렬: order by
	오름차순 (Ascending order) ASC
    내림차순 (Descending order) DESC */

-- 문제
-- 1-1) 테이블의 모든 열을 검색하라

-- 1-2) 테이블의 모든 열을 검색(필드명 사용)

-- 1-3) 고객의 고객명, 거주지를 검색하라(테이블의 특정 열을 검색)

-- 1-4) cname은 성명, city는 거주지로 출력하라(화면에 출력되는 열 이름을 변경하여

-- 1-5) customer 테이블에서 거주지를 검색하라

-- 1-6) 거주지를 검색하는데 중복 행을 제거하여 한번씩만 검색하라

-- 2-1) 고객번호가 c101인 고객의 모든 정보를 검색하라

-- 2-2) 포인트가 400 이하인 고객의 모든 정보를 검색하라

-- 2-3) 거주지가 서울이면서 포인트가 500 이상인 고객의 이름, 거주지, 포인트를 검색하라

-- 2-4) 거주지가 서울이거나 포인트가 500 이상인 고객의 이름, 거주지, 포인트를 검색하라

-- 2-5) 포인프가 350부터 500 사이인 고객이름, 거주지, 포인트를 검색하라
-- 부등호 사용
-- between ... and 사용

-- 2-6) 거주지가 서울이거나 안양인 고객의 고객번호, 이름, 거주지를 검색하라
-- 부등호 사용
-- in() 사용

-- 2-7) 거주지가 서울이 아니거나 안양이 아닌 고객의 고객번호, 이름, 거주지를 검색하라
-- 부등호 사용
-- not in() 사용

-- 3-1) 정씨 성을 가진 고객의 모든 열을 검색하라

-- 3-2) 이름에 '동'자가 들어가는 고객의 모든 열을 검색하라

-- 3-3) 이름의 세번째 글자가 '우'자인 고객의 모든 열을 검색하라

-- 3-4) 성이 홍씨, 박씨, 정씨인 고객을 검색하라

-- 3-5) 성이 홍씨, 박씨, 정씨가 아닌 고객을 검색하라

-- 3-6) 포인트가 없는 고객의 번호, 이름, 포인트를 검색하라

-- 3-7) 포인트가 있는 고객의 번호, 이름, 포인트를 검색하라

-- 4-1) 고객 테이블에서 이름을 오름차순 정렬하라

-- 4-2) 거주지가 서울인 고객의 모든 데이터를 검색하는데, 이름의 오름차순 정렬하여 출력하라

-- 4-3) 거주지의 오름차순으로 정렬하고, 거주지가 같으면 포인트의 내림차순으로 정렬하라

-- 4-4) 포인트가 많은 순으로(내림차순) 먼저 정렬하고, 같은 포인트는 이름의 오름차순으로 정렬하고 이름이 같으면 거주지의 오름차순으로 정렬하여 검색하라

-- 4-5) 다음의 의미는?
select cno, cname, city, point
from customer
order by 3;

-- 답안
-- customer(cno, cname, city, point)

-- 1-1) 테이블의 모든 열을 검색하라
select *
from customer;

-- 1-2) 테이블의 모든 열을 검색(필드명 사용)
select cno, cname, city, point
from customer;

-- 1-3) 고객의 고객명, 거주지를 검색하라(테이블의 특정 열을 검색)
select cname, city
from customer;

-- 1-4) cname은 성명, city는 거주지로 출력하라(화면에 출력되는 열 이름을 변경하여
select cname 성명, city 거주지
from customer;

-- 1-5) customer 테이블에서 거주지를 검색하라
select city
from customer;

-- 1-6) 거주지를 검색하는데 중복 행을 제거하여 한번씩만 검색하라
select distinct city
from customer;

-- 2-1) 고객번호가 c101인 고객의 모든 정보를 검색하라
select *
from customer
where cno = 'c101';

-- 2-2) 포인트가 400 이하인 고객의 모든 정보를 검색하라
select *
from customer
where point <= 400;

-- 2-3) 거주지가 서울이면서 포인트가 500 이상인 고객의 이름, 거주지, 포인트를 검색하라
select cname, city, point
from customer
where city = '서울' and point >= 500;

-- 2-4) 거주지가 서울이거나 포인트가 500 이상인 고객의 이름, 거주지, 포인트를 검색하라
select cname, city, point
from customer
where city = '서울' or point >= 500;

-- 2-5) 포인프가 350부터 500 사이인 고객이름, 거주지, 포인트를 검색하라
-- 부등호 사용
select *
from customer
where point >= 350 and point <= 500;

-- between ... and 사용
select *
from customer
where point between 350 and 500;

-- 2-6) 거주지가 서울이거나 안양인 고객의 고객번호, 이름, 거주지를 검색하라
-- 부등호 사용
select cno, cname, city
from customer
where city = '서울' or city = '안양';

-- in() 사용
select cno, cname, city
from customer
where city in ('서울', '안양');

-- 2-7) 거주지가 서울이 아니거나 안양이 아닌 고객의 고객번호, 이름, 거주지를 검색하라
-- 부등호 사용
select cno, cname, city
from customer
where city <> '서울' and city <> '안양';

-- not in() 사용
select cno, cname, city
from customer
where city not in ('서울', '안양');

-- 3-1) 정씨 성을 가진 고객의 모든 열을 검색하라
select *
from customer
where cname like '정%';

-- 3-2) 이름에 '동'자가 들어가는 고객의 모든 열을 검색하라
select *
from customer
where cname like '%동%';

-- 3-3) 이름의 세번째 글자가 '우'자인 고객의 모든 열을 검색하라
select *
from customer
where cname like '__우';

-- 3-4) 성이 홍씨, 박씨, 정씨인 고객을 검색하라
select *
from customer
where cname like '홍%' or cname like '박%' or cname like '정%';

-- 3-5) 성이 홍씨, 박씨, 정씨가 아닌 고객을 검색하라
select *
from customer
where cname not like '홍%' and cname not like '박%' and cname not like '정%';

-- 3-6) 포인트가 없는 고객의 번호, 이름, 포인트를 검색하라
select cno, cname, point
from customer
where point is null;

-- 3-7) 포인트가 있는 고객의 번호, 이름, 포인트를 검색하라
select cno, cname, point
from customer
where point is not null;

-- 4-1) 고객 테이블에서 이름을 오름차순 정렬하라
select *
from customer
order by cname ASC;

-- 4-2) 거주지가 서울인 고객의 모든 데이터를 검색하는데, 이름의 오름차순 정렬하여 출력하라
select *
from customer
where city = '서울'
order by cname ASC;

-- 4-3) 거주지의 오름차순으로 정렬하고, 거주지가 같으면 포인트의 내림차순으로 정렬하라
select *
from customer
order by city ASC, point DESC;

-- 4-4) 포인트가 많은 순으로(내림차순) 먼저 정렬하고, 같은 포인트는 이름의 오름차순으로 정렬하고 이름이 같으면 거주지의 오름차순으로 정렬하여 검색하라
select *
from customer
order by point DESC, cname ASC, city ASC;

-- 4-5) 다음의 의미는?
select cno, cname, city, point
from customer
order by 3;
-- select의 3번재(city) 필드를 기준으로 오름차순으로 정렬하라
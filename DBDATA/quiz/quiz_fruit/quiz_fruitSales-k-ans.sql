-- (quiz_fruitSales-k-ans.sql)

/* --------------과일판매 스키마------------------------------ */
-- (MySQL)
-- 과일(과일번호,과일이름,가격,색상,원산지)
-- 거래처(거래처번호,거래처이름,담당자,거래처주소,거래처전화)
-- 판매(판매번호,주문일자,결제방법,배송지,거래처번호)
-- 판매상세(판매번호,일련번호,과일번호,수량)

-- 1) 원산지별 원산지, 과일수(과일개수:과일수량)을 검색해라
select 원산지, count(*) as '과일수량'
from 과일
group by 원산지;

-- 2) 거래처이름에 '상' 자가 들어가는 거래처이름, 담당자를 검색하라
select 거래처이름, 담당자
from 거래처
where 거래처이름 like '%상%';

-- 과일(과일번호,과일이름,가격,색상,원산지)
-- 거래처(거래처번호,거래처이름,담당자,거래처주소,거래처전화)
-- 판매(판매번호,주문일자,결제방법,배송지,거래처번호)
-- 판매상세(판매번호,일련번호,과일번호,수량)

-- 3) 거래처번호, 판매번호, 주문일자, 결제방법을 검색하라
-- 단, 거래처번호를 오름차순하여 정렬하라, 거래처번호가 같으면 주문일자의 내림차순 정렬
select 거래처.거래처번호, 판매번호, 주문일자, 결제방법
from 거래처, 판매
where 거래처.거래처번호 = 판매.거래처번호
order by 거래처번호 asc, 주문일자 desc;

select 거래처.거래처번호, 판매번호, 주문일자, 결제방법
from 거래처 inner join 판매
on 거래처.거래처번호 = 판매.거래처번호
order by 거래처번호 asc, 주문일자 desc;

select A.거래처번호, 판매번호, 주문일자, 결제방법
from 거래처 A, 판매 B
where A.거래처번호 = B.거래처번호
order by 거래처번호 asc, 주문일자 desc;

-- 4) 거래처번호별로 거래처번호, 개수를 검색하라
select 거래처번호, count(*)
from 거래처
group by 거래처번호;

-- 과일(과일번호,과일이름,가격,색상,원산지)
-- 거래처(거래처번호,거래처이름,담당자,거래처주소,거래처전화)
-- 판매(판매번호,주문일자,결제방법,배송지,거래처번호)
-- 판매상세(판매번호,일련번호,과일번호,수량)

-- 5) 과일이름, 가격, 거래처이름, 거래처주소를 검색하라
select 과일이름, 가격, 거래처이름, 거래처주소
from 과일, 거래처, 판매상세, 판매
where 과일.과일번호 = 판매상세.과일번호
and 판매상세.판매번호 = 판매.판매번호
and 판매.거래처번호 = 거래처.거래처번호;

-- 6) 과일번호, 과일이름, 주문일자, 결제방법, 수량을 검색하라
select 과일.과일번호, 과일이름, 주문일자, 결제방법, 수량
from 과일, 판매, 판매상세
where 과일.과일번호 = 판매상세.과일번호 
and 판매.판매번호 = 판매상세.판매번호;

-- 과일(과일번호,과일이름,가격,색상,원산지)
-- 거래처(거래처번호,거래처이름,담당자,거래처주소,거래처전화)
-- 판매(판매번호,주문일자,결제방법,배송지,거래처번호)
-- 판매상세(판매번호,일련번호,과일번호,수량)

-- 7) 판매번호, 과일명, 가격, 수량을 검색하라
select 판매.판매번호, 과일이름, 가격, 수량
from 과일, 판매, 판매상세
where 판매.판매번호 = 판매상세.판매번호
and 과일.과일번호 = 판매상세.과일번호;

-- 8) 판매번호, 주문일자, 과일이름, 수량을 검색하라
-- 9) 과일이름, 색상, 가격, 거래처이름, 주문일자, 결제방법, 수량을 검색하라
select 과일.과일이름, 색상, 가격, 거래처이름, 주문일자, 결제방법, 수량
from 과일, 판매상세, 판매, 거래처
where 판매.판매번호 = 판매상세.판매번호
and 과일.과일번호 = 판매상세.과일번호
and 거래처.거래처번호 = 판매.거래처번호;

select A.과일이름, 색상, 가격, 거래처이름, 주문일자, 결제방법, 수량
from 과일 A, 판매상세 B, 판매 C, 거래처 D
where A.과일번호 = B.과일번호 
and B.판매번호 = C.판매번호
and C.거래처번호 = D.거래처번호;

-- 10) 과일이름별 과일이름, 수량을 검색하라
select A.과일이름, sum(수량) as '총수량'
from 과일 A, 판매상세 B, 판매 C, 거래처 D
where A.과일번호 = B.과일번호 
and B.판매번호 = C.판매번호
and C.거래처번호 = D.거래처번호
group by A.과일이름;
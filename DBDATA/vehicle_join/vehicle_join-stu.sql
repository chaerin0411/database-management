-- (vehicle_join-stu.sql)
-- 내부조인, 외부조인

-- 고객관리(이름, 주민번호, 생년월일, 관계, 핸드폰번호, 우편번호, 주소, 차종, 차명, 년식, 구입일)
-- 개인신상(이름, 주민번호, 생년월일, 관계, 핸드폰번호, 우편번호, 주소)
-- 자동차(차종, 차명, 년식, 구입일)

-- col 이름 format a10
-- col 관계 format a8
-- col 주소 format a30

-- 자동차가 없는 고객
select * 
from 고객관리
where 차종 is null;

-- 자동차가 있는 고객
select *
from 고객관리
where 차종 is not null;

select 개인신상.이름, 생년월일, 차종, 차명
from 개인신상, 자동차
where 개인신상.이름 = 자동차.이름;

select 개인신상.이름, 생년월일, 차종, 차명
from 개인신상 inner join 자동차
on 개인신상.이름 = 자동차.이름;
-- (Quiz08-05-stu.sql)

-- 질병(질병코드, 질병명, 증상)
-- 환자(환자번호, 이름, 질병코드, 나이)

--1) 증상이 발열인 질병코드와 질병명, 증상을 조회하라
?
--2) 양길현의 이름과 환자번호, 나이를 조회하라
?
--3) 나이가 30 이하인 환자번호와 이름, 나이를 조회하라
?
--4) 환자 김철수의 환자 이름, 질병명, 증상을 조회하라
?
--5) 각 환자의 이름과 질병명을 환자 이름의 오름차순으로 조회하라
?
--6) 질병의 종류중 현재 환자테이블에 있는 환자가 걸리지 않은 질병을 조회하라
select 질병코드, 질병명, 증상
from 질병 D
where NOT EXISTS (select *
from 환자 P
where P.질병코드 = D.질병코드)

-- 사원(직원코드,성명,직책,연봉)

CREATE TABLE 사원 (
직원코드 int NOT NULL ,
성명 char(20) UNIQUE ,
직책 char(10) CHECK (직책 IN ('사원','대리','과장','팀장')),
연봉 int 
);


insert into 사원(직원코드,성명,직책,연봉)
values(161353,'김미나','대리',2300);

insert into 사원(직원코드,성명,직책,연봉)
values(181323,'최영락','사원',1900);

insert into 사원(직원코드,성명,직책,연봉)
values(151453,'홍진호','과장',2800);

insert into 사원(직원코드,성명,직책,연봉)
values(135485,'구준표','과장',3000);

insert into 사원(직원코드,성명,직책,연봉)
values(104895,'강나래','팀장',3600);

insert into 사원(직원코드,성명,직책,연봉)
values(165485,'김하늘','대리',2400);


select * from 사원;

-- --------------------------

-- 사원(직원코드,성명,직책,연봉)

-- 1) 직책별 연봉의 평균을 구하시오
SELECT	직책, AVG(연봉)
FROM	사원
GROUP BY 직책;

-- 2) 직책별 사원수를 구하시오
SELECT	직책, COUNT(*)
FROM	사원
GROUP BY 직책;

-- 3) 연봉이 2500 이상인 사원이 2명 이상인 
-- 직책의 사원수를 구하시오
SELECT	직책, COUNT(*)
FROM	사원
WHERE	연봉>=2500
GROUP BY 직책
HAVING	COUNT(*)>=2;

-- --------------------------
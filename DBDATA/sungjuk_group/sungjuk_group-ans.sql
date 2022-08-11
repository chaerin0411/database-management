-- (sungjuk_group-ans.sql)

/* (주의) 집계함수
집계 함수는 WHERE 절에서는 사용할 수 없고,
SELECT 절이나 HAVING 절에서만 사용 가능 */

select * from 성적;

-- 1-1) 입력 순으로 5개의 레코드 이름, 점수를 검색하라

/* ROWNUM : 결과집합에 대해 순차적으로 번호를 할당하는 의사 컬럼(pseudo-column)
(주의) ROWNUM 과 상수 N의 비교연산자는 반드시 < 나 <= 만 사용가능 */

SELECT TOP 5 이름, 점수
FROM 성적;

SELECT 이름, 점수
FROM 성적
WHERE ROWNUM <= 5;

-- 1-2) 점수의 내림차순으로 상위 5개 레코드의 이름, 점수를 검색하라
SELECT TOP 5 이름, 점수
FROM 성적
ORDER BY DESC;

SELECT 이름, 점수
FROM (SELECT 이름, 점수
	  FROM 성적
      WHERE 점수 IS NOT NULL
      Order by 점수 DESC) T
WHERE ROWNUM <= 5;

-- 1-3) 점수의 내림차순으로 상위 3개 레코드의 이름, 점수를 검색하여 점수가 같으면 모두 출력 (WITH TIES 사용)
SELECT TOP 5 WITH TIES 이름, 점수
FROM 성적
ORDER BY 점수 DESC;

-- 2-1) 최고 점수를 검색하라
SELECT MAX(점수)
FROM 성적;

-- 2-2) 최저 점수를 검색하라
SELECT MIN(점수)
FROM 성적;

-- 2-3) 점수합계를 검색하라
SELECT SUM(점수)
FROM 성적;

-- 2-4) 평균점수를 검색하라
SELECT AVG(점수)
FROM 성적;

-- 소수점이하 1자리
select ROUND(AVG(점수), 1)
from 성적;

select SUM(점수)/COUNT(점수)
from 성적;

/* COUNT(*) : NULL 포함하여 계산
   COUNT(필드) : NULL 제외하여 계산 */

-- 2-5) 학생수는 모두 몇 명인지 검색하라
SELECT COUNT(*)
FROM 성적;

-- 2-6) 시험에 응시한 학생수는 모두 몇명인지 검색하라
SELECT COUNT(점수)
FROM 성적;

-- (MySQL)
select COUNT(점수) 시험응시인원
from 성적;

select COUNT(점수)  as 시험응시인원
from 성적;

select COUNT(점수) as '시험 응시 인원'
from 성적;

select COUNT(점수) as `시험 응시 인원`
from 성적;

select COUNT(점수) as "시험 응시 인원"
from 성적;

select * from 성적2;

-- 3-1) 각 과목수는 몉 개인지 검색하라(DISTINCT 사용)
SELECT COUNT(DISTINCT 과목)
FROM 성적2;

-- 3-2) 과목별 수강생은 몇 명인지 검색하라(GROUP BY)
SELECT 과목, COUNT(*)
FROM 성적2
GROUP BY 과목;

-- 3-3) 과목별 평균점수를 검색하라(GROUP BY) 중요
SELECT 과목, AVG(점수)
FROM 성적2
GROUP BY 과목;

SELECT 과목, ROUND(AVG(점수), 1)
FROM 성적2
GROUP BY 과목;

-- 3-4) 과목별 평균점수 75 보다 높은 학생의 과목별 평균점수를 검색하라(HAVING) 중요
SELECT 과목, AVG(점수)
FROM 성적2
GROUP BY 과목
HAVING AVG(점수) > 75;

-- 3-5) 점수가 70 이상인 과목이름, 과목 평균점수를 
-- 과목의 과목별 평균점수가 75 이상인 것만 
-- 과목별 평균점수가 높은 순으로 검색하라(ORDER BY)
SELECT 과목, AVG(점수) 
FROM 성적2
WHERE 점수 >= 70
GROUP BY 과목
HAVING AVG(점수) >= 75
ORDER BY AVG(점수) DESC;

SELECT 과목, AVG(점수) 
FROM 성적2
WHERE 점수 >= 70
GROUP BY 과목
HAVING AVG(점수) >= 75
ORDER BY 2 DESC;


-- [실습 2] 집계함수, Group by : (sungjuk_group.sql)
-- 성적(이름, 점수)	
-- 성적2(이름, 과목, 점수)

select * from 성적;

-- 1-1) 최고 점수를 검색하라	    
select MAX(점수)
from 성적;
             
-- 1-2) 최저 점수를 검색하라
select MIN(점수)
from 성적;

-- 1-3) 점수합계를 검색하라	       
select SUM(점수)
from 성적;
          
-- 1-4) 평균점수를 검색하라
select AVG(점수)
from 성적;

select SUM(점수)/COUNT(점수)
from 성적;

select ROUND(AVG(점수), 1)
from 성적;

-- 1-5) 학생수는 모두 몇 명인지 검색하라	       
select COUNT(*)
from 성적;

-- 1-6) 시험에 응시한 학생수는 모두 몇 명인지 검색하라
select COUNT(점수) 
from 성적;

-- (MySQL)
select COUNT(점수) as `시험 응시 인원`
from 성적;

-- (MySQL)
select COUNT(점수) as "시험 응시 인원"
from 성적;

-- (MySQL)
select COUNT(점수) as '시험 응시 인원'
from 성적;

-- (MySQL)
select COUNT(점수) as 시험응시인원
from 성적;


-- [실습 2] 집계함수, Group by : (sungjuk_group.sql)
-- 성적(이름, 점수)	
-- 성적2(이름, 과목, 점수)

select * from 성적2;

-- 2-1) 각 과목수는 몇 개인지 검색하라(DISTINCT 사용)
SELECT COUNT(DISTINCT 과목)
FROM  성적2;

-- 2-2) 과목별 수강생은 몇 명인지 검색하라(GROUP BY) 
SELECT 과목, COUNT(*)
FROM  성적2
GROUP BY 과목;
         
-- 2-3) 과목별 평균점수를 검색하라(GROUP BY)
SELECT 과목, ROUND(AVG(점수), 2)
FROM  성적2
GROUP BY 과목;

-- 2-4) 과목별 평균점수 75 보다 높은 학생의 
-- 과목별 평균점수를 검색하라(HAVING)
SELECT 과목, AVG(점수)
FROM  성적2
GROUP BY 과목
HAVING AVG(점수) >= 75;

-- 2-5) 점수가 70 이상인 과목이름, 과목 평균점수를 
-- 과목의 과목별 평균점수가 75 이상인 것만
SELECT 과목, AVG(점수)
FROM  성적2
WHERE 점수 >= 70
GROUP BY 과목
HAVING AVG(점수) >= 75;

-- 과목별 평균점수가 높은 순으로 검색하라(ORDER BY)
SELECT 과목, AVG(점수)
FROM  성적2
WHERE 점수 >= 70
GROUP BY 과목
ORDER BY AVG(점수) DESC;

SELECT 과목, AVG(점수)
FROM  성적2
WHERE 점수 >= 70
GROUP BY 과목
ORDER BY 2 DESC;
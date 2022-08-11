-- (finalexam-04-stu.sql)

-- 부서(부서번호, 부서명, 위치)
-- 사원(사원, 이름, 연령, 급여, 부서번호)

-- [문제04]
-- 4-1) 
SELECT 이름, MAX(급여) 
FROM   사원, 부서 
WHERE  연령 < 40 AND 사원.부서번호 = 부서.부서번호 
GROUP BY 부서명; 
 
-- 4-2)  
INSERT INTO 사원 VALUES(30, 'Smith', 3000, 1); 
 
-- 4-3)  
SELECT 부서명 
FROM   부서 
WHERE  부서번호 = ( SELECT 부서번호 
         FROM 사원 
         WHERE 급여 >=  (SELECT  MIN(급여) FROM 사원)); 

-- (quiz-booksr_deptemp-select-ans.sql)

-- department(deptno, deptname, floor)
-- employee(empno, empname, title, manager, salary, dno)
-- 사원(직원코드,성명,직책,연봉)

-- 답안
-- 12) 2번 부서에 근무하는 사원들의 급여, 직급, 이름을 검색하여 급여의 오름차순으로 정렬하라
SELECT salary, title, empname
FROM employee
WHERE dno = 2
ORDER BY salary ASC;

-- 13) 사원들의 평균 급여와 최대급여를 검색하라
SELECT ROUND(AVG(salary),0), MAX(salary)
FROM employee;

-- 14) 사원들이 속한 부서번호별로 그룹화하고 부서번호, 평균급여, 최대급여를 검색하라
SELECT dno, AVG(salary), MAX(salary)
FROM employee
GROUP BY dno;

-- 15) 사원들이 속한 부서번호별로 그룹화하고, 평균급여가 2500000원 이상인 부서에 대해서 부서번호, 평균급여, 최대급여를 검색하라
SELECT dno, AVG(salary), MAX(salary)
FROM employee
GROUP BY dno
HAVING AVG(salary) >= 2500000;

-- 1) 직책별 연봉의 평균을 구하시오
SELECT 직책, AVG(연봉)
FROM 사원
GROUP BY 직책;

-- 2) 직책별 사원수를 구하시오
SELECT 직책, COUNT(*)
FROM 사원
GROUP BY 직책;

-- 3) 연봉이 2500 이상인 사원이 2명 이상인 직책의 사원수를 구하시오
SELECT 직책, COUNT(*)
FROM 사원
WHERE 연봉 >= 2500
GROUP BY 직책
HAVING COUNT(*) >= 2;

-- 16-1) 김창섭이 속한 부서번호와 부서의 모든 부서번호를 합집합으로 검색하라 (UNION)
select dno
from employee
where empname = '김창섭'
union
select deptno
from department;

-- 16-2) 김창섭이 속한 부서번호와 부서의 모든 부서번호를 합집합으로 검색하라 (UNION ALL)
select dno
from employee
where empname = '김창섭'
union all
select deptno
from department;

-- 17) 사원의 이름과 이 사원이 속한 부서이름을 검색하라 (조인)
select empname, deptname
from employee E, department D
where E.dno= D.deptno;

select empname, deptname
from employee E inner join department D
on E.dno= D.deptno;

-- 19) 사원에 대해서 부서이름, 사원이름, 직급, 급여를 검색하라.
-- (단, 부서이름에 대해서 오름차순, 부서이름이 같을 경우에는 salary에 대해서 내림차순으로 정렬하라)
select deptname, empname, title, salary
from department D, employee E
where D.deptno = E.dno
order by deptname asc, salary desc;
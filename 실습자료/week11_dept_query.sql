-- department(deptno, deptname, floor)
-- employee(empno, empname, title, manager, salary, dno)     외래키 : dno  -> department(deptno)
-- 부서(부서번호, 부서명, 위치)
-- 사원(사번, 사원명, 직책, 관리자, 급여, 부서번호)

-- [실습]
-- 12) 2번 부서에 근무하는 사원들의 급여, 직급, 이름을 검색하여 
-- 급여의 오름차순으로 정렬하라
SELECT	salary, title, empname
FROM 	employee
WHERE 	dno = 2
ORDER BY salary ASC;

-- 13) 사원들의 평균 급여와 최대급여를 검색하라
SELECT	ROUND(AVG(salary), 0), MAX(salary)
FROM	employee;

-- 14) 사원들이 속한 부서번호별로 그룹화하고 부서번호, 평균급여, 최대급여를 검색하라
SELECT	dno, AVG(salary), MAX(salary)
FROM	employee
GROUP BY dno;

-- 15) 사원들이 속한 부서번호별로 그룹화하고, 평균급여가 2500000원 이상인 
-- 부서에 대해서 부서번호, 평균급여, 최대급여를 검색하라
SELECT	dno, AVG(salary), MAX(salary)
FROM	employee
GROUP BY dno
HAVING	AVG(salary) >= 2500000;

/* ------------------------------------------------------------------------------------------*/

-- department(deptno, deptname, floor)
-- employee(empno, empname, title, manager, salary, dno)

-- [실습]
-- 16-1) 김창섭이 속한 부서번호와 부서의 모든 부서번호를 합집합으로 검색하라 (UNION)
SELECT	dno
FROM	employee
WHERE	empname = '김창섭'
UNION
SELECT	deptno
FROM	department;

-- 16-2) 김창섭이 속한 부서번호와 부서의 모든 부서번호를 합집합으로 검색하라 (UNION ALL)
SELECT	dno
FROM	employee
WHERE	empname = '김창섭'
UNION ALL
SELECT	deptno
FROM	department;

-- 17) 사원의 이름과 이 사원이 속한 부서이름을 검색하라 (조인)
SELECT	empname, deptname
FROM	employee E, department D
WHERE	E.dno = D.deptno;

SELECT	empname, deptname
FROM	employee E INNER JOIN department D
ON 		E.dno = D.deptno;

-- 18) 사원에 대해서 사원이름과 직속상사의 이름을 검색하라(Self-Join)
-- 19) 사원에 대해서 부서이름, 사원이름, 직급, 급여를 검색하라.
-- 부서이름에 대해서 오름차순, 부서이름이 같을 경우에는 salary에 대해서 내림차순으로 정렬하라
SELECT	deptname, empname, title, salary
FROM 	department D, employee E
WHERE	D.deptno = E.dno
ORDER BY deptname ASC, salary DESC;


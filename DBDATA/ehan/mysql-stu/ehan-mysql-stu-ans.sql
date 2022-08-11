-- (ehan-mysql-stu-ans.sql)

/* 학사 데이터베이스 스키마
-- department(dept_id, dept_name, office)
-- student(stu_id, resident_id, name, year, address, dept_id)
-- professor(prof_id, resident_id, name, dept_id, position, year_emp)
-- course(course_id, title, credit)
-- class(class_id, course_id, year, semester, division, prof_id, classroom, enroll)
-- takes(stu_id, class_id, grade)
*/

/* ====================================================== */

-- [예제1] 다음에 대하여 SQL문법과 실행결과를 작성하라 (p155~166)
-- 질의21) student 테이블에서 주소를 검색하라
SELECT address
FROM student;

-- 질의22) student 테이블에서 주소를 검색하라(중복 제거)
SELECT DISTINCT address
FROM student;

-- 질의23) student 테이블에서 모든 필드를 검색하라
SELECT *
FROM student;

-- 질의24) professor 테이블에서 교수이름, 재직연수를 검색하라(현재연도 - 임용년도)
SELECT name, 2020-year_emp
FROM professor;

-- 질의27) student 테이블에서 1, 2학년 학생들의 이름과 학번을 검색하라
-- 단, 학생이름의 오름차순 정렬하고, 같은 이름은 학번의 오름차순 정렬하라
SELECT name, stu_id
FROM student
WHERE year = 1 OR year = 2
ORDER BY name ASC, stu_id ASC;

-- 질의28) student 테이블에서 1, 2학년 학생들의 이름과 학번을 검색하라
-- 단, 학생이름의 내림차순 정렬하고, 같은 이름은 학번의 오름차순 정렬하라
SELECT name, stu_id
FROM student
WHERE year = 1 OR year = 2
ORDER BY name DESC, stu_id ASC;

-- 질의33) 교수이름,직위, 재직연수를 검색하는데, 필드명 이름, 직위, 재직연수로 출력하라
SELECT name AS '이름', position AS '직위', 2020-year_emp AS '재직연수'
FROM professor;

-- 질의34) student 테이블에서 김씨 성을 가진 학생을 검색하라
SELECT *
FROM student
WHERE name LIKE '김%';

-- 질의35) 여학생들만을 검색하라(주민등록번호 뒷자리가 2로 시작하는 학생)
SELECT *
FROM student
WHERE resident_id LIKE '%-2%';

/*--------------------------------------------------------*/

-- [예제2] 조인, 집합연산(p155~170)
-- 질의20) 학생이름, 학과명을 검색하라
-- 방법1) SELECT … FROM … WHERE
SELECT name, dept_name
FROM student, department
WHERE student.dept_id = department.dept_id;

-- 방법2) SELECT … FROM … ON
SELECT name, dept_name
FROM student INNER JOIN department
ON student.dept_id = department.dept_id;

-- 질의25) 학생이름, 학번, 소속학과명을 검색하라
SELECT name, stu_id, dept_name
FROM student, department
WHERE student.dept_id = department.dept_id;

SELECT name, stu_id, dept_name
FROM student INNER JOIN department
ON student.dept_id = department.dept_id;

-- 질의26) 컴퓨터공학과 2학년 학생들의 학번을 검색하라
SELECT stu_id
FROM student, department
WHERE dept_name = '컴퓨터공학과'
AND student.dept_id = department.dept_id;

SELECT stu_id
FROM student INNER JOIN department
ON dept_name = '컴퓨터공학과'
AND student.dept_id = department.dept_id;

-- 질의30) student 테이블과 department 테이블을 조인하여 학생이름, 소속학과이름을 검색
-- 단, student 테이블은 s로, department 테이블은 d 로 재명명하라
SELECT name, dept_name
FROM student s, department d
WHERE s.dept_id = d.dept_id;

SELECT name, dept_name
FROM student s INNER JOIN department d
ON s.dept_id = d.dept_id;

-- 질의31) student 테이블에서 김광식 학생과 주소가 같은 학생이름을 검색하라
SELECT s1.name
FROM student s1, student s2
WHERE s1.address = s2.address
AND s2.name = '김광식';

SELECT s1.name
FROM student s1 INNER JOIN student s2
ON s1.address = s2.address
AND s2.name = '김광식';

-- 질의36) student 테이블의 학생이름과 professor 테이블의 교수이름을 합집합하라
SELECT name
FROM student
UNION
SELECT name
FROM professor;

-- 질의40) 컴퓨터공학과 학생들 중에서 교과목에 상관없이 학점을 A+ 받은 학생의 학번검색
SELECT student.stu_id
FROM student, department, takes
WHERE dept_name = '컴퓨터공학과'
AND grade = 'A+'
AND student.dept_id = department.dept_id
AND student.stu_id = takes.stu_id;

SELECT student.stu_id
FROM student INNER JOIN department INNER JOIN takes
ON dept_name = '컴퓨터공학과'
AND grade = 'A+'
AND student.dept_id = department.dept_id
AND student.stu_id = takes.stu_id;

-- 질의41) 산업공학과 학생들 중에서 한번도 A+ 를 받지 못한 학생들의 학번을 검색하라
SELECT student.stu_id
FROM student, department INNER JOIN takes
WHERE dept_name = '산업공학과'
AND grade <> 'A+'
AND student.dept_id = department.dept_id
AND student.stu_id = takes.stu_id;

SELECT student.stu_id
FROM student INNER JOIN department INNER JOIN takes
ON dept_name = '산업공학과'
AND grade <> 'A+'
AND student.dept_id = department.dept_id
AND student.stu_id = takes.stu_id;

/*--------------------------------------------------------*/

-- [예제3] 외부조인(p171~170) 질의42)~질의47)
-- 질의42) 모든 교과목들에 대해 교과목명, 학점수, 개설연도, 개설학기를 검색하라
SELECT title, credit, year, semester
FROM course, class
WHERE course.course_id = class.course_id;

/*--------------------------------------------------------*/

-- [예제4] 집계함수, group by(p175~186)
-- 질의48) student 테이블에서 2학년 학생이 몇 명인지 검색하라
SELECT COUNT(*)
FROM student
WHERE year = 2;

-- 질의49) student 테이블에서 dept_id 필드에 값이 몇 개인지 검색하라
SELECT COUNT(dept_id)
FROM student;

-- 질의49) student 테이블에서 dept_id 필드에 값이 몇 개인지 검색하라(중복 제거)
SELECT COUNT(DISTINCT dept_id)
FROM student;

-- 질의50) 컴퓨터공학과의 학생 수를 검색하라
SELECT COUNT(*)
FROM department, student
WHERE dept_name = '컴퓨터공학과'
AND department.dept_id = student.dept_id;

-- 질의51) 전체교수들의 재직연수 합을 구하라
SELECT SUM(2020-year_emp) AS '총재직연수'
FROM professor;

-- 질의55) 전체 교수의 평균 재직연수를 출력하라
SELECT AVG(2020-year_emp) AS '평균 재직연수'
FROM professor;

-- 질의57) student 테이블에서 학과번호(dept_id) 별로 레코드의 개수를 검색하라
SELECT dept_id, COUNT(*)
FROM student
GROUP BY dept_id;

-- 질의58) 학과명 별로 레코드의 개수를 검색하라
SELECT dept_name, COUNT(*)
FROM department, student
WHERE student.dept_id = department.dept_id
GROUP BY dept_name;

SELECT dept_name, COUNT(*)
FROM department INNER JOIN student
ON student.dept_id = department.dept_id
GROUP BY dept_name;

-- 질의60) 학과별 교수 숫자와 평균 재직연수, 최대 재직연수를 검색하라
SELECT dept_name, COUNT(*) AS '교수 수', 
AVG(2020-year_emp) AS '평균 재직연수',
MAX(2020- year_emp) AS '최대 재직연수'
FROM department, professor
WHERE department.dept_id = professor.dept_id
GROUP BY dept_name;

SELECT dept_name, COUNT(*) AS '교수 수', 
AVG(2020-year_emp) AS '평균 재직연수',
MAX(2020- year_emp) AS '최대 재직연수'
FROM department INNER JOIN professor
ON department.dept_id = professor.dept_id
GROUP BY dept_name;

-- 질의62) 평균 재직연수가 10년 이상인 학과에 대해서만 
-- 교수 수, 평균재직연수, 최대재직연수를 검색하라(having)
SELECT dept_name, COUNT(*) AS '교수 수', 
AVG(2020-year_emp) AS '평균 재직연수',
MAX(2020- year_emp) AS '최대 재직연수'
FROM department, professor
WHERE department.dept_id = professor.dept_id
GROUP BY dept_name
HAVING AVG(2020-year_emp) >= 10;

SELECT dept_name, COUNT(*) AS '교수 수', 
AVG(2020-year_emp) AS '평균 재직연수',
MAX(2020- year_emp) AS '최대 재직연수'
FROM department INNER JOIN professor
ON department.dept_id = professor.dept_id
GROUP BY dept_name
HAVING AVG(2020-year_emp) >= 10;

-- 질의63) 직원 숫자가 5명 이상인 부서에 대해서 
-- 부서별 직원수, 평균급여, 최대급여, 최소급여를 검색하라
-- X
/*--------------------------------------------------------*/

-- [예제5] 널 값(NULL)(p187)
-- 질의64) takes 테이블에서 아직 학점이 부여되지 않은 학생의 학번을 검색하라
SELECT student.stu_id
FROM student, takes
WHERE grade IS NULL
AND student.stu_id = takes.stu_id;

SELECT student.stu_id
FROM student INNER JOIN takes
ON grade IS NULL
AND student.stu_id = takes.stu_id;

-- 질의65) takes 테이블에서 학점이 A+ 가 아닌 학생들의 학번을 검색하라
SELECT student.stu_id
FROM student, takes
WHERE grade <> 'A+'
AND student.stu_id = takes.stu_id;

SELECT student.stu_id
FROM student INNER JOIN takes
ON grade <> 'A+'
AND student.stu_id = takes.stu_id;
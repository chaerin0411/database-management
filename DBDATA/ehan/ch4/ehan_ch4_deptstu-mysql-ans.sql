-- (ehan_ch4_deptstu-mysql-ans.sql)

/*

department(dept_id, dept_name, office)

student(stu_id, resident_id, name, year, address, dept_id)

professor(prof_id, resident_id, name, dept_id, position, year_emp)

course(course_id, title, credit)

class(class_id, course_id, year, semester, division, prof_id, classroom, enroll)

takes(stu_id, class_id, grade)

*/

/*

   학과(학과번호, 학과명, 사무실위치)

   학생(학번, 주민등록번호, 학생명, 학년, 주소, 학과번호)

   교수(교수번호, 주민등록번호, 교수명, 소속학과, 직위, 임용년도)

   과목(과목번호, 과목명, 학점수)

   강좌(강좌번호, 과목번호, 연도, 학기, 분반, 담당교수, 강의실, 수강인원)

   수강(학번, 강좌번호, 성적)

*/

/*

department(dept_id, dept_name, office)

student(stu_id, resident_id, name, year, address, dept_id)

professor(prof_id, resident_id, name, dept_id, position, year_emp)

*/

-- department(dept_id, dept_name, office)
-- student(stu_id, resident_id, name, year, address, dept_id)
-- professor(prof_id, resident_id, name, dept_id, position, year_emp)

-- 1) 학생 테이블에서 주소를 검색하라
SELECT address
FROM student;

-- 2) 학생 테이블에서 주소를 검색하라(중복 제거)
SELECT DISTINCT address
FROM student;

-- 3) 학생 테이블에서 모든 필드를 검색하라
SELECT *
FROM student;

-- 4) 교수 테이블에서 name, 2019-year_emp 필드를 검색하라
SELECT name, 2019-year_emp
FROM professor;

-- 5) 학생 테이블에서 이름의 오름차순으로 검색하라
-- (단, 이름이 같은 경우 학번의 오름차순으로 정렬)
SELECT *
FROM student
ORDER BY name ASC, stu_id ASC;

-- 6) 학생 테이블에서 이름의 내림차순으로 검색하라
-- (단, 이름이 같은 경우 학번의 오름차순으로 정렬)
SELECT *
FROM student
ORDER BY name DESC, stu_id ASC;

-- 7) 교수 테이블에서 name, position, 2020-year_emp 를 검색하라
SELECT name, position, 2020-year_emp
FROM professor;

-- 8) 교수 테이블에서 name 은 이름, position 은 직위,  2020 - year_emp 는 재직연수 로 출력하라
SELECT name AS '이름', position AS '직위' , 2020-year_emp AS '재직연수'
FROM professor;

-- 9) 김씨 성을 갖는 학생을 검색하라
SELECT *
FROM student
WHERE name LIKE '김%';

-- 10) 학생 중에서 여학생을 검색하라
-- Hint (주민등록번호 뒷자리가 2로 시작하는 학생 검색)
SELECT *
FROM student
WHERE resident_id LIKE '%-2%';

-- 11) student 테이블에서 dept_id 별로 학생수 를 검색하라
SELECT dept_id, COUNT(*)
FROM student
GROUP BY dept_id;

-- 12) 생일이 7월인 교수 이름, 주민등록번호를 검색하라
SELECT name, resident_id
FROM professor
WHERE resident_id LIKE '___7%';


select name, resident_id
from   professor
where  resident_id LIKE '___7%';

-- (MySQL)
select name, resident_id
from   professor
where  substring(resident_id, 3, 2) = '07';

-- 실렉션(Selection): 선택연산
-- 1) student 테이블에서 address가 서울인 레코드를 검색하라
select * 
from student
where address = '서울';

-- 2) 2000년 이후에 임용된 교수들에 대한 레코드를 검색하라
select *
from professor
where year_emp >= 2000;

-- 3) 2000년 이후에 임용된 부교수들의 레코드를 검색하라
select *
from professor
where year_emp >= 2000 and position = '부교수';

-- 프로젝션(Projection): 추출 연산
-- 4) student 테이블에서 stu_id와 name을 검색하라
select stu_id, name
from student;

-- 5) student 테이블에서 dept_id를 검색하라
select distinct dept_id
from student;

-- 6) professor 테이블에서 name, position을 검색하라
select name, position
from professor;

-- 실렉션과 프로젝션의 혼합
-- 7) 2000년 이후에 임용된 부교수들의 name을 검색하라
select name
from professor
where year_emp >= 2000 and position = '부교수';

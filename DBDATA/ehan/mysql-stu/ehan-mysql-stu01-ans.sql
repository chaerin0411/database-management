-- (ehan-mysql-stu01-ans.sql)

-- 학사관리 테이블 
-- department(dept_id, dept_name, office)
-- student(stu_id, resident_id, name, year, address, dept_id)
-- professor(prof_id, resident_id, name, dept_id, position, year_emp)
-- course(course_id, title, credit)
-- class(class_id, course_id, year, semester, division, prof_id, classroom, enroll)
-- takes(stu_id, class_id, grade)

-- [예제1] 다음에 대하여 SQL문법과 실행결과를 작성하라
-- 질의21) student 테이블에서 주소를 검색하라
-- 질의22) student 테이블에서 주소를 검색하라(중복 제거)
-- 질의23) student 테이블에서 모든 필드를 검색하라
-- 질의24) professor 테이블에서 교수이름, 재직연수를 검색하라(현재연도 - 임용년도)
-- 질의27) student 테이블에서 1, 2학년 학생들의 이름과 학번을 검색하라
-- 단, 학생이름의 오름차순 정렬하고, 같은 이름은 학번의 오름차순 정렬하라
select name, stu_id
from student
where year in (1, 2)
order by name asc, stu_id asc;

-- 질의28) student 테이블에서 1, 2학년 학생들의 이름과 학번을 검색하라
-- 단, 학생이름의 내림차순 정렬하고, 같은 이름은 학번의 오름차순 정렬하라

-- [예제2] 조인, 집합연산
-- 질의20) 학생이름, 학과명을 검색하라
-- 방법1) SELECT … FROM … WHERE
select name, dept_name
from student, department
where student.dept_id = department.dept_id;

-- 방법2) SELECT … FROM … ON
-- 질의25) 학생이름, 학번, 소속학과명을 검색하라
-- 질의26) 컴퓨터공학과 2학년 학생들의 학번을 검색하라
select stu_id
from student, department
where student.dept_id = department.dept_id
and dept_name = '컴퓨터공학과'
and year = 2;

select stu_id
from student inner join department
on student.dept_id = department.dept_id
where dept_name = '컴퓨터공학과'
and year = 2;

-- 질의30) student 테이블과 department 테이블을 조인하여 학생이름, 소속학과이름을 검색
-- 단, student 테이블은 s로, department 테이블은 d 로 재명명하라
select name, dept_name
from student s, department d
where s.dept_id = d.dept_id;

-- 질의31) student 테이블에서 김광식 학생과 주소가 같은 학생이름을 검색하라
select s1.name
from student s1, student s2
where s1.address = s2.address
and s2.name = '김광식';

-- [예제3] 조인, 집합연산
-- 질의36) student 테이블의 학생이름과 professor 테이블의 교수이름을 합집합하라
select name from student
union
select name from professor;

-- 질의40) 컴퓨터공학과 학생들 중에서 교과목에 상관없이 학점을 A+ 받은 학생의 학번검색
select S.stu_id
from student S, department D, takes T
where D.dept_id = S.dept_id
and S.stu_id = T.stu_id
and dept_name = '컴퓨터공학과'
and grade = 'A+';

-- 질의41) 산업공학과 학생들 중에서 한번도 A+ 를 받지 못한 학생들의 학번을 검색하라

-- [예제4] 외부조인
-- 질의42) 모든 교과목들에 대해 교과목명, 학점수, 개설연도, 개설학기를 검색하라
select distinct title, credit, year, semester
from course c1 left outer join class c2
on c1.course_id = c2.course_id;

-- 내부조인
select distinct title, credit, year, semester
from course c1, class c2
where c1.course_id = c2.course_id;

-- [예제5] 집계함수, group by
-- 질의48) student 테이블에서 2학년 학생이 몇 명인지 검색하라
-- 질의49) student 테이블에서 dept_id 필드에 값이 몇 개인지 검색하라
-- 질의49) student 테이블에서 dept_id 필드에 값이 몇 개인지 검색하라(중복 제거)
-- 질의50) 컴퓨터공학과의 학생 수를 검색하라
-- 질의51) 전체교수들의 재직연수 합을 구하라
-- 질의55) 전체 교수의 평균 재직연수를 출력하라
-- 질의57) student 테이블에서 학과번호(dept_id) 별로 레코드의 개수를 검색하라
select dept_id, count(*)
from student
group by dept_id;

-- 질의58) 학과명 별로 레코드의 개수를 검색하라
select dept_name, count(*)
from student s, department d
where s.dept_id = d.dept_id
group by dept_name;

-- [예제6] 하위질의
-- 질의66) 301호 강의실에서 개설된 강좌의 과목명을 검색하라(하위질의)
select title
from course
where course_id in (select course_id
					from class
					where classroom = '301호');

-- 질의67) 301호 강의실에서 개설된 강좌의 과목명을 검색하라(조인)
select title
from course c1, class c2
where c1.course_id = c2.course_id
and classroom = '301호';

-- 질의68) 2012년 2학기에 개설되지 않은 과목명을 검색하라(하위질의)(NOT IN)
select title
from course
where course_id not in (select course_id
						from class
						where year = '2012');
                    
-- 질의69) 가장 많은 수강인원을 가진 강좌를 검색하라
select c1.course_id, title, year, semester
from course c1, class c2
where c1.course_id = c2.course_id
and enroll >= ALL (select enroll
				   from class);
                   
select                  
-- 질의70) 301호 강의실에서 개설된 강좌의 과목명을 검색하라
-- 질의71) 2012년 2학기에 개설되지 않은 과목명을 검색하라(NOT EXISTS)

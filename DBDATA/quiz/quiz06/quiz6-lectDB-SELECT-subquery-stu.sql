-- (quiz6-lectDB-SELECT-subquery-stu.sql)
-- 중첩질의 (stu, prof)

-- stu(sno, sname, dept, sage)
-- pro(pno, pname, dept, page)

-- 3-1) 교수 테이블에서 이정무 의 학과와 같은 학생 이름, 학과, 나이를 검색하라
-- 3-2) 교수 테이블에서 pno 가 p1 이거나 p2 인 학과와 같은 학생 이름, 학과, 나이를 검색하라
-- 3-3) 학생 테이블과 교수 테이블에서 모든 학생들보다 나이가 많은 교수의
-- 교번, 이름, 나이를 ALL 구문을 이용하여 검색하라
-- 3-4) 학생 테이블과 교수 테이블에서 한 명 이상 교수보다 
-- 나이가 많은 학생이 있을 경우 학생의 학번, 이름, 나이를 SOME 구문으로 검색하라
-- 3-5) 가장 나이가 많은 학생의 이름, 나이를 검색하라
-- 3-6) 각 학과마다 가장 나이가 많은 학생의 이름, 학과, 나이를 검색하라
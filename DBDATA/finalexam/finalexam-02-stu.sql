-- (finalexam-02-stu.sql)

-- 학생(학번, 학생명,학년) 
-- 과목(과목번호, 과목명) 
-- 수강(학번, 과목번호, 중간,기말,학점) 

-- [문제02]
-- 2-1) 수강 테이블에서 L로 시작하는 과목의 중간성적이 90점 이상인  
-- 학생의 이름과 기말성적을 검색하는 SQL 문을 작성하시오.  
-- 단, 이름을 기준으로 오름차순 정렬하고,  
-- 만약 이름이 같으면 기말성적을 기준으로 내림차순 정렬하시오. 
 
-- 2-2) 수강 테이블에서 학생이 수강하는 과목에 대해  
-- 과목별 등록 학생의 수와 중간성적의 평균을 구하는 SQL 문을 작성하시오.  
-- 이 때, 등록한 학생의 총 수는 '학생수'로,  
-- 중간성적의 평균은 '중간성적평균'으로 속성 이름을 새로 부여하시오. 
 
-- 2-3) L001 과목을 수강하지 않는 학생의 이름과 학년을 검색하는 SQL 문을 작성하시오.  
-- 단, IN 연산자를 이용해 작성하시오(하위질의) 
-- (sungjuk_group-stu.sql)

-- 1-1) 입력 순으로 5개의 레코드 이름, 점수를 검색하라

/* ROWNUM : 결과집합에 대해 순차적으로 번호를 할당하는 의사 컬럼(pseudo-column)
(주의) ROWNUM 과 상수 N의 비교연산자는 반드시 < 나 <= 만 사용가능 */

-- 1-2) 점수의 내림차순으로 상위 5개 레코드의 이름, 점수를 검색하라
-- 1-3) 점수의 내림차순으로 상위 3개 레코드의 이름, 점수를 검색하여 점수가 같으면 모두 출력 (WITH TIES 사용)


-- 2-1) 최고 점수를 검색하라
-- 2-2) 최저 점수를 검색하라
-- 2-3) 점수합계를 검색하라
-- 2-4) 평균점수를 검색하라

/* COUNT(*) : NULL 포함하여 계산
   COUNT(필드) : NULL 제외하여 계산 */

-- 2-5) 학생수는 모두 몇 명인지 검색하라
-- 2-6) 시험에 응시한 학생수는 모두 몇명인지 검색하라

-- 3-1) 각 과목수는 몉 개인지 검색하라(DISTINCT 사용)
-- 3-2) 과목별 수강생은 몇 명인지 검색하라(GROUP BY)
-- 3-3) 과목별 평균점수를 검색하라(GROUP BY)
-- 3-4) 과목별 평균점수 75 보다 높은 학생의 과목별 평균점수를 검색하라(HAVING)
-- 3-5) 점수가 70 이상인 과목이름, 과목 평균점수를 과목의 과목별 평균점수가 75 이상인 것만 과목별 평균점수가 높은 순으로 검색하라(ORDER BY)
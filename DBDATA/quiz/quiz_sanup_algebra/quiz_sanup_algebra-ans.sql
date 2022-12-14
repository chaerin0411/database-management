-- (quiz_sanup_algebra-ans.sql)

-- 성적(이름, 국어, 영어, 수학, 과학)
-- 학적부(이름, 주소, 나이)

-- 예제1) <성적> 릴레이션에서 국어 점수가 80점 이상인 튜플들을 추출한다.
select *
from 성적
where 국어>= 80;

-- 예제2) <성적> 릴레이션에서 국어 점수 또는 영어 점수가 80점 이상인 튜플들을 추출한다.
select *
from 성적
where 국어>= 80 OR 영어 >= 80;

-- 예제3) <성적> 릴레이션에서 이름과 국어 속성을 추출한다.
select 이름, 국어
from 성적;

-- 예제4) <성적> 릴레이션과 <학적부> 릴레이션으로부터 이름 속성이 같은 튜플들을 결합하여 새로운 릴레이션을 생성한다.
select *
from 성적, 학적부
where 성적.이름 = 학적부.이름;
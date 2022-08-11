use handb;

-- (수정) 예제 7-55 고객 테이블에서 등급이 vip인 고객의 고객아이디, 고객이름, 나이, 등급으로 구분
-- 뷰를 우수고객이라는 이름으로 생성해보자
-- 우수고객 뷰의 모든 내용을 검색해보자

select * from 고객;

DROP VIEW 우수고객;
CREATE VIEW 우수고객
as
	SELECT	고객아이디, 고객이름, 나이, 등급
    FROM	고객
    WHERE	등급 = 'vip'
WITH CHECK OPTION;

select * from 우수고객;

delete
from 고객
where 고객아이디 = 'chinme';

-- WITH CHECK OPTION 설정하지 않으면 등급이 GOLD여도 INSERT됨
insert into 우수고객(고객아이디, 고객이름, 나이, 등급)
values('chinme','신아로미',20,'vip');
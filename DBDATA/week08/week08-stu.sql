-- (week08.sql)

-- 학과(학과코드, 학과명)
-- 학생(학번, 이름, 학과코드)

select * from 학과;
select * from 학생;

update 학생
set 학과코드 = '1001'
where 이름 = '김연아';

-- 엔티티 무결성 제약조건(개체 무결성 제약조건) 위배
insert into 학과 values('1001', '컴퓨터학과');

-- 참조무결성 제약조건
insert into 학생 values('601', '박세리','3001');

delete
from 학과
where 학과코드='1001';

-- 제한(rectrict) 인 경우
--오류 (이유는?)
update 학과
set 학과코드 = 'A001'
where 학과코드 = '1001';

--오류 (이유는?)
delete
from 학과
where 학과코드 = '2001';

-- 연쇄(cascade) 인 경우 --> update는 미지원, delete는 지원
-- on delete cascade

-- 다음은 실행가능한가?
select * from 학과2;
select * from 학생2;

--오류 (이유는?)
update 학과2
set 학과코드 = 'A001'
where 학과코드 = '1001';

delete
from 학과2
where 학과코드 = '2001';

-- 널 값(set null) 인 경우 --> update는 미지원, delete는 지원
-- on delete set null

--오류 (이유는?)
update 학과3
set 학과코드 = 'A001'
where 학과코드 = '1001';

delete
from 학과3
where 학과코드 = '2001';

select *
from 학생3
where 학과코드 is null;

select *
from 학생3
where 학과코드 is not null;

-- (DB02-01-01.sql)
-- 부서(부서코드, 부서명, 위치)
-- 사원(사원번호, 이름, 성별, 입사일, 주소, 부서코드)

drop table 사원;
drop table 부서;

-- 테이블 생성
-- 부서(부서코드, 부서명, 위치)
create table 부서(
    부서코드 char(2) not null ,
    부서명 varchar(10) ,
    위치 varchar(10) ,
    primary key(부서코드)
);

-- 사원(사원번호, 이름, 성별, 입사일, 주소, 부서코드)
create table 사원(
    사원번호 char(4) not null ,
    이름 varchar(10) ,
    성별 varchar(4) ,
    입사일 varchar(20) ,
    주소 varchar(40) ,
    부서코드 char(2) ,
    primary key(사원번호) ,
    foreign key(부서코드) references 부서(부서코드)
);

-- 데이터 입력
-- 부서(부서코드, 부서명, 위치)
insert into 부서 values('AA', '총무부', '서울');
insert into 부서 values('BB', '영업부', '대전');
insert into 부서 values('CC', '기획부', '서울');

-- 사원(사원번호, 이름, 성별, 입사일, 주소, 부서코드)
insert into 사원 values('1111', '홍길동', '남', '2004-08-26', '서울시 서대문구 연희동', 'AA');
insert into 사원 values('2222', '임꺽정', '남', '2005-02-23', '부산시 해운대구', 'AA');
insert into 사원 values('3333', '박찬호', '남', '2004-08-26', '경기도 성남시 분당구', 'BB');
insert into 사원 values('4444', '선동열', '남', '2005-08-22', '서울시 마포구 공덕동', 'BB');
insert into 사원 values('5555', '차두리', '남', '2006-02-23', '서울시 영등포구 여의도동', 'AA');
insert into 사원 values('6666', '신동엽', '여', '2006-02-20', '서울시 동작구 신대방동', 'BB');

commit;

-- 데이터 검색
select * from 부서;
select * from 사원;

-- (DB02-01-02-ans.sql)
-- 부서(부서코드, 부서명, 위치)
-- 사원(사원번호, 이름, 성별, 입사일, 주소, 부서코드)

-- 문제)
-- 1) 사원의 모든 정보를 보이시오
select * from 사원;

-- 2) 신동엽 사원의 주소는 무엇인가?
select 주소
from 사원
where 이름 = '신동엽';

-- 3) 성별이 '여'이고 부서코드가 'BB'인사원을 검색하시오
select *
from 사원
where 성별 = '여' and 부서코드 = 'BB';

-- 4) 사원의 이름, 성별을 보이되 사원이름을 가나다순으로 보이시오
select 이름, 성별
from 사원
order by 이름 asc;

-- 5) 부서코드와 그부서에 속한 사원들의 인원수를 보이시오
select 부서코드, count(*)
from 사원
group by 부서코드;

-- 6) 사원이름과 부서이름을 보이시오
select 이름, 부서명
from 사원, 부서
where 사원.부서코드 = 부서.부서코드;

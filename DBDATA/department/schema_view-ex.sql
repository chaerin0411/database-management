-- (schema_view-ex.sql)
use studydb;

drop table 가입고객;

-- 테이블 생성
-- 가입고객(번호, 이름, 성별, 나이, 직업, 주소, 연락처)
create table 가입고객 (
	번호 int not null ,
    이름 char(10) ,
    성별 char(2) ,
    나이 int ,
    직업 char(10) ,
    주소 char(20) ,
    연락처 char(20) ,
    primary key(번호)
);

-- 데이터 입력
-- 가입고객(번호, 이름, 성별, 나이, 직업, 주소, 연락처)
insert into 가입고객 values(1, '홍길동', '남', 20, '학생', '서울', null),
						 (2, '임꺽정', '남', 22, '학생', '인천', '010-1111-1111'),
						 (3, '신아로미', '여', 20, '학생', '서울', '010-2222-2222');

-- 데이터 겁색
select * from 가입고객;

-- 가입고객(번호, 이름, 성별, 나이, 직업, 주소, 연락처)

-- 뷰 생성
-- 고객분석팀(성별, 나이, 직업)
create view 고객분석팀
as
select 성별, 나이, 직업
from 가입고객;

select * from 고객분석팀;

-- 뷰 생성
-- 상품배송팀(고객번호, 고객이름, 주소, 연락처)
create view 상품배송팀(고객번호, 고객이름, 주소, 연락처)
as
select 번호, 이름, 주소, 연락처
from 가입고객;

select * from 상품배송팀;                      
-- (hw1-02-mysql.sql)
use hwdb;

-- 사원(사원번호, 사원이름, 나이, 주소, 직급) 테이블 생성
create table 사원 (
	사원번호 char(4) not null ,
    사원이름 varchar(5) ,
    나이 int ,
    주소 varchar(20) ,
    직급 char(5) ,
    primary key(사원번호)
);

-- 사원(사원번호, 사원이름, 나이, 주소, 직급) 데이터 입력
insert into 사원 values('E001', '홍준화', 30, '서울시 마포구', '대리');
insert into 사원 values('E002', '김연주', 28, '서울시 영등포구', '사원');
insert into 사원 values('E003', '이명기', 32, '서울시 강남구', '사원');
insert into 사원 values('E004', '전채린', 20, '서울시 구로구', '사원');

-- 사원 테이블 조회
select * from 사원;

drop table 사원;

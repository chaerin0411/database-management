-- (fruit.sql)

-- fruit(과일번호, 과일이름, 가격, 색상, 원산지)

use studydb;

-- 테이블 삭제
drop table fruit;

-- 테이블 생성
create table fruit (
	과일번호 int not null ,
    과일이름 varchar(30) ,
    가격 int ,
    색상 char(12) ,
    원산지 varchar(30) ,
    primary key(과일번호)
);

-- 데이터 입력
insert into fruit values(1, '사과', 2000, '빨간색', '한국');
insert into fruit values(2, '배', 5000, '노란색', '한국');
insert into fruit values(3, '바나나', 1500, '노란색', '인도네시아');
insert into fruit values(4, '키위', 4000, '초록색', '호주');
insert into fruit values(5, '수박', 6000, '초록색', '한국');

-- 데이터 검색
select * from fruit;


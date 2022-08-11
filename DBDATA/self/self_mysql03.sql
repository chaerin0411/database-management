-- (self_mysql03.sql)
-- 멘토(선수번호, 이름, 주소, 멘토번호)

-- 테이블 삭제
drop table 멘토;

-- 테이블 생성
-- 멘토(선수번호, 이름, 주소, 멘토번호)
create table 멘토 (
	선수번호 int not null ,
    이름 varchar(9) null ,
    주소 varchar(50) null ,
    멘토번호 int ,
    primary key (선수번호) ,
    foreign key (멘토번호) references 멘토(선수번호)
);

-- 데이터 입력
-- 멘토(선수번호, 이름, 주소, 멘토번호)
insert into 멘토 values(1, '박지성', '영국', null);
insert into 멘토 values(4, '추신수', '미국', null);
insert into 멘토 values(3, '장미란', '대한민국', 4);
insert into 멘토 values(2, '김연아', '대한민국', 3);

-- 데이터 검색
select * from 멘토;

-- [자체조인 4]
-- 선수이름과 멘토이름 을 검색하라
select A.이름 as '선수이름', B.이름 as '멘토이름'
from 멘토 A, 멘토 B
where A.멘토번호 = B.선수번호;
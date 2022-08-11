-- (ex08-06.sql)

-- 멘토(선수번호, 이름, 주소, 멘토번호)
-- 테이블 삭제
drop table 멘토;

-- 테이블 생성
create table 멘토 (
    선수번호 int not null ,
    이름 varchar(10) ,
    주소 varchar(30) ,
    멘토번호 int ,
    primary key(선수번호) ,
    foreign key(멘토번호) references 멘토(선수번호)
);

-- 데이터 입력
insert into 멘토 values(1, '박지성', '영국 멘체스타', null);
insert into 멘토 values(4, '추신수', '미국 클리블랜드', null);
insert into 멘토 values(3, '장미란', '대한민국 강원도', 4);
insert into 멘토 values(2, '김연아', '대한민국 서울', 3);

-- 데이터 조회
select * from 멘토;
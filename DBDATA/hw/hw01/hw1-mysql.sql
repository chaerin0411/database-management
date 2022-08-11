-- (hw1-01-mysql.sql)
 use hwdb;
 
 -- 의사(의사번호, 의사이름, 소속, 근무연수) 테이블 생성
create table 의사 (
	의사번호 char(4) not null ,
    의사이름 char(5) ,
    소속 varchar(10) ,
    근무연수 int ,
    primary key(의사번호) 
);
 
-- 환자(환자번호, 환자이름, 나이, 담담의사) 테이블 생성
create table 환자 (
	환자번호 char(4) not null ,
    환자이름 char(5) ,
    나이 int ,
    담당의사 char(4) ,
    primary key(환자번호) ,
    foreign key(담당의사) references 의사(의사번호)
);

-- 의사(의사번호, 의사이름, 소속, 근무연수) 데이터 입력
insert into 의사 values('D001', '정지영', '내과', '5');
insert into 의사 values('D002', '김선주', '피부과', '10');
insert into 의사 values('D003', '정선호', '정형외과', '15');
insert into 의사 values('D004', '이바다',  '산부인과', '7');
insert into 의사 values('D005', '임준기', '소아청소년과', '3');
insert into 의사 values('D006', '송서현', '이비인후과', '12');
insert into 의사 values('D007', '유현지', '안과', '6');
insert into 의사 values('D008', '정다인', '신경과', '20');


-- 환자(환자번호, 환자이름, 나이, 담담의사) 데이터 입력
insert into 환자 values('P001', '오우진', '31', 'D002');
insert into 환자 values('P002', '채광주', '50', 'D001');
insert into 환자 values('P003', '김용욱', '43', 'D003');
insert into 환자 values('P004', '전채린', '20', 'D007');
insert into 환자 values('P005', '김보아', '65', 'D005');
insert into 환자 values('P006', '유민선', '13', 'D004');
insert into 환자 values('P007', '최나영', '55', 'D006');
insert into 환자 values('P008', '이현구', '48', 'D008');

-- 데이터 조회
select * from 의사;
select * from 환자;

-- 데이터 삭제
drop table 환자;
drop table 의사;

-- 오우진 담당의사를 D001로 수정

update 환자
set 담당의사='D001'
where 환자이름='오우진';

UPDATE 환자
SET    담당의사 = 'D001'
WHERE  환자이름 = '오우진';

-- 환자번호 P002를 삭제
DELETE
FROM  환자
WHERE 환자번호='P002';
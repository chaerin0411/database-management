use hw03db;
-- 환자(환자번호,환자이름,나이,담당의사)
-- 의사(의사번호,의사이름,소속,근무연수)

DROP TABLE 환자;
DROP TABLE 의사;

-- 환자 테이블 생성
CREATE TABLE 환자(
	환자번호	char(4) NOT NULL,
    환자이름	varchar(10),
    나이		int,
    담당의사	char(4),
    PRIMARY KEY(환자번호),
    FOREIGN KEY(담당의사) REFERENCES 의사(의사번호)
);

-- 의사 테이블 생성
CREATE TABLE 의사(
	의사번호	char(4) NOT NULL,
    의사이름	varchar(10),
	소속		varchar(10),
    근무연수	int,
    PRIMARY KEY(의사번호)
);

-- 환자 테이블 입력
insert into 환자 values('P001','오우진',31,'D002');
insert into 환자 values('P002','채광주',50,'D001');
insert into 환자 values('P003','김용욱',43,'D003');

-- 의사 테이블 입력
insert into 의사 values('D001','정지영','내과',5);
insert into 의사 values('D002','김선주','피부과',10);
insert into 의사 values('D003','정성호','정형외과',15);

-- 환자 테이블 추가 입력
insert into 환자 values('P004','김광석',67,'D003');
insert into 환자 values('P005','신형만',51,'D001');
insert into 환자 values('P006','봉미선',50,'D002');
insert into 환자 values('P007','신짱구',20,'D001');
insert into 환자 values('P008','신짱아',17,'D003');

-- 오우진 담당의사 수정
UPDATE 환자
SET 담당의사 = 'D001'
WHERE 환자번호 = 'P001';

-- 채광주 데이터 삭제
DELETE
FROM 환자
WHERE 환자번호 = 'P002';

select * from 환자;
select * from 의사;
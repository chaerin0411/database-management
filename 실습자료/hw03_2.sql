use hw03db2;
-- 부서(사원번호,사원이름,나이,주소,직급)

DROP TABLE 부서;

-- 부서 테이블 생성
CREATE TABLE 부서(
	사원번호 char(4),
    사원이름 varchar(10),
    나이 int,
    주소 varchar(50),
    직급 varchar(5),
    PRIMARY KEY (사원번호)
);

-- 부서 테이블 입력
insert into 부서 values ('E001','홍준화',30,'서울시 마포구','대리');
insert into 부서 values ('E002','김연주',28,'서울시 영등포구','사원');
insert into 부서 values ('E003','이명기',32,'서울시 강남구','사원');

-- 본인 이름을 입력한 레코드를 입력
insert into 부서 values ('E004','엄지희',20,'서울시 영등포구','사원');

select * from 부서;
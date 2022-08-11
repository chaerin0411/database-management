-- (dept-mysql.sql)
-- 부서(부서코드,부서명,위치)

DROP TABLE 부서;

-- 부서 테이블 생성
CREATE TABLE 부서(
	부서코드	char(2) NOT NULL,
    부서명	char(9),
    위치		char(6),
    PRIMARY KEY(부서코드)
);

-- 부서 테이블 입력
insert into 부서 values('AA','총무부','서울');
insert into 부서 values('BB','영업부','대전');
insert into 부서 values('CC','기획부','서울');

select * from 부서;
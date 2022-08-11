/* 부서(부서코드, 부서명, 위치) */

drop table 부서;

-- 부서 테이블 생성
CREATE TABLE 부서(
	부서코드 CHAR(3) NOT NULL ,
	부서명 CHAR(9) ,
	위치 CHAR(6) ,
	PRIMARY KEY(부서코드)
);

-- 부서 데이터 입력
INSERT INTO 부서 VALUES('AA', '총무부', '서울');
INSERT INTO 부서 VALUES('BB', '영업부', '대전');
INSERT INTO 부서 VALUES('CC', '기획부', '서울');

SELECT * FROM 부서;
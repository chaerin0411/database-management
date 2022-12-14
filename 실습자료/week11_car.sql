/* vehicle_join.sql : (내부조인, 외부조인) */

use studydb;

drop table 고객관리;
drop table 자동차;
drop table 개인신상;


/*-----------------------고객관리 스키마------------------------------------*/


CREATE TABLE 고객관리 ( 
이름 CHAR(9) PRIMARY KEY,
주민번호 CHAR(14), 
생년월일 CHAR(10),
관계 varCHAR(10),
핸드폰번호 CHAR(14),
우편번호 CHAR(9),
주소 VARCHAR(75), 
차종 varCHAR(12), 
차명 VARCHAR(20),
년식 CHAR(4), 
구입일 CHAR(7) 
);


INSERT INTO 고객관리 VALUES ('홍길동','651214-1078767','1965-12-14','친구',
'(011) 234-2342','(111-111)','서울시 구로구 구로본동 234-24',
'승용차','소나타','1998','1998-08');

INSERT INTO 고객관리 VALUES ('임꺽정','700101-1027362','1970-01-01','고객',
'(016)2342-2342','(222-222)','서울시 영등포구 여의도동 234-2',
'트럭','포토','1995','1997-05');

INSERT INTO 고객관리(이름, 주민번호, 생년월일, 관계, 핸드폰번호, 우편번호, 주소 ) 
VALUES ('박찬호','720201-1034343','1973-02-01','후배',
'(017) 234-2342','(333-333)','서울시 강남구 역삼동 234-2');

INSERT INTO 고객관리(이름, 주민번호, 생년월일, 관계, 핸드폰번호, 우편번호, 주소 ) 
VALUES ( '선동열','680709-1078656','1968-07-09','동생',
'(018) 234-2342','(444-444)','서울시 서초구 서초동 234-2') ; 

INSERT INTO 고객관리 VALUES ('차범근','600809-1987766','1960-08-09',
'친구','(017) 234-2342','(555-555)','서울시 종로구 관철동 234-2'
,'승용차','에쿠스','2001','2001-08');


/*--------------------------------------------------------------------------------------------*/

SELECT * FROM 고객관리;

SELECT *
FROM 고객관리
WHERE 차종 IS NOT NULL;

SELECT 	개인신상.이름, 생년월일, 차종, 차명
FROM 	개인신상, 자동차
WHERE	개인신상.이름 = 자동차.이름;

-- 위와 동일한 결과
SELECT 	개인신상.이름, 생년월일, 차종, 차명
FROM 	개인신상 INNER JOIN 자동차
ON		개인신상.이름 = 자동차.이름;


/*---------------------개인신상, 자동차 스키마-------------------------------------------------*/


CREATE TABLE 개인신상 ( 
이름 CHAR(9) PRIMARY KEY,
주민번호 CHAR(14), 
생년월일 CHAR(10),
관계 varCHAR(10),
핸드폰번호 CHAR(14),
우편번호 CHAR(9),
주소 VARCHAR(75) 
);


CREATE TABLE 자동차 ( 
이름 CHAR(9) PRIMARY KEY,
차종 varCHAR(12), 
차명 VARCHAR(20),
년식 CHAR(4), 
구입일 CHAR(7)
);


INSERT INTO 개인신상 ( 이름, 주민번호, 생년월일, 관계, 핸드폰번호, 우편번호, 주소 )
VALUES ( '박찬호','720201-1034343','1973-02-01','후배','(017) 234-2342','(333-333)',
'서울시 강남구 역삼동 234-2');

INSERT INTO 개인신상 ( 이름, 주민번호, 생년월일, 관계, 핸드폰번호, 우편번호, 주소 )
VALUES ( '선동열','680709-1078656','1968-07-09','동생','(018) 234-2342','(444-444)',
'서울시 서초구 서초동 234-2'); 

INSERT INTO 개인신상 ( 이름, 주민번호, 생년월일, 관계, 핸드폰번호, 우편번호, 주소 )
VALUES ( '임꺽정','700101-1027362','1970-01-01','고객','(016)2342-2342','(222-222)',
'서울시 영등포구 여의도동 234-2');

INSERT INTO 개인신상 ( 이름, 주민번호, 생년월일, 관계, 핸드폰번호, 우편번호, 주소 )
VALUES ( '차범근','600809-1987766','1960-08-09','친구','(017) 234-2342','(555-555)',
'서울시 종로구 관철동 234-2');

INSERT INTO 개인신상 ( 이름, 주민번호, 생년월일, 관계, 핸드폰번호, 우편번호, 주소 )
VALUES ( '홍길동','651214-1078767','1965-12-14','친구','(011) 234-2342','(111-111)',
'서울시 구로구 구로본동 234-24');


INSERT INTO 자동차 ( 이름,차종,차명,년식,구입일 ) 
VALUES ('임꺽정','트럭','포토','1995','1997-05');

INSERT INTO 자동차 ( 이름,차종,차명,년식,구입일 ) 
VALUES ('차범근','승용차','에쿠스','2001','2001-08');

INSERT INTO 자동차 ( 이름,차종,차명,년식,구입일 ) 
VALUES ('홍길동','승용차','소나타','1998','1998-08');


-- col 이름 format a10
-- col 관계 format a8
-- col 주소 format a30


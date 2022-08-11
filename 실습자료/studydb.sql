-- 1단계 스키마 생성
create schema `studydb2`
	default character set utf8;

use studydb2;

DROP TABLE 주소록;

-- 2단계 테이블 생성
-- 주소록(번호, 이름, 전화번호, 주소, 생일)
CREATE TABLE 주소록 (
	번호    int auto_increment,
	이름    char(10),
    전화번호 char(13),
    주소    varchar(10),
    생일    varchar(11),
    PRIMARY KEY(번호)
);

INSERT INTO 주소록(이름, 전화번호, 주소, 생일)
VALUES('홍길동','010-1234-5678','서울','3월 15일');

INSERT INTO 주소록(이름, 전화번호, 주소, 생일)
VALUES('이몽룡','010-3354-5643','부산','12월 14일');

INSERT INTO 주소록
VALUES('최용만','321-2345','대전','5월 8일');

DELETE
FROM 주소록
WHERE 이름 = '최용만';

INSERT INTO 주소록(이름, 전화번호, 주소, 생일)
VALUES('최용만','321-2345','대전','5월 8일');

-- 널 값 데이터 입력

-- 방법 1
INSERT INTO 주소록
VALUES('이건우','010-2132-2345',NULL,NULL);
-- '번호' 속성이 추가되었을 경우 오류발생

-- INSERT INTO 주소록
-- VALUES('이건우','010-2132-2345');
-- 오류발생

DELETE
FROM 주소록
WHERE 이름 = '이건우';

-- 방법 2
INSERT INTO 주소록(이름, 전화번호)
VALUES('이건우','010-2132-2345');

-- INSERT INTO 주소록(전화번호, 이름)
-- VALUES('이건우', '010-2132-2345');
-- 오류발생

-- INSERT INTO 주소록(전화번호, 이름)
-- VALUES('010-2132-2345', '이건우');
-- 오류 발생안함

select * from 주소록;
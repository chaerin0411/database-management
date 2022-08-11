-- (DB04.sql)
-- 교수(교수번호, 이름, 전공분야)
-- 학과(학과명, 전화번호, 사무실위치, 학과장, 임명일자)
-- 과목(과목번호, 과목명, 과목개요, 담당교수)
-- 학생(학번,이름, 주소, 나이, 생년월일, 학과명, 지도교수, 면담일자)
-- 등록(학번, 과목번호)
-- 보유기술(기술보유교수, 보유기술)
-- 섹션(과목번호, 섹션번호)

-- 테이블 삭제
drop table 섹션;
drop table 보유기술;
drop table 등록;
drop table 학생;
drop table 과목;
drop table 학과;
drop table 교수;

-- 테이블 생성
-- 교수(교수번호, 이름, 전공분야)
CREATE TABLE 교수
(
	교수번호             CHAR(18) NOT NULL ,
	이름                 VARCHAR(18) NULL ,
	전공분야             VARCHAR(30) NULL ,
    PRIMARY KEY (교수번호)
);

-- 학과(학과명, 전화번호, 사무실위치, 학과장, 임명일자)
CREATE TABLE 학과
(
	학과명               VARCHAR(18) NOT NULL ,
	전화번호             VARCHAR(18) NULL ,
	사무실위치           VARCHAR(18) NULL ,
	학과장               CHAR(18) NULL ,
	임명일자             CHAR(18) NULL ,
    PRIMARY KEY (학과명) ,
    FOREIGN KEY (학과장) REFERENCES 교수(교수번호)
);

-- 과목(과목번호, 과목명, 과목개요, 담당교수)
CREATE TABLE 과목
(
	과목번호             CHAR(18) NOT NULL ,
	과목명               VARCHAR(18) NULL ,
	과목개요             VARCHAR(70) NULL ,
	담당교수             CHAR(18) NULL ,
    PRIMARY KEY (과목번호) ,
    FOREIGN KEY (담당교수) REFERENCES 교수(교수번호)
);

-- 학생(학번,이름, 주소, 나이, 생년월일, 학과명, 지도교수, 면담일자)
CREATE TABLE 학생
(
	학번                 CHAR(18) NOT NULL ,
	이름                 VARCHAR(18) NULL ,
	주소                 VARCHAR(30) NULL ,
	나이                 INT NULL ,
	생년월일             VARCHAR(18) NULL ,
	학과명               VARCHAR(18) NULL ,
	지도교수             CHAR(18) NULL ,
	면담시간             CHAR(18) NULL ,
    PRIMARY KEY (학번) ,
    FOREIGN KEY (학과명) REFERENCES 학과(학과명) ,
    FOREIGN KEY (지도교수) REFERENCES 교수(교수번호)
);

-- 등록(학번, 과목번호)
CREATE TABLE 등록
(
	학번                 CHAR(18) NOT NULL ,
	과목번호             CHAR(18) NOT NULL ,
    PRIMARY KEY (학번, 과목번호) ,
    FOREIGN KEY (학번) REFERENCES 학생(학번) ,
    FOREIGN KEY (과목번호) REFERENCES 과목(과목번호)
);

-- 보유기술(기술보유교수, 보유기술)
CREATE TABLE 보유기술
(
	기술보유교수         CHAR(18) NOT NULL ,
	보유기술             VARCHAR(50) NOT NULL ,
    PRIMARY KEY (기술보유교수, 보유기술) ,
    FOREIGN KEY (기술보유교수) REFERENCES 교수(교수번호)
);

-- 섹션(과목번호, 섹션번호)
CREATE TABLE 섹션
(
	과목번호             CHAR(18) NOT NULL ,
	섹션번호             CHAR(18) NOT NULL ,
    PRIMARY KEY (과목번호, 섹션번호) ,
    FOREIGN KEY (과목번호) REFERENCES 과목(과목번호)
);

-- 데이터 입력
-- 교수(교수번호, 이름, 전공분야)
insert into 교수 values('301', '오용철', '데이터베이스');
insert into 교수 values('504', '최종필', '멀티미디어');
insert into 교수 values('505', '정의훈', '네트워크');
insert into 교수 values('556', '이용희', '게임 인공지능');

-- 학과(학과명, 전화번호, 사무실위치, 학과장, 임명일자)
insert into 학과 values('컴퓨터공학과', '031-1234-5678', 'E동 3층', '504', '2007년');
insert into 학과 values('게임공학과', '031-1234-9876', 'E동 4층', '556', '2006년');

-- 과목(과목번호, 과목명, 과목개요, 담당교수)
insert into 과목 values('0205', '프로그래밍', 'c 언어 기반 프로그래밍', '301');
insert into 과목 values('0211', '데이터베이스', '데이터베이스 디자인 실습 및 구축', '301');
insert into 과목 values('5029', '데이터통신', '데이터 전송과 관련된 요소 기술들 소개', '505');

-- 학생(학번,이름, 주소, 나이, 생년월일, 학과명, 지도교수, 면담일자)
insert into 학생 values('2004150051', '황도경', '경기도 고양시', 25, '1985.3.22', '컴퓨터공학과', '504','목 6교시');
insert into 학생 values('2007150006', '곽나리', '서울시 영등포구', 22, '1988.9.17', '컴퓨터공학과', '301','월 3교시');
insert into 학생 values('2005152033', '이민구', '경기도 군포시', 24, '1985.4.30', '컴퓨터공학과', '301','월 2교시');
insert into 학생 values('2007130012', '정소연', '서울시 성북구', 22, '1988.7.13', '게임공학과', '556','수 1교시');

-- 등록(학번, 과목번호)
insert into 등록 values('2004150051', '0205');
insert into 등록 values('2004150051', '0211');
insert into 등록 values('2005152033', '0211');
insert into 등록 values('2007150006', '5029');

-- 보유기술(기술보유교수, 보유기술)
insert into 보유기술 values('505', '비동기 W-CDMA 단말기 모뎀 제어 소프트웨어');
insert into 보유기술 values('505', 'CDMA 1X 단말기 SMS 소프트웨어');
insert into 보유기술 values('556', '표면 검사(Surface Detect Inspection) 시스템');

-- 섹션(과목번호, 섹션번호)
insert into 섹션 values('0205', '1');
insert into 섹션 values('0211', '3');
insert into 섹션 values('5029', '1');

-- 데이터 조회
select * from 교수;
select * from 학과;
select * from 과목;
select * from 학생;
select * from 등록;
select * from 보유기술;
select * from 섹션;

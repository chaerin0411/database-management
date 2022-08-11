-- (book-k-ora.sql)

drop table 도서;

-- 테이블 생성
-- 도서(도서번호, 도서명, 출판사, 정가)
(
	도서번호             INT NOT NULL ,
	도서명               VARCHAR(50) ,
	출판사               VARCHAR(30) ,
	정가                 INT ,
	PRIMARY KEY (도서번호)
);

-- 데이터 입력
-- 도서(도서번호, 도서명, 출판사, 정가)
insert into book values(1, '축구의 역사', '굿스포츠', 7000);
insert into book values(2, '축구 아는 여자', '나무수', 13000);
insert into book values(3, '축구의 이해', '대한미디어', 22000);
insert into book values(4, '골프 바이블', '대한미디어', 35000);
insert into book values(5, '피겨 교본', '굿스포츠', 8000);

-- 형식 명령어
COL 도서명 FORMAT 99
COL 도서명 FORMAT a30
COL publisher FORMAT a20
COL price FORMAT 999999

-- 데이터 조회
select * from 도서;

-- (book-ora.sql)
-- book(bookid, bookname, publisher, price)

drop table book;

-- 테이블 생성
-- book(bookid, bookname, publisher, price)
CREATE TABLE book
(
	bookid               INTEGER NOT NULL ,
	bookname             VARCHAR2(50) NULL ,
	publisher            VARCHAR2(30) NULL ,
	price                INTEGER NULL ,
    primary key(bookid)
);

-- 데이터 입력
-- book(bookid, bookname, publisher, price)
insert into book values(1, '축구의 역사', '굿스포츠', 7000);
insert into book values(2, '축구 아는 여자', '나무수', 13000);
insert into book values(3, '축구의 이해', '대한미디어', 22000);
insert into book values(4, '골프 바이블', '대한미디어', 35000);
insert into book values(5, '피겨 교본', '굿스포츠', 8000);

-- 데이터 조회
select * from book;

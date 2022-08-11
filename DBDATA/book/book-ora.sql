-- (book-ora.sql)
-- book(bookid, bookname, publisher, price)

drop table book;

-- ���̺� ����
-- book(bookid, bookname, publisher, price)
CREATE TABLE book
(
	bookid               INTEGER NOT NULL ,
	bookname             VARCHAR2(50) NULL ,
	publisher            VARCHAR2(30) NULL ,
	price                INTEGER NULL ,
    primary key(bookid)
);

-- ������ �Է�
-- book(bookid, bookname, publisher, price)
insert into book values(1, '�౸�� ����', '�½�����', 7000);
insert into book values(2, '�౸ �ƴ� ����', '������', 13000);
insert into book values(3, '�౸�� ����', '���ѹ̵��', 22000);
insert into book values(4, '���� ���̺�', '���ѹ̵��', 35000);
insert into book values(5, '�ǰ� ����', '�½�����', 8000);

-- ������ ��ȸ
select * from book;

--(ex08-03.sql)

-- ��ȭ(��ȭ�ڵ�, ��ȭ����, �帣, ��������, �󿵽ð�)
-- ���(����ȣ, ����̸�, ����)
-- �⿬(�Ϸù�ȣ, ��ȭ�ڵ�, ����ȣ, �⿬��)

-- ���̺� ����
drop table �⿬;
drop table ��ȭ;
drop table ���;

-- ���̺� ����
-- ��ȭ(��ȭ�ڵ�, ��ȭ����, �帣, ��������, �󿵽ð�)
create table ��ȭ (
    ��ȭ�ڵ� char(4) NOT NULL PRIMARY KEY ,
    ��ȭ���� varchar(50) NOT NULL ,
    �帣 varchar(50) ,
    �������� int ,
    �󿵽ð� int 
);
    
?-- ������ ����
-- ��ȭ(��ȭ�ڵ�, ��ȭ����, �帣, ��������, �󿵽ð�)
insert into ��ȭ values('MC01','���ӽ�ĵ��','�ڹ̵�',12,108);
insert into ��ȭ values('MC02','�������α׳�','�ڹ̵�',15,122);
insert into ��ȭ values('MD01','Ű�ٸ�������','���',12,110);
insert into ��ȭ values('MD02','�ٺ�','���',12,99);

?-- ���̺� ����
-- ���(����ȣ, ����̸�, ����)
create table ��� (
    ����ȣ char(4) NOT NULL PRIMARY KEY ,
    ����̸� varchar(8) NOT NULL ,
    ���� char(3) 
);

?-- ������ ����
-- ���(����ȣ, ����̸�, ����)
insert into ��� values('a001','������','��');
insert into ��� values('a002','������','��');

-- ���̺� ����
?-- �⿬(�Ϸù�ȣ, ��ȭ�ڵ�, ����ȣ, �⿬��)
create table �⿬ (
    �Ϸù�ȣ int ,
    ��ȭ�ڵ� char(4) NOT NULL ,
    ����ȣ char(4) NOT NULL , 
    �⿬�� int ,
    CONSTRAINT PK_�⿬_�Ϸù�ȣ PRIMARY KEY(�Ϸù�ȣ) ,
    FOREIGN KEY(��ȭ�ڵ�) REFERENCES ��ȭ�ڵ�(��ȣ) ,
    FOREIGN KEY(����ȣ) REFERENCES ����ȣ(��ȣ) ,
);

?-- ������ �Է�
-- �⿬(�Ϸù�ȣ, ��ȭ�ڵ�, ����ȣ, �⿬��)
insert into �⿬ values('MC01','a001',1000);
insert into �⿬ values('MC02','a001',700);
insert into �⿬ values('MD01','a002',400);
insert into �⿬ values('MD02','a001',600);
insert into �⿬ values('MD02','a002',600);


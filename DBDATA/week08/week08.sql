-- (week08.sql)
-- (Oracle)

-- �а�(�а��ڵ�, �а���)
-- �л�(�й�, �̸�, �а��ڵ�)

-- ���̺� ����
drop table �л�;
drop table �а�;

-- ���̺� ����
-- �а�(�а��ڵ�, �а���)
create table �а� (
    �а��ڵ� char(4) not null ,
    �а��� varchar(30) ,
    constraint pk_�а�_�а��ڵ� primary key(�а��ڵ�)
);

-- �л�(�й�, �̸�, �а��ڵ�)
create table �л� (
    �й� char(4) not null ,
    �̸� varchar(10) ,
    �а��ڵ� char(4) ,
    constraint pk_�л�_�й� primary key(�й�) ,
    constraint fk_�а�_�а��ڵ� foreign key(�а��ڵ�) references �а�(�а��ڵ�)
);

-- ������ �Է�
-- �а�(�а��ڵ�, �а���)
insert into �а� values('1001', '��ǻ���а�');
insert into �а� values('2001', 'ü���а�');

-- �л�(�й�, �̸�, �а��ڵ�)
insert into �л� values('501', '������', '1001');
insert into �л� values('401', '�迬��', '2001');
insert into �л� values('402', '��̶�', '2001');
insert into �л� values('502', '�߽ż�', '1001');

col �а��ڵ� for a8
col �а��� for a10
col �й� for a4

-- ������ ��ȸ
select * from �а�;
select * from �л�;

/*------------------------------------------------------------------------*/

-- �а�2(�а��ڵ�, �а���)
-- �л�2(�й�, �̸�, �а��ڵ�)

-- ���̺� ����
drop table �л�2;
drop table �а�2;

-- ���̺� ����
-- �а�2(�а��ڵ�, �а���)
create table �а�2 (
    �а��ڵ� char(4) not null ,
    �а��� varchar(30) ,
    constraint pk_�а�2_�а��ڵ� primary key(�а��ڵ�)
);

-- �л�2(�й�, �̸�, �а��ڵ�)
create table �л�2 (
    �й� char(4) not null ,
    �̸� varchar(10) ,
    �а��ڵ� char(4) ,
    constraint pk_�л�2_�й� primary key(�й�) ,
    constraint fk_�а�2_�а��ڵ� foreign key(�а��ڵ�) references �а�2(�а��ڵ�) on delete cascade
);

-- ������ �Է�
-- �а�2(�а��ڵ�, �а���)
insert into �а�2 values('1001', '��ǻ���а�');
insert into �а�2 values('2001', 'ü���а�');

-- �л�2(�й�, �̸�, �а��ڵ�)
insert into �л�2 values('501', '������', '1001');
insert into �л�2 values('401', '�迬��', '2001');
insert into �л�2 values('402', '��̶�', '2001');
insert into �л�2 values('502', '�߽ż�', '1001');

-- ������ ��ȸ
select * from �а�2;
select * from �л�2;

/*------------------------------------------------------------------------*/

-- �а�3(�а��ڵ�, �а���)
-- �л�3(�й�, �̸�, �а��ڵ�)

-- ���̺� ����
drop table �л�3;
drop table �а�3;

-- ���̺� ����
-- �а�3(�а��ڵ�, �а���)
create table �а�3 (
    �а��ڵ� char(4) not null ,
    �а��� varchar(30) ,
    constraint pk_�а�3_�а��ڵ� primary key(�а��ڵ�)
);

-- �л�3(�й�, �̸�, �а��ڵ�)
create table �л�3 (
    �й� char(4) not null ,
    �̸� varchar(10) ,
    �а��ڵ� char(4) ,
    constraint pk_�л�3_�й� primary key(�й�) ,
    constraint fk_�а�3_�а��ڵ� foreign key(�а��ڵ�) references �а�3(�а��ڵ�) on delete set null
);

-- ������ �Է�
-- �а�3(�а��ڵ�, �а���)
insert into �а�3 values('1001', '��ǻ���а�');
insert into �а�3 values('2001', 'ü���а�');

-- �л�3(�й�, �̸�, �а��ڵ�)
insert into �л�3 values('501', '������', '1001');
insert into �л�3 values('401', '�迬��', '2001');
insert into �л�3 values('402', '��̶�', '2001');
insert into �л�3 values('502', '�߽ż�', '1001');

-- ������ ��ȸ
select * from �а�3;
select * from �л�3;

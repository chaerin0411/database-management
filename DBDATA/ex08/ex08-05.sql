-- (ex08-05.sql)

-- ���(�����ȣ, �̸�, �μ���)
-- ��ǰ(��ǰ��ȣ, ��ǰ��, �ܰ�)
-- �Ǹ�(�����ȣ, ��ǰ��ȣ, ����)

-- ���̺� ����
drop table �Ǹ�;
drop table ���;
drop table ��ǰ;

-- ���̺� ����
-- ���(�����ȣ, �̸�, �μ���)
create table ��� (
    �����ȣ int not null ,
    �̸� varchar(10) ,
    �μ��� varchar(20) ,
    primary key(�����ȣ)
);

-- ��ǰ(��ǰ��ȣ, ��ǰ��, �ܰ�)
create table ��ǰ (
    ��ǰ��ȣ char(4) not null ,
    ��ǰ�� varchar(10) ,
    �ܰ� int ,
    primary key(��ǰ��ȣ)
);

-- �Ǹ�(�����ȣ, ��ǰ��ȣ, ����)
create table �Ǹ� (
    �����ȣ int not null ,
    ��ǰ��ȣ char(4) not null ,
    ���� int ,
    primary key(�����ȣ, ��ǰ��ȣ) ,
    foreign key(�����ȣ) references ���(�����ȣ) ,
    foreign key(��ǰ��ȣ) references ��ǰ(��ǰ��ȣ)
);

-- ������ �Է�
-- ���(�����ȣ, �̸�, �μ���)
insert into ��� values(1, '���ϳ�', '����1��');
insert into ��� values(2, '�̵���', '����2��');
insert into ��� values(3, '���¼�', '����3��');

-- ��ǰ(��ǰ��ȣ, ��ǰ��, �ܰ�)
insert into ��ǰ values('PD01', 'RS-101', 21500);
insert into ��ǰ values('PD02', 'RS-102', 18700);
insert into ��ǰ values('PD03', 'RS-103', 23100);

-- �Ǹ�(�����ȣ, ��ǰ��ȣ, ����)
insert into �Ǹ� values(1, 'PD01', 500);
insert into �Ǹ� values(2, 'PD03', 487);
insert into �Ǹ� values(1, 'PD03', 95);

-- ������ �˻�
select * from ���;
select * from ��ǰ;
select * from �Ǹ�;

-- (3�� ���̺� ����)
-- ��ǰ�� �Ǹ��� �����ȣ, �����, ��ǰ��ȣ, ��ǰ��, ������ �˻��϶�
-- 1) select from where �� ���
select ���.�����ȣ, �̸�, ��ǰ.��ǰ��ȣ, ��ǰ��, ����
from ���, ��ǰ, �Ǹ�
where ���.�����ȣ = �Ǹ�.�����ȣ 
and ��ǰ.��ǰ��ȣ = �Ǹ�.��ǰ��ȣ;

-- 2) select from on �� ���
select ���.�����ȣ, �̸�, ��ǰ.��ǰ��ȣ, ��ǰ��, ����
from ��� inner join �Ǹ�
on ���.�����ȣ = �Ǹ�.�����ȣ 
inner join ��ǰ
on ��ǰ.��ǰ��ȣ = �Ǹ�.��ǰ��ȣ;

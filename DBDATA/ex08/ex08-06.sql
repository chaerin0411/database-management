-- (ex08-06.sql)

-- ����(������ȣ, �̸�, �ּ�, �����ȣ)
-- ���̺� ����
drop table ����;

-- ���̺� ����
create table ���� (
    ������ȣ int not null ,
    �̸� varchar(10) ,
    �ּ� varchar(30) ,
    �����ȣ int ,
    primary key(������ȣ) ,
    foreign key(�����ȣ) references ����(������ȣ)
);

-- ������ �Է�
insert into ���� values(1, '������', '���� ��ü��Ÿ', null);
insert into ���� values(4, '�߽ż�', '�̱� Ŭ������', null);
insert into ���� values(3, '��̶�', '���ѹα� ������', 4);
insert into ���� values(2, '�迬��', '���ѹα� ����', 3);

-- ������ ��ȸ
select * from ����;
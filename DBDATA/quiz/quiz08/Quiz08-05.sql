-- (Quiz08-05.sql)

-- ����(�����ڵ�, ������, ����)
-- ȯ��(ȯ�ڹ�ȣ, �̸�, �����ڵ�, ����)

-- ���̺� ����
drop table ȯ��;
drop table ����;

-- ���̺� ����
-- ����(�����ڵ�, ������, ����)
CREATE TABLE ���� (
     �����ڵ� char(3) NOT NULL,
     ������ varchar(20) NULL,
     ���� varchar(20) NULL,
     primary key(�����ڵ�)
);
 
-- ȯ��(ȯ�ڹ�ȣ, �̸�, �����ڵ�, ����)
CREATE TABLE ȯ�� (
     ȯ�ڹ�ȣ char(5) NOT NULL,
     �̸� varchar(8) NULL,
     �����ڵ� char(3) NULL,
     ���� int NULL,
     primary key(ȯ�ڹ�ȣ) ,
     foreign key(�����ڵ�) references ����(�����ڵ�)
);

-- ������ ����
-- ����(�����ڵ�, ������, ����)
insert into ���� values('A01', '������', '��������');
insert into ���� values('A02', '�ݷ���', '����');
insert into ���� values('A03', '�������', '�߿�');
insert into ���� values('A04', '��ƼǪ��', '�߿�');

-- ȯ��(ȯ�ڹ�ȣ, �̸�, �����ڵ�, ����)
insert into ȯ��(ȯ�ڹ�ȣ, �̸�, �����ڵ�, ����) values('P1001','��ö��','A01',30);
insert into ȯ��(ȯ�ڹ�ȣ, �̸�, �����ڵ�, ����) values('P1002','�����','A03',29);
insert into ȯ��(ȯ�ڹ�ȣ, �̸�, �����ڵ�, ����) values('P1003','�ӿ���','A01',50);
insert into ȯ��(ȯ�ڹ�ȣ, �̸�, �����ڵ�, ����) values('Q1001','���ѳ�','A04',40);

-- ������ ��ȸ
select * from ����;
select * from ȯ��;

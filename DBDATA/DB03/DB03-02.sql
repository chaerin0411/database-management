--(DB03-02.sql)
-- ����(�����ڵ�, ������, ����)
-- ȯ��(ȯ�ڹ�ȣ, �̸�, �����ڵ�, ����)

-- ���̺� ����
-- ����(�����ڵ�, ������, ����)
CREATE TABLE ����
(
	�����ڵ�             CHAR(18) NOT NULL ,
	������               VARCHAR(18) NULL ,
	����                 VARCHAR(18) NULL ,
    PRIMARY KEY (�����ڵ�)
);

-- ȯ��(ȯ�ڹ�ȣ, �̸�, �����ڵ�, ����)
CREATE TABLE ȯ��
(
	ȯ�ڹ�ȣ             CHAR(18) NOT NULL ,
	�̸�                 VARCHAR(18) NULL ,
	�����ڵ�             CHAR(18) NULL ,
	����                 int NULL ,
    PRIMARY KEY (ȯ�ڹ�ȣ) ,
    FOREIGN KEY (�����ڵ�) REFERENCES ����(�����ڵ�)
);

-- ������ �Է�
-- ����(�����ڵ�, ������, ����)
insert into ���� values('A01', '������', '��������');
insert into ���� values('A02', '�ݷ���', '����');
insert into ���� values('A03', '�������', '�߿�');
insert into ���� values('A04', '��ƼǪ��', '�߿�');

-- ȯ��(ȯ�ڹ�ȣ, �̸�, �����ڵ�, ����)
insert into ȯ�� values('P1001', '��ö��', 'A01', 30);
insert into ȯ�� values('P1002', '�����', 'A03', 29);
insert into ȯ�� values('P1003', '�ӿ���', 'A01', 50);
insert into ȯ�� values('Q1001', '���ѳ�', 'A04', 40);

-- ������ ��ȸ
select * from ����;
select * from ȯ��;

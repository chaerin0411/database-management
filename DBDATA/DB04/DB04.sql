-- (DB04.sql)
-- ����(������ȣ, �̸�, �����о�)
-- �а�(�а���, ��ȭ��ȣ, �繫����ġ, �а���, �Ӹ�����)
-- ����(�����ȣ, �����, ���񰳿�, ��米��)
-- �л�(�й�,�̸�, �ּ�, ����, �������, �а���, ��������, �������)
-- ���(�й�, �����ȣ)
-- �������(�����������, �������)
-- ����(�����ȣ, ���ǹ�ȣ)

-- ���̺� ����
drop table ����;
drop table �������;
drop table ���;
drop table �л�;
drop table ����;
drop table �а�;
drop table ����;

-- ���̺� ����
-- ����(������ȣ, �̸�, �����о�)
CREATE TABLE ����
(
	������ȣ             CHAR(18) NOT NULL ,
	�̸�                 VARCHAR(18) NULL ,
	�����о�             VARCHAR(30) NULL ,
    PRIMARY KEY (������ȣ)
);

-- �а�(�а���, ��ȭ��ȣ, �繫����ġ, �а���, �Ӹ�����)
CREATE TABLE �а�
(
	�а���               VARCHAR(18) NOT NULL ,
	��ȭ��ȣ             VARCHAR(18) NULL ,
	�繫����ġ           VARCHAR(18) NULL ,
	�а���               CHAR(18) NULL ,
	�Ӹ�����             CHAR(18) NULL ,
    PRIMARY KEY (�а���) ,
    FOREIGN KEY (�а���) REFERENCES ����(������ȣ)
);

-- ����(�����ȣ, �����, ���񰳿�, ��米��)
CREATE TABLE ����
(
	�����ȣ             CHAR(18) NOT NULL ,
	�����               VARCHAR(18) NULL ,
	���񰳿�             VARCHAR(70) NULL ,
	��米��             CHAR(18) NULL ,
    PRIMARY KEY (�����ȣ) ,
    FOREIGN KEY (��米��) REFERENCES ����(������ȣ)
);

-- �л�(�й�,�̸�, �ּ�, ����, �������, �а���, ��������, �������)
CREATE TABLE �л�
(
	�й�                 CHAR(18) NOT NULL ,
	�̸�                 VARCHAR(18) NULL ,
	�ּ�                 VARCHAR(30) NULL ,
	����                 INT NULL ,
	�������             VARCHAR(18) NULL ,
	�а���               VARCHAR(18) NULL ,
	��������             CHAR(18) NULL ,
	���ð�             CHAR(18) NULL ,
    PRIMARY KEY (�й�) ,
    FOREIGN KEY (�а���) REFERENCES �а�(�а���) ,
    FOREIGN KEY (��������) REFERENCES ����(������ȣ)
);

-- ���(�й�, �����ȣ)
CREATE TABLE ���
(
	�й�                 CHAR(18) NOT NULL ,
	�����ȣ             CHAR(18) NOT NULL ,
    PRIMARY KEY (�й�, �����ȣ) ,
    FOREIGN KEY (�й�) REFERENCES �л�(�й�) ,
    FOREIGN KEY (�����ȣ) REFERENCES ����(�����ȣ)
);

-- �������(�����������, �������)
CREATE TABLE �������
(
	�����������         CHAR(18) NOT NULL ,
	�������             VARCHAR(50) NOT NULL ,
    PRIMARY KEY (�����������, �������) ,
    FOREIGN KEY (�����������) REFERENCES ����(������ȣ)
);

-- ����(�����ȣ, ���ǹ�ȣ)
CREATE TABLE ����
(
	�����ȣ             CHAR(18) NOT NULL ,
	���ǹ�ȣ             CHAR(18) NOT NULL ,
    PRIMARY KEY (�����ȣ, ���ǹ�ȣ) ,
    FOREIGN KEY (�����ȣ) REFERENCES ����(�����ȣ)
);

-- ������ �Է�
-- ����(������ȣ, �̸�, �����о�)
insert into ���� values('301', '����ö', '�����ͺ��̽�');
insert into ���� values('504', '������', '��Ƽ�̵��');
insert into ���� values('505', '������', '��Ʈ��ũ');
insert into ���� values('556', '�̿���', '���� �ΰ�����');

-- �а�(�а���, ��ȭ��ȣ, �繫����ġ, �а���, �Ӹ�����)
insert into �а� values('��ǻ�Ͱ��а�', '031-1234-5678', 'E�� 3��', '504', '2007��');
insert into �а� values('���Ӱ��а�', '031-1234-9876', 'E�� 4��', '556', '2006��');

-- ����(�����ȣ, �����, ���񰳿�, ��米��)
insert into ���� values('0205', '���α׷���', 'c ��� ��� ���α׷���', '301');
insert into ���� values('0211', '�����ͺ��̽�', '�����ͺ��̽� ������ �ǽ� �� ����', '301');
insert into ���� values('5029', '���������', '������ ���۰� ���õ� ��� ����� �Ұ�', '505');

-- �л�(�й�,�̸�, �ּ�, ����, �������, �а���, ��������, �������)
insert into �л� values('2004150051', 'Ȳ����', '��⵵ ����', 25, '1985.3.22', '��ǻ�Ͱ��а�', '504','�� 6����');
insert into �л� values('2007150006', '������', '����� ��������', 22, '1988.9.17', '��ǻ�Ͱ��а�', '301','�� 3����');
insert into �л� values('2005152033', '�̹α�', '��⵵ ������', 24, '1985.4.30', '��ǻ�Ͱ��а�', '301','�� 2����');
insert into �л� values('2007130012', '���ҿ�', '����� ���ϱ�', 22, '1988.7.13', '���Ӱ��а�', '556','�� 1����');

-- ���(�й�, �����ȣ)
insert into ��� values('2004150051', '0205');
insert into ��� values('2004150051', '0211');
insert into ��� values('2005152033', '0211');
insert into ��� values('2007150006', '5029');

-- �������(�����������, �������)
insert into ������� values('505', '�񵿱� W-CDMA �ܸ��� �� ���� ����Ʈ����');
insert into ������� values('505', 'CDMA 1X �ܸ��� SMS ����Ʈ����');
insert into ������� values('556', 'ǥ�� �˻�(Surface Detect Inspection) �ý���');

-- ����(�����ȣ, ���ǹ�ȣ)
insert into ���� values('0205', '1');
insert into ���� values('0211', '3');
insert into ���� values('5029', '1');

-- ������ ��ȸ
select * from ����;
select * from �а�;
select * from ����;
select * from �л�;
select * from ���;
select * from �������;
select * from ����;

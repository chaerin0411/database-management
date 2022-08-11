-- (Quiz08-04.sql)

-- ����(�����ȣ, ����)
-- �λ�(����, �Ҽ�, �����ȣ)

-- ���̺� ����
drop table �λ�;
drop table ����;

-- ���̺� ����
-- ����(�����ȣ, ����)
CREATE TABLE ���� (
    �����ȣ CHAR(2) NOT NULL ,
    ���� CHAR(1) NULL ,
    PRIMARY KEY (�����ȣ)
);

-- �λ�(����, �Ҽ�, �����ȣ)
CREATE TABLE �λ� (
    ���� nvarchar2(3) NOT NULL ,
    �Ҽ� nvarchar2(3) NULL ,
    �����ȣ CHAR(2) NULL ,
    PRIMARY KEY (����) ,
    FOREIGN KEY (�����ȣ) REFERENCES ���� (�����ȣ) 
    ON DELETE SET NULL
);

-- ������ �Է�
-- ����(�����ȣ, ����)
insert into ���� values('23','A');
insert into ���� values('25','B');
insert into ���� values('43','C');
insert into ���� values('56','D');

-- �λ�(����, �Ҽ�, �����ȣ)
insert into �λ� values('���̼�','�ѹ���','25');
insert into �λ� values('������','�����','56');
insert into �λ� values('������','������','23');
insert into �λ� values('������','������','43');

-- ������ ��ȸ
select * from ����;
select * from �λ�;

-- ���� ������ ������ ������ ��������?
select ����
from ����
where �����ȣ = (select �����ȣ
                 from �λ�
                 where ���� = '������');
                 
-- �ζ��� ��(in-line view)
-- �̸� �߿� '��' �� ���� ����� ����, �ҼӰ� ���� ������ �˻��϶�
select t.����, t.�Ҽ�, ����
from (select ����, �Ҽ�, �����ȣ
      from �λ�
      where ���� like '%��%') t, ����
where t.�����ȣ = ����.�����ȣ;

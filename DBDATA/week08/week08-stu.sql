-- (week08.sql)

-- �а�(�а��ڵ�, �а���)
-- �л�(�й�, �̸�, �а��ڵ�)

select * from �а�;
select * from �л�;

update �л�
set �а��ڵ� = '1001'
where �̸� = '�迬��';

-- ��ƼƼ ���Ἲ ��������(��ü ���Ἲ ��������) ����
insert into �а� values('1001', '��ǻ���а�');

-- �������Ἲ ��������
insert into �л� values('601', '�ڼ���','3001');

delete
from �а�
where �а��ڵ�='1001';

-- ����(rectrict) �� ���
--���� (������?)
update �а�
set �а��ڵ� = 'A001'
where �а��ڵ� = '1001';

--���� (������?)
delete
from �а�
where �а��ڵ� = '2001';

-- ����(cascade) �� ��� --> update�� ������, delete�� ����
-- on delete cascade

-- ������ ���డ���Ѱ�?
select * from �а�2;
select * from �л�2;

--���� (������?)
update �а�2
set �а��ڵ� = 'A001'
where �а��ڵ� = '1001';

delete
from �а�2
where �а��ڵ� = '2001';

-- �� ��(set null) �� ��� --> update�� ������, delete�� ����
-- on delete set null

--���� (������?)
update �а�3
set �а��ڵ� = 'A001'
where �а��ڵ� = '1001';

delete
from �а�3
where �а��ڵ� = '2001';

select *
from �л�3
where �а��ڵ� is null;

select *
from �л�3
where �а��ڵ� is not null;

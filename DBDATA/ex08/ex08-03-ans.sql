--(ex08-03-ans.sql)

-- ��ȭ(��ȭ�ڵ�, ��ȭ����, �帣, ��������, �󿵽ð�)
-- ���(����ȣ, ����̸�, ����)
-- �⿬(�Ϸù�ȣ, ��ȭ�ڵ�, ����ȣ, �⿬��)


-- 1) �帣�� �ڹ̵� �̰ų� ��� �� ��ȭ����, �帣�� �˻��϶�(IN ���)
select ��ȭ����, �帣
from ��ȭ
where �帣 = '�ڹ̵�' or �帣 = '���';

select ��ȭ����, �帣
from ��ȭ
where �帣 in ('�ڹ̵�', '���');

-- 1-1) �帣�� �ڹ̵�� ��󸶰� �ƴ� ��ȭ����, �帣�� �˻��϶�(NOT IN ���)
select ��ȭ����, �帣
from ��ȭ
where �帣<> '�ڹ̵�' and �帣 <> '���';

select ��ȭ����, �帣
from ��ȭ
where �帣 not in ('�ڹ̵�', '���');

-- 2) �帣�� �ְ� �󿵽ð��� �˻��϶�
select �帣, max(�󿵽ð�)
from ��ȭ
group by �帣;

-- 3) ��ȭ���� '������'�� ���� ��� ���� �˻��϶�
select *
from ��ȭ
where ��ȭ���� like '%������%';

-- 4) ������ ���� ����ȣ, ����̸��� ����̸��� ������������ �˻��϶�
select ����ȣ, ����̸�
from ��ȭ
where ���� = '��'
order by ����̸� asc;

-- 5) �⿬�ᰡ 500���� 1000�� ��ȭ�ڵ�, ����ȣ, �⿬�� �˻��϶�
select ��ȭ�ڵ�, ����ȣ, �⿬��
from �⿬
where �⿬�� >= 500 and �⿬�� <= 1000;

-- 6) ���� SQL������ �������� �ۼ��ϰ� ������ ����

SELECT COUNT(�帣), COUNT(DISTINCT �帣)
FROM ��ȭ;
-- 4, 2, �ߺ� ���Կ���

-- 7) �������� �⿬�� ��ȭ�� �⿬�Ḧ �˻��϶�
select �⿬��
from ��ȭ, �⿬
where ���.����ڵ� = �⿬.�⿬�ڵ�
and ����̸� = '������';

-- 8) ��ȭ 'Ű�ٸ�������'�� �帣�� '������', ���������� 15 �� �����϶�
update ��ȭ
set �帣 = '������' and �������� = 15
form ��ȭ
where ��ȭ�̸� = 'Ű�ٸ�������';
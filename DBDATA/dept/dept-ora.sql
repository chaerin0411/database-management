/* �μ�(�μ��ڵ�, �μ���, ��ġ) */

drop table �μ�;

-- �μ� ���̺� ����
CREATE TABLE �μ�(
	�μ��ڵ� CHAR(3) NOT NULL ,
	�μ��� CHAR(9) ,
	��ġ CHAR(6) ,
	PRIMARY KEY(�μ��ڵ�)
);

-- �μ� ������ �Է�
INSERT INTO �μ� VALUES('AA', '�ѹ���', '����');
INSERT INTO �μ� VALUES('BB', '������', '����');
INSERT INTO �μ� VALUES('CC', '��ȹ��', '����');

SELECT * FROM �μ�;
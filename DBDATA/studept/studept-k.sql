/* �а�, �л� ���̺� */
-- (studept-k.sql)

-- �а�(�а���ȣ, �а���)
-- �л�(��ȣ, �̸�, �г�, �й�, �а���ȣ)

drop table �л�;
drop table �а�;

create table �а� (
    �а���ȣ int not null ,
    �а��� varchar(50) ,
    primary key(�а���ȣ)
);

create table �л� (
    ��ȣ int not null ,
    �̸� varchar(12) ,
    �г� int ,
    �й� char(2) ,
    �а���ȣ int ,
    primary key(��ȣ) ,
    foreign key(�а���ȣ) references �а�(�а���ȣ)
);

-- �а�(�а���ȣ, �а���)
insert into �а� values(1, '��ǻ�ͼ���Ʈ������а�');
insert into �а� values(2, '��ǻ���������а�');
insert into �а� values(3, '������Ű�');

-- �л�(��ȣ, �̸�, �г�, �й�, �а���ȣ)
insert into �л� values(1, '������', 1, 'YB', 1);
insert into �л� values(2, '������', 1, 'YA', 1);
insert into �л� values(3, '������', 2, 'J1', 2);
insert into �л� values(4, '�����', 1, 'YB', 1);
insert into �л� values(5, '��öȣ', 2, 'Y1', 2);

commit;

col �а��� format a30

select * from �а�;
select * from �л�;
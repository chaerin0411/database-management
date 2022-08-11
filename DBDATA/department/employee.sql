-- (employee.sql)
/* employee ���̺� */
-- employee(empno, ename, dept, tel, salary)

drop table employee;

CREATE TABLE employee (
    empno char(3) NOT NULL,
    ename varchar(12),
    dept varchar(18),
    tel char(4) ,
    salary int ,
    PRIMARY KEY(empno)
);

-- employee(empno, ename, dept, tel, salary)
-- ������ �Է�
insert into employee values('100','�����','����','1241',200);
insert into employee values('101','ȫ����','��ȹ','5621',200);
insert into employee values('102','�̸���','����','5251',250);
insert into employee values('103','������','����','1231',300);

commit;

-- ������ ��ȸ
select * from employee;
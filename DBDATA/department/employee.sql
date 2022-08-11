-- (employee.sql)
/* employee 테이블 */
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
-- 데이터 입력
insert into employee values('100','김기훈','영업','1241',200);
insert into employee values('101','홍성범','기획','5621',200);
insert into employee values('102','이만수','영업','5251',250);
insert into employee values('103','강나미','생산','1231',300);

commit;

-- 데이터 조회
select * from employee;
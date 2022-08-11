-- dept, dmember 테이블 생성 (dmemberdept-mysql.sql)
use studydb;
drop table if exists dmember;
drop table if exists dept;

-- dept(dept_id, name) 테이블 생성
create table dept (
	dept_id char(3) not null ,
    name varchar(20) ,
    primary key(dept_id)
);

-- dmember(name, dept_id) 테이블 생성
create table dmember (
	name varchar(20) not null ,
    dept_id char(3) ,
    primary key(name) ,
    constraint fk_dmember_dept_id foreign key(dept_id) references dept(dept_id)
);

-- dept(dept_id, name) 데이터 입력
insert into dept values('100', '컴퓨터공학과');
insert into dept values('101', '산업공학과');

-- dmember(name, dept_id) 데이터 생성
insert into dmember values('김광식', '100');
insert into dmember values('전채린', '100');
insert into dmember values('김현정', '101');
insert into dmember values('조영수', '101');

-- dept(dept_id, name) 데이터 조회
select * from dept;

-- dmember(name, dept_id) 데이터 조회
select * from dmember;



use studydb;

drop table if exists emp;

create table emp (
	empno char(4) primary key ,
    empname varchar(10) ,
    manager char(4) ,
    dno char(1) ,
    foreign key (manager) references emp(empno)
);

insert into emp values('3011', '이수민', null, '1');
insert into emp values('3426', '박영권', '3011', '3');
insert into emp values('1003', '조민희', '3011', '1');
insert into emp values('2106', '김창섭', '3426', '2');
insert into emp values('3427', '최종철', '2106', '3');
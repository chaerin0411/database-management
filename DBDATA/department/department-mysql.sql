-- (department-mysql.sql)
use testdb;

-- 학과(학과번호, 학과명)
create table 학과 (
	학과번호 int not null ,
    학과명 varchar(50) ,
    primary key(학과번호)
);

-- 학생(번호, 이름, 학년, 분반, 학과번호)
create table 학생(
	번호 int not null ,
    이름 varchar(12) ,
    학년 int ,
    분반 char(2) ,
    학과번호 int ,
    primary key(번호) ,
    foreign key(학과번호) references 학과(학과번호)
);

-- 학과(학과번호, 학과명)
insert into 학과 values(1, '컴퓨터소프트웨어공학과');
insert into 학과 values(2, '컴퓨터정보공학과');
insert into 학과 values(3, '정보통신과');

-- 학생(번호, 이름, 학번, 분반, 학과번호)
insert into 학생 values(1, '한지혜', 1, 'YB', 1);
insert into 학생 values(2, '이정우', 1, 'YA', 1);
insert into 학생 values(3, '오지영', 2, 'J1', 2);
insert into 학생 values(4, '강재미', 1, 'YB', 1);
insert into 학생 values(5, '박철호', 2, 'J1', 2);

select * from 학과;
select * from 학생;






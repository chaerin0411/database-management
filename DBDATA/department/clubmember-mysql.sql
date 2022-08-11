-- (clubmember-mysql.sql)
-- clubmember(mno, mname, mbirth, mreg_date, mgpa)

select * from clubmember;

-- clubmember(mno, mname, mbirth, mreg_date, mgpa) 테이블 생성
create table clubmember (
	mno int not null ,
    mname varchar(20) not null ,
    mbirth date ,
    mreg_date timestamp default now() ,
    mgpa decimal(3, 1) ,
    primary key(mno)
);

-- clubmember(mno, mname, mbirth, mreg_date, mgpa) 데이터 삽입
insert into clubmember values(121, '홍길동', '19900315', '140320', 4.3);

insert into clubmember values(123, '이정진', null, '140425', null);
insert into clubmember(mno, mname, mreg_date) values(123, '이정진', '140425');

delete
from clubmember
where mno = 123;

insert into clubmember(mno, mbirth, mreg_date, mname, mgpa) values(510, '19841210', '140816', '이정무', 3.8);

insert into clubmember(mno, mname, mbirth, mreg_date) values(210, '김윤식', '1994-05-08', '140912');

insert into clubmember(mno, mname, mbirth) values(325, '홍진아', '1994-12-14');
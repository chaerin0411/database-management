-- (login.sql)

-- 테이블 생성
-- login(l_id, l_pw)
create table login(
	l_id char(9) not null primary key ,
    l_pw varchar(10) not null
);

-- 데이터 입력
-- login(l_id, l_pw)
insert into login values ('admin', '1234');
insert into login values ('guest', 'guest');
insert into login values ('kkk', 'kkk');

-- 데이터 수정
-- login 테이블에서 l_id가 admin인 값의 l_pw를 admin으로 수정하시오.
update login
set    l_pw='admin'
where  l_id='admin';

-- 데이터 삭제
-- login 테이블에서 l_id가 kkk인 레코드를 삭제하시오.
delete
from  login
where l_id='kkk';

-- 데이터 검색
select * from login;
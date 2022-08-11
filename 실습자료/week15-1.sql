drop schema if exists week15;
create schema week15 default character set utf8;
use week15;

drop table if exists 직원;
drop table if exists 동호회;

-- 직원(직원코드, 이름, 부서)
-- 동호회(신청코드, 직원코드, 분야, 활동점수)

create table 직원 (
	직원코드	int not null,
    이름		varchar(3),
    부서		char(2),
    primary key(직원코드)
);

create table 동호회 (
	신청코드	char(6) not null,
	직원코드	int,
	분야		varchar(10),
	활동점수	int,
	primary key(신청코드),
	foreign key(직원코드) references 직원(직원코드)
);
 
insert 직원 values (161353, '장길산', '인사');
insert 직원 values (181323, '성춘향', '영업');
insert 직원 values (151453, '홍길동', '인사');
insert 직원 values (135485, '일지매', '회계');
insert 직원 values (165484, '김선달', '영업');

insert 동호회 values('D-1012', 161353, '등산', 3000);
insert 동호회 values('S-2211', 165484, '수영', 4800);
insert 동호회 values('D-0812', 151453, '등산', 2800);
insert 동호회 values('B-0588', 161353, '배드민턴', 3000);
insert 동호회 values('V-3842', 181323, '바이크', 1800);
insert 동호회 values('G-1802', 165484, '골프', 4800);

select * from 직원;
select * from 동호회;

-- 2 1) 직원 테이블에서 이름을 조회하라
select	이름
from	직원;

-- 2 2) 직원 테이블에서 부서가 인사인 레코드를 검색하라
select	*
from	직원
where	부서='인사';

-- 2 3) 동호회 테이블에서 분야가 등산이고 활동점수가 3000 이상인 레코드를 검색하라
select	*
from	동호회
where	분야='등산';

-- 2 4) 동호회 테이블에서 분야만 검색하되, 같은 분야는 한 번만 검색하라
select	distinct 분야
from	동호회;

-- 2 5) 동호회 테이블에서 직원코드와 분야를 검색하되, 활동점수를 기준으로 오름차순 정렬하라
select	직원코드, 분야
from	동호회
order by 활동점수 ASC;

-- 2 6) 이름, 부서, 분야를 검색하라
select	이름, 부서, 분야
from	직원, 동호회
where	직원.직원코드=동호회.직원코드;

-- 2 7) 동호회에서 이름별 활동 분야 개수를 검색하라
select	이름, count(분야)
from	직원, 동호회
where	직원.직원코드=동호회.직원코드
group by 이름;

-- 2 8) 동호회에서 이름별 활동 분야 개수가 2 개 이상인 것을 검색하라
select	이름, count(분야)
from	직원, 동호회
where	직원.직원코드=동호회.직원코드
group by 이름
having	count(분야)>=2;

-- 2 9) 등산 동호회에서 활동하는 직원이름, 부서를 검색하라 (하위질의)
select	이름 직원이름, 부서
from	직원
where	직원코드 in (
	select	직원코드
    from	동호회
    where	분야='등산'
);

-- 2 10) 동호회에서 분야가 등산인 동호회_등산 뷰를 생성하라 (신청코드 직원이름 분야)
drop view if exists 동호회_등산;

create view 동호회_등산 as
select	신청코드, 이름 as 직원이름, 분야
from	직원, 동호회
where	직원.직원코드=동호회.직원코드 and 분야='등산';

select * from 동호회_등산;

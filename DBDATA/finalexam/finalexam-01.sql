-- (finalexam-01.sql)

-- 직원(직원코드, 이름, 부서)
-- 동호회(신청코드, 직원코드, 분야, 활동점수)

-- 테이블 생성
-- 직원(직원코드, 이름, 부서)
create table 직원 (
	직원코드 char(10) not null ,
    이름 varchar(10) ,
    부서 varchar(10) ,
    primary key (직원코드)
);

-- 동호회(신청코드, 직원코드, 분야, 활동점수)
create table 동호회 (
	신청코드 char(10) not null ,
    직원코드 char(10) ,
    분야 varchar(10) ,
    활동점수 int ,
    primary key (신청코드) ,
    foreign key (직원코드) references 직원(직원코드)
);

-- 데이터 입력
-- 직원(직원코드, 이름, 부서)
insert into 직원 values('161353', '정길산', '인사');
insert into 직원 values('181323', '성춘향', '영업');
insert into 직원 values('151453', '홍길동', '인사');
insert into 직원 values('135485', '일지매', '회계');
insert into 직원 values('165484', '김선달', '영업');

-- 동호회(신청코드, 직원코드, 분야, 활동점수)
insert into 동호회 values('D-1012', '161353', '등산', 3000);
insert into 동호회 values('S-2211', '165484', '수영', 4800);
insert into 동호회 values('D-0812', '151453', '등산', 2800);
insert into 동호회 values('B-0588', '161353', '배드민턴', 3000);
insert into 동호회 values('V-3842', '181323', '바이크', 1800);
insert into 동호회 values('G-1802', '165484', '골프', 4800);

-- 데이터 검색
select * from 직원;
select * from 동호회;

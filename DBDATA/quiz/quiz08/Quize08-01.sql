-- (Quiz08-01.sql]

-- T(C, D)
-- S(B, C)
-- R(A, B)

-- 테이블 삭제
drop table R;
drop table S;
drop table T;

-- 테이블 생성
-- T(C, D)
create table T (
    C int not null ,
    D int ,
    constraint pk_T_C primary key(C)
);

-- S(B, C)
create table S (
    B int not null ,
    C int ,
    constraint pk_S_B primary key(B),
    constraint fk_T_C foreign key(C) references T(C) on delete cascade
);

-- R(A, B)
create table R (
    A int not null ,
    B int ,
    constraint pk_R_A primary key(A) ,
    constraint fk_S_B foreign key(B) references S(B) on delete set null
);

-- 데이터 입력
-- T(C, D)
insert into T values(1, 1);
insert into T values(2, 1);

-- S(B, C)
insert into S values(1, 1);
insert into S values(2, 1);

-- R(A, B)
insert into R values(1, 1);
insert into R values(2, 2);

-- 다음 문법을 수행한 이후에 릴레이션 R에는 어떤 투플들이 있는가?
delete from T;
select * from R;
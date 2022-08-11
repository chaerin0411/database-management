-- dept, dmember 테이블 생성 (dmemberdept-mysql.sql)
use hw04db;

DROP TABLE if exists dept;
DROP TABLE if exists dmember;

CREATE TABLE dept (
	dept_id char(3) NOT NULL, 
    name varchar(20), 
    PRIMARY KEY(dept_id)
);

CREATE TABLE dmember (
    name varchar(10) NOT NULL, 
    dept_id char(3), 
    PRIMARY KEY(name), 
    CONSTRAINT fk_dmember_dept_id FOREIGN KEY(dept_id) REFERENCES dept(dept_id)
);

INSERT INTO dept VALUES('100', '컴퓨터공학과');
INSERT INTO dept VALUES('101', '산업공학과');

INSERT INTO dmember VALUES('김광식', '100');
INSERT INTO dmember VALUES('김현정', '101');
INSERT INTO dmember VALUES('조영수', '101');
INSERT INTO dmember VALUES('엄지희', '100');
-- 본인 이름으로 레코드 1개 입력 추가하여 제출

select * from dept;
select * from dmember;
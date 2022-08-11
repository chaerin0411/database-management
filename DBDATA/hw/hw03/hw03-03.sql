-- (hw03-03.sql)

-- 3번
/* 예제3 릴레이션 gmember, group_ex */
-- gmember(id, groupid)
-- group_ex(groupid, position)

drop table if exists gmember;
drop table if exists group_ex;

-- 테이블 생성
-- gmember(id, groupid)
CREATE TABLE gmember ( 
   id        CHAR(3)     NOT NULL ,
   groupid CHAR(1)
);

-- group_ex(groupid, position)
CREATE TABLE group_ex ( 
   groupid   CHAR(1)   NOT NULL ,
   position   VARCHAR(12)
);

-- 데이터 입력
-- gmember(id, groupid)
INSERT INTO gmember VALUES('100', 'A');
INSERT INTO gmember VALUES('101', 'B');
INSERT INTO gmember VALUES('102', 'A');
INSERT INTO gmember VALUES('102', 'F');

-- group_ex(groupid, position)
INSERT INTO group_ex VALUES('A', '서울');
INSERT INTO group_ex VALUES('B', '대구');
INSERT INTO group_ex VALUES('C', '광주');
INSERT INTO group_ex VALUES('D', '부산');
INSERT INTO group_ex VALUES('E', '대전');

-- 데이터 조회
SELECT * FROM gmember;
SELECT * FROM group_ex;

-- 03
-- gmember(id, groupid)
-- group_ex(groupid, position)

-- 1)
SELECT DISTINCT groupid
FROM gmember
WHERE id >= '100';

-- 2) 동등조인
SELECT *
FROM gmember, group_ex
WHERE gmember.groupid = group_ex.groupid;

SELECT *
FROM gmember INNER JOIN group_ex
ON gmember.groupid = group_ex.groupid;

-- 3) 자연조인
SELECT id, gmember.groupid, position 
FROM gmember, group_ex
WHERE gmember.groupid = group_ex.groupid;

SELECT id, gmember.groupid, position 
FROM gmember INNER JOIN group_ex
ON gmember.groupid = group_ex.groupid;

-- 4) 왼쪽외부조인
SELECT *
FROM gmember LEFT OUTER JOIN group_ex
ON gmember.groupid = group_ex.groupid;

-- 5) 오른쪽외부조인
SELECT *
FROM gmember RIGHT OUTER JOIN group_ex
ON gmember.groupid = group_ex.groupid;

-- 6) 완전외부조인
SELECT *
FROM gmember FULL OUTER JOIN group_ex
ON gmember.groupid = group_ex.groupid;
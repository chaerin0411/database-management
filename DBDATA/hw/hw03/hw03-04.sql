-- (hw03-04.sql)

-- 4번
/* 예제4 릴레이션 R2, S2 */
/* [Quiz 4] */
-- R2(A, B, C)
-- S2(B, D)

drop table if exists R2;
drop table if exists S2;

-- 테이블 생성
-- R2(A, B, C)
CREATE TABLE R2 (
	A char(2),
	B char(2),
	C char(2)
);

-- 데이터 입력
-- R2(A, B, C)
INSERT INTO R2 VALUES ('a1','b1','c7');
INSERT INTO R2 VALUES ('a2','b1','c5');
INSERT INTO R2 VALUES ('a3','b4','c3');

-- 테이블 생성
-- S2(B, D)
CREATE TABLE S2 (
	B char(2),
	D char(2)
);

-- 데이터 입력
-- S2(B, D)
INSERT INTO S2 VALUES ('b1','d1');
INSERT INTO S2 VALUES ('b5','d2');

-- 데이터 조회
select * from R2;
select * from S2;

-- 04
-- R2(A, B, C)
-- S2(B, D)

-- 1) 동등조인(equi join)
SELECT *
FROM R2, S2
WHERE R2.B = S2.B;

SELECT *
FROM R2 INNER JOIN S2
ON R2.B = S2.B;

-- 2) 자연조인(natural join)
SELECT A, R2.B, C, D
FROM R2, S2
WHERE R2.B = S2.B;

SELECT A, R2.B, C, D
FROM R2 INNER JOIN S2
ON R2.B = S2.B;


-- 3) 왼쪽외부조인(left outer join)
SELECT *
FROM R2 LEFT OUTER JOIN S2
ON R2.B = S2.B;

-- 5) 오른쪽외부조인(right outer join)
SELECT *
FROM R2 RIGHT OUTER JOIN S2
ON R2.B = S2.B;

-- 6) 완전외부조인(full outer join)
SELECT *
FROM R2 FULL OUTER JOIN S2
ON R2.B = S2.B;
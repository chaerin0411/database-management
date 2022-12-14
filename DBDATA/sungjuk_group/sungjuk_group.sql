-- (sungjuk_group.sql)
-- [실습2] 집계함수, Group by : (sungjuk_group.sql)
-- 성적(이름, 점수)
-- 성적2(이름, 과목, 점수)

/* SELECT 문법 순서
SELECT
FROM
WHERE
GROUP BY
HAVING
ORDER BY */

-- 집단함수
CREATE TABLE 성적 (
	이름 varchar(9) NOT NULL primary key ,
    점수 int
);

INSERT INTO 성적 (이름, 점수) VALUES ('홍길동', 87);
INSERT INTO 성적 (이름, 점수) VALUES ('임꺽정', 60);
INSERT INTO 성적 (이름, 점수) VALUES ('박찬호', 75);
INSERT INTO 성적 (이름, 점수) VALUES ('선동열', 70);
INSERT INTO 성적 (이름, 점수) VALUES ('홍명보', 90);
INSERT INTO 성적 (이름, 점수) VALUES ('차범근', 75);
INSERT INTO 성적 (이름, 점수) VALUES ('강성범', 68);
INSERT INTO 성적 (이름, 점수) VALUES ('신동엽', NULL);

-- 그룹화
-- GROUP BY, HAVING
CREATE TABLE 성적2 (
	이름 varchar(9) NOT NULL primary key ,
    과목 varchar(8) ,
    점수 int
);

INSERT INTO 성적2 VALUES ('홍길동', '영어', 87);
INSERT INTO 성적2 VALUES ('임꺽정', '수학', 60);
INSERT INTO 성적2 VALUES ('박찬호', '국어', 75);
INSERT INTO 성적2 VALUES ('선동열', '영어', 70);
INSERT INTO 성적2 VALUES ('홍명보', '수학', 90);
INSERT INTO 성적2 VALUES ('차범근', '수학', 75);
INSERT INTO 성적2 VALUES ('강성범', '수학', 68);
INSERT INTO 성적2 VALUES ('신동엽', '영어', NULL);

select * from 성적;
select * from 성적2;
use week15;

CREATE TABLE 부서(
부서번호 int PRIMARY KEY,
부서명   char(15),
위치     char(15)
);

CREATE TABLE 사원(
사원    int PRIMARY KEY,
이름    char(10) NOT NULL ,
연령    int, 
급여    decimal(7,2) NOT NULL,
부서번호 int REFERENCES 부서(부서번호)
);

INSERT INTO 부서 VALUES(1, 'ACCOUNTING', 'SEOUL');
INSERT INTO 사원 VALUES(10, 'Jain', 20, 1000, 1);
INSERT INTO 사원 VALUES(20, 'Tom', 21, 2000, 1);

select * from 부서;
select * from 사원;

SELECT 이름, MAX(급여)
FROM   사원, 부서
WHERE  연령< 40 AND 사원.부서번호= 부서.부서번호
GROUP BY 부서명;

-- SELECT 부서명, 이름, MAX(급여)
-- FROM   사원, 부서
-- WHERE  연령< 40 AND 사원.부서번호= 부서.부서번호
-- GROUP BY 부서명;

INSERT INTO 사원(사원, 이름, 급여, 부서번호) VALUES(30, 'Smith', 3000, 1);

SELECT 부서명
FROM   부서
WHERE  부서번호 = ANY ( SELECT	부서번호
					  FROM		사원
					  WHERE	급여 >=  (SELECT  MIN(급여)  FROM 사원));
                      
SELECT 부서명
FROM   부서
WHERE  부서번호 = ANY ( SELECT	부서번호
					  FROM		사원
					  WHERE	급여 >=  (SELECT  MIN(급여)  FROM 사원));

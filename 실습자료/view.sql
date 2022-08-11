use handb;

-- 예제 7-58 제품번호가 p08, 재고량이 1000, 
-- 제조업체가 신선식품인 새로운 제품의 정보를
-- 제품1 뷰에 삽입해보자.
-- 제품1 뷰에 있는 모든 내용을 검색해보자

select * from 제품;
select * from 제품1;

CREATE VIEW 제품1
as
	SELECT		제품번호, 재고량, 제조업체
    FROM		제품;

-- 제품1
INSERT INTO 제품1 (제품번호, 재고량, 제조업체)
VALUES ('p08',1000,'신선식품');

-- 뷰 삭제
DROP VIEW 제품1;
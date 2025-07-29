/*
	=== select(선택하다, 조회하다) ===
    : DB는 '어떻게'보다 '무엇을' 가지고 오는 지가 중요
    >> '무엇을' 선택할 것인지 결정하는 키워드 - select
    
    ## select 문의 기본 구조('작성 순서') ##
    1. select 컬럼명(열 목록): 원하는 컬럼(열) 지정
    2. from 테이블명: 어떤 테이블에서 데이터를 가져올 지 결정
    --- [선택적 구조] ---
    3. where 조건식: 특정 조건에 맞는 데이터만 선택(필터링)
    4. group by 그룹화할 컬럼명: 특정 열을 기준으로 그룹화
    5. having 그룹조건: 그룹화 된 데이터에 대한 조건 지정
    6. order by 정렬 컬럼명: 결과를 특정 컬럼의 순서로 정렬
    7. limit 컬럼 수 제한: 반환할 행(레코드)의 수를 제한
    
    cf) DB 내부 실제 실행 순서
    FROM 테이블 > JOIN(추가 테이블 데이터 가져오기) > WHERE(필터링)
    > group by(그룹화) > having(조건) > select(컬럼 추출) > order by(정렬) > limit(제한)
*/

USE korea_db;

## 1. 기본 조회 ##
# : select 컬럼명 from `데이터베이스명`.`테이블명`;
select `name` from `korea_db`.`members`;
# > 정렬하지 않고 조회 시 데이터 입력 순서대로 출력

# cf) 전체 컬럼 조회(전체 테이블 조회)
# 컬럼명 작성에 *(전체)를 사용하여 조회
select * from `korea_db`.`members`; -- 회원 테이블
select * from `korea_db`.`purchases`; -- 구매 목록 테이블

# cf) 두 개 이상의 컬럼 조회 시 ,(콤마)로 구분하여 나열
select
	`member_id`, `name`, `contact`
from
	`members`;

# cf) alias 별칭 부여 조회 (as 키워드)
# : 별칭을 부여하지 않을 경우 테이블 생성 시 지정한 컬럼명으로 조회
# - 컬럼명이 변경X, 조회 당시에 사용
# - 공백 사용 시 따옴표로 반드시 지정
select
	`member_id` as 고유번호, `name` as '회원 이름', `contact` as '회원 연락처'
from
	`members`;




























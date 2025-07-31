### 인덱스 ###
# : select 문으로 데이터 조회 시, 원하는 데이터를 더 빠르게 찾아주는 도구
# - 데이터 검색 속도 향상 >> 전체 시스템 성능을 높임

# EX) 책에서 원하는 단어를 찾을 때 사용하는 '찾아보기(색인)'

# 1. 인덱스 종류
# 1) 클러스터형 인덱스
# : 기본키(PK) 설정 시 자동 생성
# - 테이블 당 단 하나만 생성 가능
# - 자동 정렬 기능 포함: 지정된 열(기본키 컬럼)을 기준으로 자동 정렬
SELECT * FROM `A`;
# >> 위릐 쿼리문처럼 order by(정렬)문이 없으면 클러스터형 인덱스를 기준으로 정렬

# EX) 영어사전, 국어사전: 내용이 미리 정렬

# 2) 보조 인덱스
# : 고유키(unique key) 설정 시 자동 생성
# - 테이블 당 여러 개 생성 가능
# - 자동 정렬 기능 포함 X
# EX) 일반 서적: 색인(찾아보기) 등의 페이지 번호를 보고 해당 위치로 이동해야 내용 확인 가능

## 인덱스 사용 예시 ##
create database if not exists idx_db;
use idx_db;

create table table1 (
	col1 int primary key,
    col2 int, 
    col3 int
);

# 인덱스 정보 확인: show index from 테이블명;
show index from table1;

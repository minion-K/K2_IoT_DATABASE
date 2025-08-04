### SQL 종류 ###
# 1. DDL(Data Definition Language): 데이터 정의 언어(데이터베이스, 데이터베이스 개체 정의)
#		- CREATE, ALTER, DROP, TRUNCATE
# 2. DML(Data Manipulation Language): 데이터 조작 언어(데이터 CRUD)
#		- INSERT, SELECT, UPDATE, DELETE
# 3. DCL(Data Control Language): 데이터 통제 언어
#		- GRANT(승인하다), REVOKE(취소하다)

### DCL(Data Control Language) ###
# : 데이터베이스 사용자 권한을 제어하는 SQL 명령어
# - 보안과 접근 제어를 위한 역할 수행

# 1. GRANT
# : 특정 사용자에게 권한을 부여

# 2. REVOKE
# : 특정 사용자에게 부여된 권한을 회수

### DCL 사용 목적
# 1. 보안 강화: 민감한 데이터에 접근 가능한 사용자 제한
# 2. 데이터 무결성 유지: 특정 사용자만 데이터를 수정할 수 있도록 제한
# 3. 역할 기반 접근 제어: 사용자의 역할에 따라 필요한 권한만 부여 가능

use `korea_db`;
select * from `members`;
select * from `purchases`;

# 1) 사용자 계정 생성
# : CREATE USER 명령어 사용
CREATE USER 'readonly_user'@'localhost'IDENTIFIED BY '1234';

# '계정명'@'접속범위설정' IDENTIFIED BY '사용자_로그인_비밀번호_설정'

# cf) 접속 범위 설정
# - localhost: 현 시스템 컴퓨터 (MySQL 서버가 설치된 해당 컴퓨터에서만 로그인 가능)
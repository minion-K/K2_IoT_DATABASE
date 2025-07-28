# === 데이터베이스 ===
# 1. 생성(CREATE)
CREATE DATABASE database_name;
DROP DATABASE database_name;
# > 위의 두 실행문은 각각 여러 번 실행할 경우 Error 발생

# cf) if [not] exist 옵션
# : 데이터베이스의 유무를 확인하고 오류를 방지하는 SQL문
#		, 존재할 때 또는 존재하지 않을 때 실행

CREATE DATABASE	IF NOT EXISTS database_name; # 존재하지 않을 때 > 생성
DROP DATABASE IF EXISTS	database_name; # 존재할 때 > 삭제

# 2. 선택(USE)
# : DB 선택 시 이후 모든 SQL 명령어가 선택된 DB 내에서 실행
# - GUI로 Navigator > Schemas > 스키마명 더블 클릭과 동일
USE database_name;

CREATE DATABASE IF NOT EXISTS example;
USE example;

# 3. 삭제(DROP)
# : 데이터베이스 삭제, 해당 작업은 실행 후 되돌릴 수 없음!
DROP DATABASE database_name;

# 4. 데이터베이스 목록 조회(SHOW)
# : 해당 SQL 서버에 존재하는 모든 DB(스키마) 목록을 확인
SHOW DATABASES;

# === 테이블 ===
# 1. 생성(CREATE)
USE example;

CREATE TABLE student (
	# 테이블 생성 시 DB명 필수 X
    # > USE 명령을 통해 DB에 접속한 경우 생략 가능
    # > 오류 방지를 위해 작성 권장
    student_id int primary key,
    name varchar(100) not null,
    age int not null, 
    major varchar(100)
);










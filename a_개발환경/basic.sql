-- MySQL Workbench 환경 설정 (basic.sql)

-- === 1. 주석 ===
-- 1) 단축키 ctrl + /

-- 2) 한 줄 주석: -- or # 

# 안녕하세요 주석입니다.
-- 이것도 주석

-- 3) 여러 줄 주석: /**/

/*
	줄 수에 관계 없이
    주석 처리 가능
*/

-- 해당 쿼리는 모든 데이터베이스를 보여줌
SHOW DATABASES;

/*
	해당 쿼리는
    모든 데이터베이스를
    보여줌
*/
SHOW DATABASES;

-- === 2. 글자 크기 변경 ===
-- 1) ctrl + 마우스 휠 조정

-- 2) Edit > Preferences > Fonts & Colors
-- 		Font명 글자크기 (D2Coding Bold 16)

-- === 3. 명령어 대소문자 설정 ===
-- : 문법의 대소문자 구분 X
-- >> 일관성 있는 작성을 권장!
-- 1) 명령어(문법)는 대문자
-- 테이블 & 컬럼명은 소문자

show databases; -- MySQL Workbench는 소문자 자동완성이 기본
SHOW DATABASES;

-- 대문자 변환 단축기: ctrl + shift + u
-- Edit > format > UPCASE(대문자) / lowercase(소문자) keywords

-- === 4. 단축키 ===
# 파일저장: ctrl + s
# 한 줄 복사: ctrl + d
# 한 줄 삭제: ctrl + l
# 새로운 SQL 탭 생성: ctrl + t
# 실행 단축키
# ctrl + enter
#	: 커서가 위치한 쿼리문 하나만 실행
#	> 세미콜론(;) 기준으로 분리된 문장 중, 커서가 있는 한 문장만 실행
# ctrl + shift + enter
#	: 마우스로 드래그해서 선택한 쿼리 영역만 실행
#	> 여러 줄을 드래그해서 한번에 실행할 때 사용
#	> ctrl + a (전체 선택) 후 주로 사용

-- === 5. 다크모드 (선택) ===
# Edit > Prefrences > Fonts & Colors > Color Schemas (Windows 8 선택)
# workbench dark theme github 검색 > code_editor.xml 다운로드
# 파일탐색기 > 로컬C > Program Files > MySQL Workbench 8.0 > data > code_editor.xml 파일 다운로드 받은 파일로 교체

# cf) 기존 'code_editor.xml' 파일 백업
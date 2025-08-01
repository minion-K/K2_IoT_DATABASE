### 무결성(Integrity, 온전함) ###
# : 결함이 없는 상태 (데이터의 결함이 없음)
# - 정확성, 일관성, 신뢰성을 보장하는 개념

### 제약 조건(Constraints) ###
# : 데이터의 '무결성'을 지키기 위한 옵션
# - 데이터가 유효하고 신뢰할 수 있도록 필수 조건을 부여

# 1) 개체 무결성
#	: 모든 테이블이 고유한 행을 가짐
#	- 기본 키(Primary key)를 통해 구현
#		> Null 불가(비워질 수 없음), 고유성(중복 불가)
#	EX) 학번, 아이디, 주민등록번호, 제품코드, 주문번호, ISBN 등

# 2) 참조 무결성
#	: 데이터 간의 관계를 정의할 때
#		, 한 테이블이 다른 테이블의 값을 '참조'하는 경우 
#		, 참조 값이 반드시 존재해야 함을 뜻함
#	- 외래 키(Foriegn key)를 통해 구현
#	EX) 학생 - 수강, 고객 - 주문, 게시글 - 댓글 ('해당 데이터에서' - '값을 참조')

# 3) 도메인 무결성
#	: 테이블의 각 필드(열, 컬럼)가 정의된 도메인에 맞는 값을 가져야 함을 뜻함
#	- 데이터타입, 포맷, 범위 등이 적절하게 유지
#	- 데이터 타입 지정, unsigned, 제약 조건(CHECK) 등을 통해 구현
#	EX) 은행 계좌에 입금되는 금액 - 양의 정수만 허용(unsigned)
#		점수에 입력되는 숫자 - 0에서 100사이의 정수(CHECK)

# cf) 도메인(domain)
#	: '데이터타입, 길이, 가능한 값의 범위'로 구성

# 4) 사용자 정의 무결성
#	: 특정 애플리케이션의 규칙에 따라 정의
#	- 구현하고자 하는 비즈니스 규칙에 따라 애플리케이션의 특정 요구사항을 반영
#	EX) 비밀번호 설정 (6 ~ 10자 이내, 영문자 + 숫자 + 특수기호 조합)
#		연령 제한(성인만 가입 가능 & 학생만 가입 가능)
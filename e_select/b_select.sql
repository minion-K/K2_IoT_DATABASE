# select A from B where C;

/*
	select A
    from B
    where C
    group by D
    having E
    order by F
    limit G
*/

/*
	4. group by
    : 그룹으로 묶어주는 역할
    - 여러 행을 그룹화하여 집계함수를 적용해 데이터 단일화에 주로 사용
    
    cf) 집계 함수: 그룹화된 데이터에 대한 계산
		- max(), min(), avg(), sum() 등
        - count(): 행의 수를 반환
        - count(distinct): 행의 수를 반환(+ 중복은 1개만 인정(중복 제거))
*/
-- select * from `members`
-- group by grade;
# Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column 'korea_db.members.member_id'
# which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by
# > 등급별로 데이터를 그룹화 할 때 결합되지 않는 데이터까지 조회하는 경우 오류가 발생

# cf) 집계함수는 그룹화된 영역 내에서 각각 계산
# 1) 등급별 회원 수 계산
select grade, count(*) from `members`
group by 
	grade;

# 2) 지역별 평균 포인트 계산
select
	area_code, avg(points) -- 평균값은 실수 반환
from
	`members`
group by 
	area_code;
    
/*
	5. having
    : group by와 함께 사용, '그룹화 된 결과'에 대한 조건 지정
    - where 조건과 식은 유사하지만 '그룹화 된 데이터'에 대한 조건 지정
*/

# 총 인원이 2명 이상인 등급 조회
select grade, count(*) from `members`
group by 
	grade
having
	count(*) > 2;
    
# 지역 평균 포인트가 200이 넘는 지역 조회
select
	area_code, avg(points) -- 평균값은 실수 반환
from
	`members`
group by 
	area_code
having
	avg(points) > 200;

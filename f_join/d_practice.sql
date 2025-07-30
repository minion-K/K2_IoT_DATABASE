## baseball_league 사용 예제 (JOIN) ##
USE baseball_league;

select * from `players`; -- palyer_id, name(선수 이름), position, birth_date, team_id(FK)
select * from `teams`; -- team_id(PK), name(팀 이름), city, founded_year

# 1. 내부 조인
# 1) 타자인 선수와 해당 선수가 속한 팀 이름 가져오기
# - players 테이블 (선수 이름)
# - teams 테이블 (팀 이름) 
select P.name, T.name, P.position
from `players` P
	join `teams` T
    on P.team_id = T.team_id
where P.position = '타자';

# 2) 1990년 이후 창단된 팀의 선수 목록 가져오기
select T.name, P.name
from `teams` T 
	join `players` P
    on T.team_id = P.team_id
where T.founded_year >= '1990';

# 2. 외부 조인
# 1) 모든 팀과 그 팀에 속한 선수 목록 가져오기
select T.name team_name, P.name player_name
from `teams` T
	left join `players` P
    on T.team_id = P.team_id;
# 모든 팀과 해당 팀에 속한 타자 목록 가져오기
select T.name team_name, P.name player_name
from `teams` T
	left join `players` P
    on T.team_id = P.team_id
where P.position = '타자';

# 2) 모든 선수와 해당 선수가 속한 팀 이름 가져오기
select P.name player_name, T.name Team_name
from `players` P
	left join `teams` T
    on P.team_id = T.team_id;
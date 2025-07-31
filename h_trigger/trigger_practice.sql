use baseball_league;
select * from `players`;

### h_트리거 >>> trigger_practice ###
/*
	===== 문제1 =====
	선수(players)가 삭제될 때, 
	해당 선수의 이름과 삭제 시각을 player_delete_logs 테이블에 기록하는 트리거를 생성
    
	>> 로그 테이블이 없으면 먼저 생성하고, 트리거명: after_player_delete

	===== 문제2 ===== 
	선수(players)의 포지션(position)이 변경될 경우
		, 이전 포지션과 변경된 포지션, 선수 이름을 player_position_logs에 기록하는 트리거를 생성
	
    >> 로그 테이블이 없으면 먼저 생성하고,트리거명: after_player_position_update

	===== 문제3 ===== 
		선수가 추가되거나 삭제될 때마다 해당 팀의 선수 수(player_count)를 자동으로 업데이트하는 트리거 2개	
		(after_player_insert_count, after_player_delete_count)
		
		>> ※ teams 테이블에 player_count 컬럼이 이미 존재한다고 가정함
		
		ALTER TABLE teams ADD COLUMN player_count INT DEFAULT 0;
*/
# 문제1
create table if not exists player_delete_logs (
	delete_name varchar(50),
    delete_time datetime
);

delimiter $$

create trigger after_player_delete
	after delete
    on players
    for each row
begin
	insert into player_delete_logs
    values(OLD.name, now());
end $$

delimiter ;
drop table player_delete_logs;
drop trigger after_player_delete;

delete from `players`
where player_id = '105';

select * from player_delete_logs;
select * from players;



# 문제 2)
create table if not exists player_position_logs (
	old_position varchar(50),
    position varchar(50),
    name varchar(50)
);
select * from player_position_logs;
delimiter $$

create trigger after_player_position_update
	after update
    on players
    for each row
begin
	insert into player_position_logs
    values(OLD.position, NEW.position, OLD.name);
end $$

INSERT INTO `players`
VALUES
	(201, '테스트 선수1', '타자', '1999-03-03', 2);
    
UPDATE players SET position = '외야수' WHERE player_id = 201;

select * from player_position_logs;
select * from players;

# 문제3)

alter table teams add player_count int default 0;

select * from teams

-- 선수 추가
delimiter $$

create trigger after_player_insert_count
	after insert
    on players
    for each row
begin
	update teams
    set player_count = player_count + 1
    where team_id = NEW.team_id;
end $$

delimiter ;

-- 선수 삭제
delimiter $$

create trigger after_player_delete_count
	after delete
    on players
    for each row
begin
	update teams
    set player_count = player_count - 1
	where team_id = OLD.team_id;
end $$

delimiter ;

SELECT team_id, player_count FROM teams;

INSERT INTO players (player_id, name, position, birth_date, team_id)
VALUES (404, '테스트선수3', '투수', '1994-07-07', 1);

DELETE FROM players WHERE player_id = 404;

select * from teams;
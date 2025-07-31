use baseball_league;
select * from `players`;
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

select * from player_position_logs;
select * from players;

-- teams 테이블에 player_count 컬럼 추가 
ALTER TABLE teams ADD COLUMN player_count INT DEFAULT 0;

-- 선수 추가 시 팀의 선수 수 증가 트리거
DROP TRIGGER IF EXISTS after_player_insert_count;

DELIMITER $$
CREATE TRIGGER after_player_insert_count
AFTER INSERT ON players
FOR EACH ROW
BEGIN
	UPDATE teams
	SET player_count = player_count + 1
	WHERE team_id = NEW.team_id;
END $$
DELIMITER ;

-- 선수 삭제 시 팀의 선수 수 감소 트리거
DROP TRIGGER IF EXISTS after_player_delete_count;

DELIMITER $$
CREATE TRIGGER after_player_delete_count
AFTER DELETE ON players
FOR EACH ROW
BEGIN
	UPDATE teams
	SET player_count = player_count - 1
	WHERE team_id = OLD.team_id;
END $$
DELIMITER ;

SELECT team_id, player_count FROM teams;

INSERT INTO players (player_id, name, position, birth_date, team_id)
VALUES (303, '테스트선수3', '투수', '1994-07-07', 1);

-- 선수 삭제
DELETE FROM players WHERE player_id = 303;
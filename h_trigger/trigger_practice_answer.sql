### h_트리거 >>> trigger_practice_answer ###

##### 문제 1 #####
-- 기존 트리거 삭제
drop trigger if exists after_player_delete;

-- 트리거 생성
delimiter $$
create trigger after_player_delete
	after delete
    on players
    for each row
begin
	insert into player_delete_logs (player_name, deleted_time)
    values (OLD.name, now());
end $$
delimiter ;

##### 문제 2 #####
-- 기존 트리거 삭제
drop trigger if exists after_player_position_update;

-- 트리거 생성
delimiter $$
create trigger after_player_position_update
	after update
    on players
    for each row
begin
	if OLD.position != NEW.position then
		insert into player_position_logs (player_name, old_position, new_position, changed_time)
        values (NEW.name, OLD.position, NEW.position, now());
	end if;
end $$
delimiter ;

##### 문제 3 #####

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


# ====================================================== #
SELECT * FROM `players`;
SELECT * FROM `teams`;

# ✔문제 1 테스트: 선수 삭제 시 로그 기록 확인
-- 테스트용 선수 추가
INSERT INTO `players`
VALUES
	(201, '테스트 선수1', '타자', '1999-03-03', 2);

-- 삭제 전 로그 확인
SELECT * FROM player_delete_logs;

-- 테스트용 선수 삭제
DELETE FROM players WHERE player_id = 201;

-- 삭제 후 로그 확인
SELECT * FROM player_delete_logs;

-- ✔ 문제 2 테스트: 포지션 변경 시 로그 기록 확인
-- 테스트용 선수 추가
INSERT INTO `players`
VALUES
	(201, '테스트 선수1', '타자', '1999-03-03', 2);
    
-- 포지션 변경 전 로그 확인
SELECT * FROM player_position_logs;

-- 포지션 변경
UPDATE players SET position = '외야수' WHERE player_id = 201;

-- 포지션 변경 후 로그 확인
SELECT * FROM player_position_logs;
    
-- ✔ 문제 3 테스트: 선수 추가/삭제 시 teams.player_count 자동 업데이트 확인
-- 테스트 전 player_count 초기 상태 확인
SELECT team_id, player_count FROM teams;

-- 선수 추가
INSERT INTO players (player_id, name, position, birth_date, team_id)
VALUES (303, '테스트선수3', '투수', '1994-07-07', 1);

-- 추가 후 player_count 확인
SELECT team_id, player_count FROM teams WHERE team_id = 1;

-- 선수 삭제
DELETE FROM players WHERE player_id = 303;

-- 삭제 후 player_count 확인
SELECT team_id, player_count FROM teams WHERE team_id = 1;
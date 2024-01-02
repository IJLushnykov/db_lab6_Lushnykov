-- Процедура для виведення ігор, оцінка критика яких вища за задану

DROP PROCEDURE IF EXISTS get_game_with_score(Integer);

CREATE OR REPLACE PROCEDURE get_game_with_score(min_score Integer)
LANGUAGE plpgsql
AS $$

DECLARE record_name video_game.name%TYPE;
DECLARE record_mark video_game.critic_score%TYPE;

BEGIN
	SELECT name, critic_score into record_name, record_mark
		FROM video_game WHERE critic_score > min_score;
	RAISE INFO 'Game_name: %, game_score: %',
	TRIM(record_name), record_mark;
END;
$$;

CALL get_game_with_score(90);
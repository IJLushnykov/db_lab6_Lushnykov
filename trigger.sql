-- Створення таблиці game_log для логування змін у таблиці video_game.
-- Створення функції та тригера для автоматичного логування записів у video_game_log при модифікації запису про гру.

DROP TABLE IF EXISTS video_game_log;
CREATE TABLE video_game_log (
    log_num SERIAL PRIMARY KEY,
    game_id integer,
	user_name varchar(50));


CREATE OR REPLACE FUNCTION log_video_game()
RETURNS TRIGGER
LANGUAGE 'plpgsql'
AS $$
BEGIN
    
    INSERT INTO video_game_log (game_id, user_name)
    VALUES (NEW.Indexx, user);

    RETURN NEW;
END;
$$;


CREATE TRIGGER log_video_game
AFTER UPDATE ON video_game
FOR EACH ROW
EXECUTE FUNCTION log_video_game();

UPDATE video_game SET name=1 WHERE indexx = 0;

SELECT * FROM video_game_log;
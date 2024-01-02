-- Функція для виведення ігор, що молодше заданого віку

DROP FUNCTION IF EXISTS get_games_with_year(Integer);

CREATE OR REPLACE FUNCTION get_games_with_year(max_age integer)
	RETURNS TABLE (full_name Varchar, born_date Integer)
LANGUAGE plpgsql
AS $$

BEGIN
	RETURN QUERY
		SELECT Name::Varchar, Year_of_release::Integer
		FROM Video_game WHERE (EXTRACT('Year' FROM CURRENT_DATE) - Year_of_release) < max_age;

END;
$$;

SELECT * FROM get_games_with_year(15);
USE switch_games;

CREATE OR REPLACE VIEW sorted_metacritic AS
SELECT game_name, metacritic_score
FROM games
JOIN ratings USING(game_id)
WHERE metacritic_score IS NOT NULL
ORDER BY metacritic_score DESC;

CREATE OR REPLACE VIEW counted_series AS
SELECT series_name, COUNT(series_id) AS total_games
FROM game_classifications
JOIN series USING(series_id)
GROUP BY series_id
ORDER BY total_games DESC;

CREATE OR REPLACE VIEW games_developed AS
SELECT COUNT(game_id) AS games_developed, developer
FROM games
GROUP BY developer
ORDER BY games_developed DESC;

CREATE OR REPLACE VIEW sp_games AS
SELECT game_id, game_name, date_released, mode_type
FROM modes
JOIN game_classifications USING(modes_id)
JOIN games USING(game_id)
WHERE modes_id = 1
ORDER BY date_released DESC;

CREATE OR REPLACE VIEW rated_t_scores AS
SELECT game_id, game_name, esrb_rating, metacritic_score, user_score
FROM ratings
JOIN games USING(game_id)
WHERE game_id IN (
SELECT game_id
FROM ratings
WHERE esrb_rating = 'T')
ORDER BY game_id ASC;

CREATE OR REPLACE VIEW general_info AS
SELECT game_name, developer, genre_name, mode_type
FROM games
JOIN game_classifications USING(game_id)
JOIN genre USING(genre_id)
JOIN modes USING(modes_id)
ORDER BY game_id ASC;

CREATE OR REPLACE VIEW sold_by_ratings AS
SELECT game_name, units_sold, metacritic_score
FROM games
JOIN units_sold USING(game_id)
JOIN ratings USING(game_id)
WHERE units_sold IS NOT NULL
ORDER BY units_sold DESC;

/* Opens the views that were created */
SELECT * FROM sorted_metacritic;
SELECT * FROM counted_series;
SELECT * FROM games_developed;
SELECT * FROM sp_games;
SELECT * FROM rated_t_scores;
SELECT * FROM general_info;
SELECT * FROM sold_by_ratings;

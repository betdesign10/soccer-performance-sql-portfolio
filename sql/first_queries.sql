-- Start with the roster.
SELECT player_name, position, jersey_number
FROM players
ORDER BY jersey_number;

-- QUESTION 2: Which players are midfielders?
-- WHERE filters the results.
SELECT player_name, jersey_number
FROM players
WHERE position = 'Midfielder'
ORDER BY player_name;

-- QUESTION 3: What happened in each match?
-- CASE turns the score into an easy-to-read result.
SELECT
    match_date,
    opponent,
    team_goals,
    opponent_goals,
    CASE
        WHEN team_goals > opponent_goals THEN 'Win'
        WHEN team_goals = opponent_goals THEN 'Draw'
        ELSE 'Loss'
    END AS result
FROM matches
ORDER BY match_date;

-- QUESTION 4: How many goals did the team score per match?
-- AVG calculates the average and ROUND makes it easier to read.
SELECT
    COUNT(*) AS matches_played,
    SUM(team_goals) AS total_goals,
    ROUND(AVG(team_goals), 1) AS average_goals_per_match
FROM matches;

-- QUESTION 5: Who scored in the first match?
-- JOIN connects a player's name to that player's match statistics.
SELECT
    p.player_name,
    p.position,
    s.goals,
    s.shots
FROM player_match_stats AS s
JOIN players AS p ON p.player_id = s.player_id
WHERE s.match_id = 1 AND s.goals > 0
ORDER BY s.goals DESC, p.player_name;

-- First question: what is each position group contributing?
SELECT
    p.position,
    COUNT(DISTINCT p.player_id) AS number_of_players,
    SUM(s.goals) AS total_goals,
    SUM(s.assists) AS total_assists,
    SUM(s.minutes_played) AS total_minutes
FROM players AS p
JOIN player_match_stats AS s ON s.player_id = p.player_id
GROUP BY p.position
ORDER BY total_goals DESC, total_assists DESC;

-- QUESTION 2: Which attacking players are efficient in limited minutes?
-- HAVING filters groups after the season totals have been calculated.
SELECT
    p.player_name,
    p.position,
    SUM(s.minutes_played) AS total_minutes,
    SUM(s.goals + s.assists) AS goal_contributions,
    ROUND(SUM(s.goals + s.assists) * 90.0 / SUM(s.minutes_played), 2) AS contributions_per_90
FROM players AS p
JOIN player_match_stats AS s ON s.player_id = p.player_id
WHERE p.position IN ('Forward', 'Midfielder')
GROUP BY p.player_id, p.player_name, p.position
HAVING SUM(s.minutes_played) < 300
ORDER BY contributions_per_90 DESC;

-- QUESTION 3: Did the team create more shots in wins or draws?
SELECT
    CASE
        WHEN m.team_goals > m.opponent_goals THEN 'Win'
        WHEN m.team_goals = m.opponent_goals THEN 'Draw'
        ELSE 'Loss'
    END AS match_result,
    COUNT(DISTINCT m.match_id) AS number_of_matches,
    SUM(s.shots) AS total_shots,
    ROUND(SUM(s.shots) * 1.0 / COUNT(DISTINCT m.match_id), 1) AS average_shots_per_match
FROM matches AS m
JOIN player_match_stats AS s ON s.match_id = m.match_id
GROUP BY match_result
ORDER BY average_shots_per_match DESC;

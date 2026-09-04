-- Compare season totals and account for differences in playing time.

SELECT
    p.player_name,
    p.position,
    COUNT(*) AS matches_played,
    SUM(s.minutes_played) AS total_minutes,
    SUM(s.goals) AS total_goals,
    SUM(s.assists) AS total_assists,
    SUM(s.goals + s.assists) AS goal_contributions,
    ROUND(SUM(s.minutes_played) * 1.0 / COUNT(*), 1) AS average_minutes_per_match,
    ROUND(SUM(s.goals + s.assists) * 90.0 / SUM(s.minutes_played), 2) AS contributions_per_90,
    CASE
        WHEN SUM(s.shots) = 0 THEN 0.0
        ELSE ROUND(SUM(s.goals) * 100.0 / SUM(s.shots), 1)
    END AS shot_conversion_percent
FROM players AS p
JOIN player_match_stats AS s ON s.player_id = p.player_id
GROUP BY p.player_id, p.player_name, p.position
ORDER BY goal_contributions DESC, contributions_per_90 DESC, p.player_name;

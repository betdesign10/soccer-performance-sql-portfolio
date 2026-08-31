-- Practice data. These are not real players or match results.

INSERT INTO players (player_id, player_name, position, jersey_number) VALUES
    (1, 'Alan C', 'Forward', 9),
    (2, 'Jimmy E', 'Midfielder', 10),
    (3, 'Rich B', 'Forward', 11),
    (4, 'Manny D', 'Midfielder', 8),
    (5, 'Christofer T', 'Defender', 4),
    (6, 'Quill P', 'Defender', 5),
    (7, 'Stefan R', 'Goalkeeper', 1),
    (8, 'Paul M', 'Midfielder', 6);

INSERT INTO matches (match_id, match_date, opponent, team_goals, opponent_goals) VALUES
    (1, '2026-04-05', 'Amundson United', 3, 1),
    (2, '2026-04-12', 'Windy City FC', 2, 2),
    (3, '2026-04-19', 'Ryland Soccer Club', 4, 1),
    (4, '2026-04-26', 'Lincolnwood SC', 1, 0),
    (5, '2026-05-03', 'Jacksonville City FC', 3, 2);

INSERT INTO player_match_stats (stat_id, player_id, match_id, minutes_played, goals, assists, shots) VALUES
    (1, 1, 1, 85, 1, 0, 4), (2, 2, 1, 90, 1, 1, 3),
    (3, 3, 1, 35, 1, 0, 2), (4, 4, 1, 80, 0, 1, 1),
    (5, 5, 1, 90, 0, 0, 0), (6, 6, 1, 90, 0, 0, 1),
    (7, 7, 1, 90, 0, 0, 0), (8, 8, 1, 60, 0, 0, 1),

    (9, 1, 2, 90, 1, 0, 5), (10, 2, 2, 90, 0, 1, 2),
    (11, 3, 2, 45, 0, 0, 1), (12, 4, 2, 90, 1, 0, 2),
    (13, 5, 2, 90, 0, 0, 0), (14, 6, 2, 90, 0, 0, 0),
    (15, 7, 2, 90, 0, 0, 0), (16, 8, 2, 55, 0, 1, 1),

    (17, 1, 3, 75, 2, 0, 6), (18, 2, 3, 90, 1, 1, 3),
    (19, 3, 3, 55, 1, 1, 3), (20, 4, 3, 85, 0, 1, 2),
    (21, 5, 3, 90, 0, 0, 1), (22, 6, 3, 90, 0, 0, 0),
    (23, 7, 3, 90, 0, 0, 0), (24, 8, 3, 65, 0, 0, 2),

    (25, 1, 4, 90, 0, 0, 3), (26, 2, 4, 90, 0, 1, 2),
    (27, 3, 4, 40, 1, 0, 2), (28, 4, 4, 90, 0, 0, 1),
    (29, 5, 4, 90, 0, 1, 0), (30, 6, 4, 90, 0, 0, 0),
    (31, 7, 4, 90, 0, 0, 0), (32, 8, 4, 50, 0, 0, 1),

    (33, 1, 5, 80, 1, 0, 4), (34, 2, 5, 90, 1, 1, 3),
    (35, 3, 5, 38, 0, 0, 1), (36, 4, 5, 90, 1, 0, 3),
    (37, 5, 5, 90, 0, 0, 0), (38, 6, 5, 90, 0, 0, 1),
    (39, 7, 5, 90, 0, 0, 0), (40, 8, 5, 70, 0, 1, 2);

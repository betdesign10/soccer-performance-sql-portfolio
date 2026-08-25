-- Set up the players, matches, and individual match stats.

PRAGMA foreign_keys = ON;

CREATE TABLE players (
    player_id INTEGER PRIMARY KEY,
    player_name TEXT NOT NULL,
    position TEXT NOT NULL CHECK (position IN ('Forward', 'Midfielder', 'Defender', 'Goalkeeper')),
    jersey_number INTEGER NOT NULL UNIQUE
);

CREATE TABLE matches (
    match_id INTEGER PRIMARY KEY,
    match_date TEXT NOT NULL,
    opponent TEXT NOT NULL,
    team_goals INTEGER NOT NULL,
    opponent_goals INTEGER NOT NULL
);

CREATE TABLE player_match_stats (
    stat_id INTEGER PRIMARY KEY,
    player_id INTEGER NOT NULL REFERENCES players(player_id),
    match_id INTEGER NOT NULL REFERENCES matches(match_id),
    minutes_played INTEGER NOT NULL CHECK (minutes_played BETWEEN 1 AND 120),
    goals INTEGER NOT NULL DEFAULT 0 CHECK (goals >= 0),
    assists INTEGER NOT NULL DEFAULT 0 CHECK (assists >= 0),
    shots INTEGER NOT NULL DEFAULT 0 CHECK (shots >= 0),
    UNIQUE (player_id, match_id)
);

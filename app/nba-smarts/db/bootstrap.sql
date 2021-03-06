create user app;
alter user app with password [YOUR_PASSWORD];

create schema stats;
grant usage on schema stats to app;     

create table stats.active_players(
        person_id integer primary key,
        display_last_comma_first varchar(100),
        display_first_last varchar(100),
        rosterstatus integer,
        from_year integer,
        to_year integer,
        playercode varchar(100),
        team_id integer,
        team_city varchar(30),
        team_name varchar(30),
        team_abbreviation varchar(10),
        team_code varchar(30),
        games_played_flag varchar(5),
        otherleague_experience_ch varchar(10),
        player_position varchar(10),
        fantasy_team_id integer,
        row_created_at timestamp default now(),
        row_updated_at timestamp default now()
)
;
create unique index person_id_idx on stats.active_players (person_id)
;
grant all on stats.active_players to app;

create table stats.player_season_totals (
        player_id integer,
        season varchar(10),
        team_id integer,
        team_abbreviation varchar(20),
        max_game_date timestamp,
        gp integer,
        w integer,
        l integer,
        "min" numeric(20,10),
        fgm integer,
        fga integer,
        fg3m integer,
        fg3a integer,
        ftm integer,
        fta integer,
        oreb integer,
        dreb integer,
        reb integer,
        ast integer,
        tov integer,
        stl integer,
        blk integer,
        pts integer,
        dd2 integer,
        td3 integer,
        row_created_at timestamp default now(),
        row_updated_at timestamp default now()
);
create index player_id_idx on stats.player_season_totals (player_id)
;
create index season_idx on stats.player_season_totals (season)
;
grant all on stats.player_season_totals to app;


create table stats.player_game_logs(
        player_id integer,
        season_year varchar(10),
        player_name varchar(100),
        team_abbreviation varchar(10),
        game_date timestamp,
        matchup varchar(20),
        wl varchar(3),
        "min" numeric(20,10),
        fgm integer,
        fga integer,
        fg3m integer,
        fg3a integer,
        ftm integer,
        fta integer,
        reb integer,
        ast integer,
        tov integer,
        stl integer,
        blk integer,
        pts integer,
        dd2 integer,
        td3 integer,
        row_created_at timestamp default now(),
        row_updated_at timestamp default now()
)
;
create index player_id_game_idx on stats.player_game_logs (player_id)
;
create index season_game_idx on stats.player_game_logs (season_year)
;
create index game_date_idx on stats.player_game_logs (game_date)
;
grant all on stats.player_game_logs to app;


create schema fantasy;
grant usage on schema fantasy to app;

create table fantasy.teams(
        id serial primary key,
        "name" varchar(1000),
        owner_name varchar(1000),
        row_created_at timestamp default now(),
        row_updated_at timestamp default now()
);
grant all on fantasy.teams to app;

insert into fantasy.teams ("name", owner_name)
values('JEAJEA', 'Jason Jea'),
        ('Keith', 'Keith Chan'),
        ('Daddy Doncic', 'Gabe'),
        ('Bimbo', 'Alex'),
        ('Covid Free 100%', 'Wayne Yu'),
        ('Team Squanchee', 'Ryan Newsom'),
        ('Team effx', 'Kelvin Chan'),
        ('Team bchang55', 'Brian Chang'),
        ('Team Jermmey', 'Jeremy Tsui'),
        ('Team pookyd', 'Kelvin Chan'),
        ('Team stephenhe', 'Stephen He'),
        ('Team andyflaco', 'Andy Wong')
;
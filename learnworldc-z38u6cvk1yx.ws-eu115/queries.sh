#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=worldcup --no-align --tuples-only -c"

# Do not change code above this line. Use the PSQL variable above to query your database.

echo -e "\nTotal number of goals in all games from winning teams:"
echo "$($PSQL "SELECT SUM(winner_goals) FROM games")"

echo -e "\nTotal number of goals in all games from both teams combined:"
echo "$($PSQL "SELECT SUM(winner_goals + opponent_goals) FROM games")"

echo -e "\nAverage number of goals in all games from the winning teams:"
echo "$($PSQL "SELECT ROUND(AVG(winner_goals), 16) FROM games")"

echo -e "\nAverage number of goals in all games from the winning teams rounded to two decimal places:"
echo "$($PSQL "SELECT ROUND(AVG(winner_goals), 2) FROM games")"

echo -e "\nAverage number of goals in all games from both teams:"
echo "$($PSQL "SELECT ROUND(AVG(winner_goals + opponent_goals), 16) FROM games")"

echo -e "\nMost goals scored in a single game by one team:"
echo "$($PSQL "SELECT MAX(winner_goals) FROM games")"

echo -e "\nNumber of games where the winning team scored more than two goals:"
echo "$($PSQL "SELECT COUNT(*) FROM games WHERE winner_goals > 2")"

echo -e "\nWinner of the 2018 tournament team name:"
ID_OF_2018_WINNER="$($PSQL "SELECT winner_id FROM games WHERE round = 'Final' AND year = 2018")"
echo "$($PSQL "SELECT name FROM teams WHERE team_id=$ID_OF_2018_WINNER")"

echo -e "\nList of teams who played in the 2014 'Eighth-Final' round:"
#echo "$($PSQL "SELECT name FROM teams FULL JOIN games WHERE round = 'Final' AND year = 2018 ON teams.team_id = games.winner_id AND teams.team_id = games.opponent_id")"
echo "$($PSQL "SELECT name FROM teams FULL JOIN games ON teams.team_id = games.winner_id OR teams.team_id = games.opponent_id  WHERE round = 'Eighth-Final' AND year = 2014 ORDER BY name")"

echo -e "\nList of unique winning team names in the whole data set:"
echo "$($PSQL "SELECT DISTINCT(name) FROM teams JOIN games ON teams.team_id = games.winner_id ORDER BY name" )"

echo -e "\nYear and team name of all the champions:"
echo "$($PSQL "SELECT DISTINCT year, name FROM teams JOIN games ON teams.team_id = games.winner_id WHERE round = 'Final'")"

echo -e "\nList of teams that start with 'Co':"
echo "$($PSQL "SELECT name FROM teams WHERE name LIKE '%Co%'")"
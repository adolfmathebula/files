#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

echo $($PSQL "TRUNCATE teams, games")
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
#WINNER
  if [[ $WINNER != "winner" ]]
  then
    #get team id
    WINNER_TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    #if team id not found
    if [[ -z $WINNER_TEAM_ID ]]
      then
        #insert team
        INSERT_WINNER_TEAM_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
        #get team it
        WINNER_TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
     
        #echo $WINNER
    fi
  fi
  #WINNER ENDS
  #OPPONENT
  if [[ $OPPONENT != "opponent" ]]
  then
    #get team id
    OPPONENT_TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    #if team id not found
    if [[ -z $OPPONENT_TEAM_ID ]]
      then
        #insert team
        INSERT_OPPONENT_TEAM_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
        #get team it
        OPPONENT_TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
        #echo $OPPONENT
    fi
  fi
  #OPPONENT ENDS

  # INSERT DATA INTO GAMES
  if [[ $YEAR != "year" && $ROUND != "round" && $WINNER_GOALS != "winner_goals" && $OPPONENT_GOALS != "opponent_goals" ]]
  then
    #insert game
    echo $($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_TEAM_ID,  $OPPONENT_TEAM_ID,  $WINNER_GOALS, $OPPONENT_GOALS)")
  fi

done
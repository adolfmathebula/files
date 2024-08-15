#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

APP(){
  echo -e "Enter your username:"
  read USERNAME

  # Get user details
  USER_EXIST_RESULT=$($PSQL "SELECT user_id, username FROM users WHERE username='$USERNAME'")
  IFS='|' read -r USER_ID DB_USERNAME <<< "$USER_EXIST_RESULT"

  # Check if the username exists and print the result
  if [[ -n $USER_ID ]]; then
    # Get games stats
    GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM games WHERE user_id = $USER_ID")
    
    # Best game
    BEST_GAME=$($PSQL "SELECT MIN(guesses) FROM games WHERE user_id = $USER_ID")

    echo "Welcome back, $DB_USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
    echo -e "\nGuess the secret number between 1 and 1000:"
    PLAY $USER_ID
  else
    echo "Welcome, $USERNAME! It looks like this is your first time here."
    echo -e "\nGuess the secret number between 1 and 1000:"
    PLAY
  fi
}

PLAY(){
  local USER_ID=$1
  local RANDOM_NUMBER=$((RANDOM % 1000 + 1))
  local GUESSES=0

  while true; do
    # Prompt user for input
    read INPUT

    # Increment the guess counter
    ((GUESSES++))

    # Check if the input is not an integer
    if ! [[ $INPUT =~ ^[0-9]+$ ]]; then
      echo "That is not an integer, guess again:"
      continue
    fi
    
    # Check if the input is within the valid range
    if [[ $INPUT -gt $RANDOM_NUMBER ]]; then
      echo "It's lower than that, guess again:"
    elif [[ $INPUT -lt $RANDOM_NUMBER ]]; then
      echo "It's higher than that, guess again:"
    else
      # Handle case for existing and new users
      if [[ -n $USER_ID ]]; then
        # Update existing user
        INSERT=$($PSQL "INSERT INTO games(user_id, guesses) VALUES($USER_ID, $GUESSES)")
      else
        # Add new user and game
        INSERT=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
        GET_USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
        IFS='|' read -r USER_ID <<< "$GET_USER_ID"
        INSERT=$($PSQL "INSERT INTO games(user_id, guesses) VALUES($USER_ID, $GUESSES)")
      fi

      echo "You guessed it in $GUESSES tries. The secret number was $RANDOM_NUMBER. Nice job!"
      break
    fi
  done
}

APP

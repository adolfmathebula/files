#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

APP(){
  if [[ -z $1 ]]; then
    echo -e "Please provide an element as an argument."
  else
    # Check if the argument is a number
    if [[ $1 =~ ^[0-9]+$ ]]
     then
     # get element info
      GET_INFO=$($PSQL "SELECT atomic_number, symbol, name FROM elements WHERE atomic_number = $1")
      IFS='|' read -r ATOMIC_NUMBER SYMBOL NAME <<< "$GET_INFO"

      if [[ -n $ATOMIC_NUMBER ]]
      #get properties info
      then
          GET_PROPERTIES=$($PSQL "SELECT atomic_mass, melting_point_celsius, boiling_point_celsius, type_id FROM properties WHERE atomic_number = $ATOMIC_NUMBER")
          IFS='|' read -r ATOMIC_MASS MELTING_POINT_CELSIUS BOILING_POINT_CELSIUS TYPE_ID <<< "$GET_PROPERTIES"
    
          #get type
          GET_TYPE=$($PSQL "SELECT type FROM types WHERE type_id = $TYPE_ID")
          IFS='|' read -r TYPE <<< "$GET_TYPE"

          echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius."
      else
          echo I could not find that element in the database.
      fi
    fi

    # Check if the argument is exactly two characters and is not a number
    if [[ ${#1} -eq 1 || ${#1} -eq 2 ]] && [[ ! $1 =~ [0-9] ]]
      then
     # get element info
      GET_INFO=$($PSQL "SELECT atomic_number, symbol, name FROM elements WHERE symbol = '$1'")
      IFS='|' read -r ATOMIC_NUMBER SYMBOL NAME <<< "$GET_INFO"

      if [[ -n $SYMBOL ]]
      #get properties info
      then
          GET_PROPERTIES=$($PSQL "SELECT atomic_mass, melting_point_celsius, boiling_point_celsius, type_id FROM properties WHERE atomic_number = $ATOMIC_NUMBER")
          IFS='|' read -r ATOMIC_MASS MELTING_POINT_CELSIUS BOILING_POINT_CELSIUS TYPE_ID <<< "$GET_PROPERTIES"
    
          #get type
          GET_TYPE=$($PSQL "SELECT type FROM types WHERE type_id = $TYPE_ID")
          IFS='|' read -r TYPE <<< "$GET_TYPE"

          echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius."
      else
          echo I could not find that element in the database.
      fi
    fi

    # Check if the argument is longer than two characters
    if [[ ${#1} -gt 2 && ! $1 =~ ^[0-9]+$ ]]
           then
     # get element info
      GET_INFO=$($PSQL "SELECT atomic_number, symbol, name FROM elements WHERE name = '$1'")
      IFS='|' read -r ATOMIC_NUMBER SYMBOL NAME <<< "$GET_INFO"

      if [[ -n $NAME ]]
      #get properties info
      then
          GET_PROPERTIES=$($PSQL "SELECT atomic_mass, melting_point_celsius, boiling_point_celsius, type_id FROM properties WHERE atomic_number = $ATOMIC_NUMBER")
          IFS='|' read -r ATOMIC_MASS MELTING_POINT_CELSIUS BOILING_POINT_CELSIUS TYPE_ID <<< "$GET_PROPERTIES"
    
          #get type
          GET_TYPE=$($PSQL "SELECT type FROM types WHERE type_id = $TYPE_ID")
          IFS='|' read -r TYPE <<< "$GET_TYPE"

          echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius."
      else
          echo I could not find that element in the database.
      fi
    fi
  fi
}

APP "$1"

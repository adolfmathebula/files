#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

APP(){
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

echo -e "\n~~~~~ MY SALON~~~~~\n"
echo "Welcome to My Salon, how can I help you?"
echo -e "\n1) Haircut \n2) Manicures\n3) Pedicures"
read SERVICE_ID_SELECTED

case $SERVICE_ID_SELECTED in
1) CREATE_CUSTOMER ;;
2) CREATE_CUSTOMER ;;
3) CREATE_CUSTOMER ;;
*) APP ;;
esac
}



CREATE_CUSTOMER(){

  GET_SERVICE=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
  echo "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  # get number
  USER_EXIST_RESULT=$($PSQL "SELECT * FROM customers WHERE phone='$CUSTOMER_PHONE'")
  # check if number does not exist
  if [[ -z $USER_EXIST_RESULT ]]
    then
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    echo -e "\nWhat time would you like your $GET_SERVICE, $CUSTOMER_NAME?"
    read SERVICE_TIME

    # Insert user
    INSERT_USER=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE','$CUSTOMER_NAME')")

    # get user id
    GET_CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")

    # insert appointment
    INSERT_APPPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($GET_CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

     echo -e "I have put you down for a $GET_SERVICE at $SERVICE_TIME, $CUSTOMER_NAME."

     else
     # get user id
     GET_CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")

      # get user name
     GET_CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")

    echo -e "\nWhat time would you like your $GET_SERVICE, $GET_CUSTOMER_NAME?"
    read SERVICE_TIME

    # insert appointment
      INSERT_APPPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($GET_CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

     echo -e "I have put you down for a $GET_SERVICE at $SERVICE_TIME,  $GET_CUSTOMER_NAME."

  fi
}


CREATE_USER(){
echo hey
}

APP
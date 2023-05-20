#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~ The Salon ~~~\n"

#get service list
SERVICES=$($PSQL "select service_id, name from services order by service_id")
echo -e "Welcome to my salon, how can I help you?"

SERVICE_LIST() {
  #show services available
  echo "$SERVICES" | while read SERVICE_ID BAR NAME
  do 
    echo "$SERVICE_ID) $NAME"
  done
}

MAIN_MENU(){
  if [[ $1 ]]
  then
    echo -e "$1"
  fi
  SERVICE_LIST
  read SERVICE_ID_SELECTED
  case $SERVICE_ID_SELECTED in
    1) APPOINTMENT ;;
    2) APPOINTMENT ;;
    3) APPOINTMENT ;;
    4) APPOINTMENT ;;
    5) APPOINTMENT ;;
    *) MAIN_MENU "I could not find that service. What would you like today?";;
  esac
}
CUSTOMER(){
  echo -e "What is your phone number?"
  read CUSTOMER_PHONE
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  if [[ -z $CUSTOMER_ID ]]
  then
    echo -e "No pervious record. What is your name?"
    read CUSTOMER_NAME
    INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name,phone) VALUES('$CUSTOMER_NAME','$CUSTOMER_PHONE')")
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  fi
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE customer_id = $CUSTOMER_ID")
}

APPOINTMENT(){
  CUSTOMER
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
  echo $(echo -e "What time would you like your $SERVICE_NAME, $CUSTOMER_NAME?" | sed 's/^ *$//g')
  read SERVICE_TIME
  GET_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id,service_id,time) VALUES ($CUSTOMER_ID,$SERVICE_ID_SELECTED,'$SERVICE_TIME')")

  echo $(echo -e "I have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME." | sed 's/^ *$//g')
}

MAIN_MENU


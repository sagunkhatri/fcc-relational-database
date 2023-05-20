#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

SECRET_NUM=$(($RANDOM%1001))
GUESS=0

echo "Enter your username:"
read USERNAME

USER_ID=$($PSQL "SELECT user_id FROM users where username='$USERNAME'")

if [[ ! -z $USER_ID ]]
then
  TOTAL_GAMES=$($PSQL "SELECT count(*) from games  INNER JOIN users USING(user_id) where user_id = $USER_ID")
  BEST_GUESS=$($PSQL "SELECT MIN(number_of_guess) FROM games INNER JOIN users USING(user_id) WHERE user_id = $USER_ID")
  echo "Welcome back, $USERNAME! You have played $TOTAL_GAMES games, and your best game took $BEST_GUESS guesses."
else
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  INSERT_USER=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
  USER_ID=$($PSQL "SELECT user_id FROM users where username='$USERNAME'")
fi
echo "Guess the secret number between 1 and 1000:"

while true; do
  read GUESSED_NUM
  ((GUESS++))
  if [[ ! $GUESSED_NUM =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
    continue
  fi
  if [[ $GUESSED_NUM = $SECRET_NUM ]]
  then
    INSERT_GAME=$($PSQL "INSERT INTO games(user_id, number_of_guess) values($USER_ID,$GUESS)")
    break
  fi
    
  if [[ $GUESSED_NUM > $SECRET_NUM ]] 
  then
    echo "It's lower than that, guess again:"
  else
    echo "It's higher than that, guess again:"
  fi
done
echo "You guessed it in $GUESS tries. The secret number was $SECRET_NUM. Nice job!"

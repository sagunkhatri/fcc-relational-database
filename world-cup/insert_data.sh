f [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
$PSQL "TRUNCATE TABLE games, teams"

cat games.csv | while IFS=',' read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $YEAR != year ]]
  then
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'") 
    #winning team not found
    if [[ -z $WINNER_ID ]]
    then
      INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')" )
      if [[ $INSERT_TEAM_RESULT = "INSERT 0 1" ]]
      then
        echo "INSERTED $WINNER into teams"
        WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
      fi
    fi
    #opponent not found
    if [[ -z $OPPONENT_ID ]]
    then
      INSERT_OPPONENT_RESULT=$($PSQL "INSERT INTO teams (name) VALUES ('$OPPONENT')")
      if [[ $INSERT_OPPONENT_RESULT = "INSERT 0 1" ]]
      then
        echo "INSERTED $OPPONENT into teams"
        OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
      fi
    fi

    INSERT_GAMES_RESULT=$($PSQL "INSERT INTO games(year,round,winner_id,opponent_id,winner_goals,opponent_goals) VALUES($YEAR,'$ROUND',$WINNER_ID,$OPPONENT_ID,$WINNER_GOALS,$OPPONENT_GOALS)")
    if [[ $INSERT_GAMES_RESULT = "INSERT 0 1" ]]
    then
      echo "INSERTED $YEAR $ROUND $WINNER $OPPONENT "
    fi




  fi
done


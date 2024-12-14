#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi


# Do not change code above this line. Use the PSQL variable above to query your database.

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $YEAR != "year" ]]
  then
    #get team ID
    WINNER_ID=$($PSQL "select team_id from teams where name='$WINNER'");
    #if not found
    if [[ -z $WINNER_ID ]]
    then
      $($PSQL "insert into teams(name) values ('$WINNER')")
      # WINNER_ID=$($PSQL "select team_id from teams where team=$WINNER");

    fi


    OPPONENT_ID=$($PSQL "select team_id from teams where name='$OPPONENT'");
    if [[ -z $OPPONENT_ID ]]
    then
      $($PSQL "insert into teams(name) values ('$OPPONENT')")
     # OPPONENT_ID=$($PSQL "select team_id from teams where team=$OPPONENT");
    fi

    WINNER_ID=$($PSQL "select team_id from teams where name='$WINNER'");
    OPPONENT_ID=$($PSQL "select team_id from teams where name='$OPPONENT'");
    $($PSQL "insert into games(winner_id, opponent_id, winner_goals, opponent_goals, year, round) values ($WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS, $YEAR, '$ROUND')")





  fi


done

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do


done

















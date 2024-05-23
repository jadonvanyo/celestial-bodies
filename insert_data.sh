#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

echo $($PSQL "TRUNCATE games, teams")

GET_TEAM_ID() {
  # get team_id
  TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$1';")
  # if not found
  if [[ -z $TEAM_ID ]]
  then
    # insert team_id
    INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$1');")
    if [[ $INSERT_TEAM_RESULT == 'INSERT 0 1' ]]
    then
      echo "Inserted into teams, $1"
    fi
    # get team_id
    TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$1';")
  fi
  return $TEAM_ID
}

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $YEAR != year ]]
  then
    # get winner_id
    GET_TEAM_ID "$WINNER"
    WINNER_ID=$TEAM_ID
    # get opponent_id
    GET_TEAM_ID "$OPPONENT"
    OPPONENT_ID=$TEAM_ID
    # insert game data
    INSERT_GAME=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")
  fi
done
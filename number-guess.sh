#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# get username input
echo Enter your username:
read USERNAME_INPUT

# get username from username given
USER_INFO=$($PSQL "SELECT * FROM users WHERE username='$USERNAME_INPUT'")

# if no username
if [[ -z $USER_INFO ]]
then
  # inssert username into the database
  INSERT_USERNAME_RESULT=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME_INPUT')")
  
  # communicate the username
  echo Welcome, $USERNAME_INPUT! It looks like this is your first time here.
else
  # retreive user data based on username
  echo "$USER_INFO" | (IFS="|" read USER_ID USERNAME GAMES_PLAYED BEST_GAME;
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses.")
fi

# generate the secret number
SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))
echo $SECRET_NUMBER
# set guess counter
GUESS_COUNTER=0
# get user guess
echo Guess the secret number between 1 and 1000:

GUESS_NUMBER () {
  # read the user guess
  read USER_GUESS
  
  # if user guess not an integer
  if [[ ! $USER_GUESS =~ ^[0-9]+$ ]]
  then
    # get a new user guess
    echo That is not an integer, guess again:
    GUESS_NUMBER
  fi

  # increase guess counter
  ((GUESS_COUNTER++))
  # if the secret number is lower
  if [[ $SECRET_NUMBER < $USER_GUESS ]]
  then
    echo "It's lower than that, guess again:"
    GUESS_NUMBER
  elif [[ $SECRET_NUMBER > $USER_GUESS ]]
  then
    echo "It's higher than that, guess again:"
    GUESS_NUMBER
  else
    # update the games played
    GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE username='$USERNAME_INPUT'")
    ((GAMES_PLAYED++))
    UPDATE_GAMES_PLAYED=$($PSQL "UPDATE users SET games_played=$GAMES_PLAYED WHERE username='$USERNAME_INPUT'")

    # get best game played
    BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE username='$USERNAME_INPUT'")
    if [[ $BEST_GAME -gt $GUESS_COUNTER || -z $BEST_GAME ]]
    then
      UPDATE_BEST_GAME=$($PSQL "UPDATE users SET best_game=$GUESS_COUNTER WHERE username='$USERNAME_INPUT'")
    fi
    echo You guessed it in $GUESS_COUNTER tries. The secret number was $SECRET_NUMBER. Nice job!
  fi
}

GUESS_NUMBER
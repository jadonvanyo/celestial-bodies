#/!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

# if no iput was given
if [[ -z $1 ]]
then
  echo Please provide an element as an argument.
else
  # if input is not a number
  if [[ ! $1 =~ ^[0-9]+$ ]]
  then
    # input was not a number
    GET_ELEMENT=$($PSQL "SELECT * FROM elements JOIN properties USING (atomic_number) JOIN types USING (type_id) WHERE symbol='$1' OR name='$1'")
  else
    # if input was a number
    GET_ELEMENT=$($PSQL "SELECT * FROM elements JOIN properties USING (atomic_number) JOIN types USING (type_id) WHERE atomic_number=$1")
  fi

  # if no element was found
  if [[ -z $GET_ELEMENT ]]
  then
    echo I could not find that element in the database.
  else
    # present element info to the user
    echo "$GET_ELEMENT" | (IFS="|" read TYPE_ID ATOMIC_NUMBER SYMBOL NAME ATOMIC_MASS MELTING_POINT BOILING_POINT TYPE;
    echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. Hydrogen has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius.")
  fi
fi
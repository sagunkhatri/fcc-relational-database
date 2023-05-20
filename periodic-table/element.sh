QL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"
#if no argument passed
if [[ -z $1 ]]
then
echo -e "Please provide an element as an argument."
else
  #if argument is not a number
  if [[ ! $1 =~ ^[0-9]+$ ]]
  then
  ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE ( symbol = '$1' OR name = '$1')")
  else
  ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number=$1")
  fi
  #element not found
  if [[ -z $ATOMIC_NUMBER ]]
  then
    echo -e "I could not find that element in the database."
  else
    #element found
    ELEMENT_DETAILS=$($PSQL "SELECT * FROM elements INNER JOIN properties USING (atomic_number) INNER JOIN types USING (type_id) WHERE atomic_number = $ATOMIC_NUMBER")
    IFS="|" read -r TYPE_ID ATOMIC_N SYMBOL NAME ATOMIC_W MELTING BOILING TYPE <<< $ELEMENT_DETAILS
    echo -e "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_W amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
  fi
  
fi


#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
# to get random numbers
GAME_NUMBER=$(( $RANDOM % 1000 + 1 ))
NUMBER_OF_GUESSES=0

# main function
MAIN () {
  # welcome and to get a username
  echo "Enter your username:"
  read USER_NAME
  # check the username in users table
  USERNAME_CHECK_RESULT=$($PSQL "SELECT user_index, user_name, games_played, best_game FROM users WHERE user_name='$USER_NAME'")
  if [[ -z $USERNAME_CHECK_RESULT ]]
  then
    ADD_USER_NAME=$($PSQL "INSERT INTO users(user_name) VALUES('$USER_NAME')")
    echo "Welcome, $USER_NAME! It looks like this is your first time here."
  else
    IFS="|" read -r USER_INDEX USER_NAME GAMES_PLAYED BEST_GAME <<< "$USERNAME_CHECK_RESULT"
    unset IFS
    echo "Welcome back, $USER_NAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  fi
    GUESS
}

TRY_NUMBER_CHECK(){
    while true; do
    read TRY_NUMBER
    if [[ ! $TRY_NUMBER =~ ^[0-9]+$ ]]; then
      echo "That is not an integer, guess again:"
    else
      (( NUMBER_OF_GUESSES++ ))
      break
    fi
  done
}

GUESS () {
  echo "Guess the secret number between 1 and 1000:"
  TRY_NUMBER_CHECK
  # as long as user give a guessing number, GAMES_PLAYED will be count by 1;
  UPDATE_GAMES_PLAYED=$($PSQL "UPDATE users SET games_played = games_played + 1 WHERE user_name='$USER_NAME'")
  # check the TRY_NUMBER and give prompts about "higher" or "lower";
  while (( $TRY_NUMBER != $GAME_NUMBER ))
  do
    if (( $TRY_NUMBER > $GAME_NUMBER ))
    then
      echo "It's lower than that, guess again:"
    else
      echo "It's higher than that, guess again:"
    fi
    TRY_NUMBER_CHECK
  done
  # update the best_game column
  UPDATE_BUST_GAME=$($PSQL "UPDATE users SET best_game = $NUMBER_OF_GUESSES WHERE (user_name='$USER_NAME') AND (best_game IS NULL OR (best_game > $NUMBER_OF_GUESSES))")
  echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $GAME_NUMBER. Nice job!"
  }

MAIN

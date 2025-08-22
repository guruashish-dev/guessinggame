#!/usr/bin/env bash

# Function to count files in current directory (including hidden files)
function file_count {
    echo $(find . -maxdepth 1 -type f | wc -l)
}

correct=$(file_count)
guess=-1

echo "Welcome to the Guessing Game!"
echo "How many files are in the current directory?"
echo "Enter your guess: "

while [[ $guess -ne $correct ]]
do
    read guess
    if [[ $guess -lt $correct ]]
    then
        echo "Your guess is too low. Try again:"
    elif [[ $guess -gt $correct ]]
    then
        echo "Your guess is too high. Try again:"
    else
        echo "🎉 Congratulations! You guessed it right!"
    fi
done

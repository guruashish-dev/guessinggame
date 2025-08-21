#!/bin/bash

# Function to get the number of files in the current directory
get_file_count() {
    echo $(ls -1 | wc -l)
}

# Function to prompt the user for a guess and give feedback
guess_number() {
    local file_count=$(get_file_count)
    local guess=-1

    echo "Welcome to the guessing game!"
    echo "Can you guess how many files are in the current directory?"

    while [ "$guess" -ne "$file_count" ]; do
        read -p "Enter your guess: " guess

        if ! [[ "$guess" =~ ^[0-9]+$ ]]; then
            echo "Please enter a valid number."
        elif [ "$guess" -lt "$file_count" ]; then
            echo "Too low! Try again."
        elif [ "$guess" -gt "$file_count" ]; then
            echo "Too high! Try again."
        else
            echo "Congratulations! You guessed the correct number of files: $file_count"
        fi
    done
}

# Start the game
guess_number

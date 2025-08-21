#!/bin/bash
# Bash Guessing Game

guess_files() {
    local file_count=$(ls -1 | wc -l)
    local guess
    while true; do
        read -p "Guess the number of files in the current directory: " guess
        if ! [[ "$guess" =~ ^[0-9]+$ ]]; then
            echo "Please enter a valid number."
            continue
        fi
        if (( guess < file_count )); then
            echo "Too low! Try again."
        elif (( guess > file_count )); then
            echo "Too high! Try again."
        else
            echo "Congratulations! You guessed correctly."
            break
        fi
    done
}

echo "Welcome to the Bash Guessing Game!"
guess_files

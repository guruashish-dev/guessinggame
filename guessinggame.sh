#!/bin/bash
# Bash Guessing Game
# A fun interactive game where you try to guess
# how many files exist in the current directory.

# Function: print a horizontal separator
print_separator() {
    echo "---------------------------------------------"
}

# Function: display instructions
show_instructions() {
    print_separator
    echo "INSTRUCTIONS:"
    echo "1. The program will ask you to guess how many files"
    echo "   are present in the current directory."
    echo "2. Enter a valid number when prompted."
    echo "3. If your guess is too high or too low, the game"
    echo "   will let you know so you can try again."
    echo "4. Keep guessing until you find the correct number."
    print_separator
}

# Function: get actual number of files in current directory
get_file_count() {
    echo $(ls -1 | wc -l)
}

# Function: the main guessing loop
guess_files() {
    local file_count=$(get_file_count)
    local guess
    while true; do
        read -p "Guess the number of files in the current directory: " guess
        
        # Validate input
        if ! [[ "$guess" =~ ^[0-9]+$ ]]; then
            echo "Invalid input. Please enter a valid number."
            continue
        fi

        # Compare guess with actual count
        if (( guess < file_count )); then
            echo "Too low! Try again."
        elif (( guess > file_count )); then
            echo "Too high! Try again."
        else
            echo "🎉 Congratulations! You guessed correctly."
            break
        fi
    done
}

# Function: ask user if they want to play again
play_again() {
    while true; do
        read -p "Do you want to play again? (y/n): " choice
        case "$choice" in
            y|Y ) echo "Restarting the game..."; return 0 ;;
            n|N ) echo "Thanks for playing! Goodbye."; return 1 ;;
            * ) echo "Please enter y or n." ;;
        esac
    done
}

# Main program starts here
print_separator
echo "Welcome to the Bash Guessing Game!"
print_separator

show_instructions

while true; do
    guess_files
    if ! play_again; then
        break
    fi
done

#!/bin/bash

# Function to simulate the Stoplight Game
stoplight_game() {
    # Define possible choices: S (Stop) and G (Go)
    choices=("S" "G")

    # Randomly select choices for both players
    player1=${choices[$((RANDOM % 2))]}
    player2=${choices[$((RANDOM % 2))]}

    # Display player choices
    echo "Player 1 chooses: $player1"
    echo "Player 2 chooses: $player2"

    # Determine outcome based on game rules
    if [[ "$player1" == "S" && "$player2" == "S" ]]; then
        echo "Outcome: Both stopped, no risk. (Payoff: 0, 0)"
    elif [[ "$player1" == "S" && "$player2" == "G" ]]; then
        echo "Outcome: Player 1 stopped, Player 2 went. (Payoff: 1, -1)"
    elif [[ "$player1" == "G" && "$player2" == "S" ]]; then
        echo "Outcome: Player 1 went, Player 2 stopped. (Payoff: -1, 1)"
    else
        echo "Outcome: Both went, crash! (Payoff: -10, -10)"
    fi
}

# Run the Stoplight Game
stoplight_game


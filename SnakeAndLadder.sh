#!/bin/bash -x
#Problem Statement:- Write a Programme to play snake and ladder game between two players
#Author:-  Balaji Ijjapwar
#Date:- 22 March 2020

echo "-------SNAKE AND LADDER GAME-------"

START=0
NO_PLAY=0
SNAKE=1
LADDER=2
WIN=100

playerPos=$START

echo "Starting position is $START"

function playGame() {
	totalDiceRolls=0
	while [ $playerPos -lt $WIN ]
	do
		diceValue=$((RANDOM % 6 + 1))
		((totalDiceRolls++))
		echo -e "\nDice value is $diceValue"
		option=$((RANDOM % 3))
		case $option in
			$NO_PLAY)
				echo "No Play";;
			$SNAKE)
				echo "Snake"
				if [ $((playerPos - diceValue)) -lt 0 ]
				then
					playerPos=$START
				else
					((playerPos-=$diceValue))
				fi;;
			$LADDER)
				echo "Ladder"
				if [ $((playerPos + diceValue)) -le 100 ]
            then
					((playerPos+=$diceValue))
				fi;;
		esac
		echo "Player position is $playerPos"
	done
	echo "The dice was rolled $totalDiceRolls times to reach winning position"
}

playGame

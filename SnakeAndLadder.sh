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
	while [ $playerPos -lt $WIN ]
	do
		diceValue=$((RANDOM % 6 + 1))
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
				((playerPos+=$diceValue));;
		esac
		echo "Player position is $playerPos"
	done
}

playGame

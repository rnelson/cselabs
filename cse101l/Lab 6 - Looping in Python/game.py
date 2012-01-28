#!/usr/bin/env python
import random

# Generate the number that the user tries to guess
number = random.randrange(1, 10)

# Print a welcome message to the user telling them
# about the game
print("Number Guessing Game")
print("--------------------")
print("A random number between 1 and 10 has been generated. Your")
print("goal is to guess the number I'm thinking of. Go!")
print("")

# Let's tell them the right answer; makes it easier
# to test and grade ;-)
print("The answer is: %d" % number)
print("")

# Get a guess from the user
guess = int(raw_input("Guess? "))

# Check the user' value against the answer and inform
# them of how they did
if guess == number:
	print("Congrats! You win.")
elif guess < number:
	print("Sorry, your guess is too small.")
else:
	print("Sorry, your guess is too large.")

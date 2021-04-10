#!/bin/bash

# loops over space separated arguments
for colour in red green blue; do 
  echo $colour 				# Logs red green blue separated by newlines
done

echo

# if using variables it is important to wrap them in quotes to prevent any spaces in the variables
# acting as delimiters
RED="red"
GREEN="light green"
BLUE="dark blue"

for colour in $RED $GREEN $BLUE; do 
  echo $colour				# this prints the light and dark as separate colours
done					# because it treats the spaces in the vars as delimiters

echo

# to fix:
for colour in "$RED" "$GREEN" "$BLUE"; do
  echo $colour				# this echoes the three colours as it should
done


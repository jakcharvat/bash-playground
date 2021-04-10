#!/bin/bash

X=3
Y=4
EMPTY_STRING=""

if [ $X -lt $Y ]; then 					# if x < y
  echo "\$X=${X}, which is smaller than \$Y=${Y}"
fi


if [ -n "$EMPTY_STRING" ]; then 			# if $EMPTY_STRING is an empty string
  echo "Empty string is not empty"
fi


if [ -e "${HOME}/.fvwmrc" ]; then 			# if the file $HOME/.fvwmrc exists
  echo "You have a .fvwmrc file"
  
  if [ -L "${HOME}/.fvwmrc" ]; then 			# if the file is a symlink
    echo "It's a symlink"
  else
    echo "It's a regular file"
  fi
else
  echo "You have no .fvwmrc file"
fi


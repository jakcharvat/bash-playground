#!/bin/bash

if [ -n 'Hello' ]; then 	# -n tests if the argument is non-empty
  echo '"Hello" is non-empty'
fi


if [ -n '' ]; then
  echo '"" is non-empty'
fi


X=''

if [ -n $X ]; then 
  # This will fire because $X expands to nothing, not a string, therefore -n behaves as if it was
  # passed no arguments, therefore it returns true (default behaviour). This is a bit like falsy 
  # and truthy variables in JS, just here the expanded empty string acts as a null object of sort
  #
  # An explanation of the following from http://www.panix.com/~elflord/unix/bash-tute.html
  #   Why? because the shell expands $X to the empty string. The expression [ -n ] returns true 
  #   (since it is not provided with an argument).
  echo 'Expanded variable X='"''"' is non-empty'
fi


if [ -n "$X" ]; then
  # Here the empty $X is expanded within a string literal, therefore -n is provided an argument, 
  # an empty string, and therefore returns false so the following line doesn't fire
  #
  # From the tutorial:
  #   In this example, the expression expands to [ -n "" ] which returns false, since the string 
  #   enclosed in inverted commas is clearly empty.
  echo 'String with expanded variable X='"''"' is non-empty'
fi


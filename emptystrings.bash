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
  echo 'Expanded variable X='"''"' is non-empty'
fi


if [ -n "$X" ]; then
  # Here the empty $X is expanded within a string literal, therefore -n is provided an argument, 
  # an empty string, and therefore returns false so the following line doesn't fire
  echo 'String with expanded variable X='"''"' is non-empty'
fi


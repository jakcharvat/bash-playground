#!/bin/bash

X=ABC
echo "$Xabc" 	# prints nothing because it looks for the variable Xabc which doesn't exist
echo "${X}abc"	# prints ABCabc


#!/bin/bash

if [ 1=2 ]; then
  # this will fire because there are no spaces around the equals sign above. 
  # therefore, bash treats the whole comparison as a single operand, and hence
  # the test returns true. 
  echo "1==2"
fi


# this fixes the above bug
if [ 1 = 2 ]; then 
  echo "1==2"
else
  echo "1!=2"
fi



# similarly, it is important to always wrap comparison variables in quotes, otherwise
# they can be expanded to commands and can cause unintended behaviour
X="-n"
Y=""

if [ $X = $Y ]; then 
  # this fires because the above test expands to [ -n = ] which is true since "=" has 
  # non-zero length
  echo '$X==$Y'
fi

# to fix the above bug:
if [ "$X" = "$Y" ]; then 
  echo '$X==$Y'
else
  # this works because now the test correctly expands to [ "-n" = "" ] which is false
  echo '$X!=$Y'
fi


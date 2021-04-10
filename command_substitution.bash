#!/bin/bash

files="$(ls)"
md_files=`ls | grep '.md'`

echo -e "$files\n" 		# we need the quotes to preserve newlines in $files
echo -e "$md_files\n"		# again, we need the quotes to preserve newlines

X=`expr 3 \* 2 + 4`		# expr evaluates mathematical equations. `man expr` to get more details
echo $X


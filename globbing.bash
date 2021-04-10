#!/bin/bash

YELLOW=`tput setaf 3`
RESET=`tput sgr0`

echo "${YELLOW}All files in current working dir:${RESET}"
echo *				# echoes all files in current working dir

echo
echo "${YELLOW}MD files in current working dir:${RESET}"

echo *.md 			# echoes all files matching the predicate (anything.md) in the working dir

echo
echo "${YELLOW}PDF files in ~/Documents:${RESET}"

echo ${HOME}/Documents/*.pdf 	# echoes all pdfs in the specified directory (~/Documents)

echo 
echo "${YELLOW}No \"for\":${RESET}"

for file in *.bash; do
  grep -L 'for' "$file"	# echoes the names of bash files which do not contain the word 'for'
done


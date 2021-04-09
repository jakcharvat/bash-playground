#!/bin/bash

LS="ls"
LS_FLAGS="-al"

# This will legit replace the variables with their values **before** executing the line,
# and so when it executes the line it actually runs the command "ls -al [$HOME]"
$LS $LS_FLAGS $HOME


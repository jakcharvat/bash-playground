#!/bin/bash

read ITERS

DASH='_'
TREE='1'

IMAGE_WIDTH=100

print_dashes () {
  for ((__j=0; __j<$1; __j++)); do echo -n "$DASH"; done
}


print_tree () {
  echo -n "$TREE"
}


print_newline () {
  echo
}


tree () {
  local __iteration=$1
  local __print_tree=$2
  local __segment_height=$(echo "2 ^ (5 - $__iteration)" | bc -l)

  local __tree_count=$(echo "2 ^ ($__iteration - 1)" | bc -l)
  local __tree_separation=$(($__segment_height * 2 - 1))

  local __tree_row_width=$(( ($__tree_count * 2 - 1) * $__tree_separation + $__tree_count * 2))
  local __remaining=$(($IMAGE_WIDTH - $__tree_row_width))
  local __padding_left=$(($__remaining / 2))
  local __padding_right=$(($__remaining - $__padding_left))

  if [[ $__print_tree = 0 ]]; then
    local i
    for ((i=0; i<$(($__segment_height * 2)); i++)); do
      print_dashes $IMAGE_WIDTH
      print_newline
    done
    return
  fi


  local i
  for ((i=$__segment_height; i>0; --i)); do 
    local __separation=$(($i * 2 - 1))
    local __side=$(($__segment_height - $i))

    print_dashes __padding_left
    
    local j
    for ((j=0; j<$__tree_count; ++j)); do
      if [[ $j != 0 ]]; then
	print_dashes __tree_separation
      fi
      print_dashes __side
      print_tree
      print_dashes __separation
      print_tree
      print_dashes __side
    done

    print_dashes __padding_right
    print_newline

  done

  __side=$(($__side + 1))
  for ((i=$__segment_height; i>0; --i)); do 
    print_dashes __padding_left
    local j
    for ((j=0; j<$__tree_count; ++j)); do
      if [[ $j != 0 ]]; then
	print_dashes __tree_separation
      fi
      print_dashes __side
      print_tree
      print_dashes __side
    done

    print_dashes __padding_right
    print_newline
  done
}

print_dashes $IMAGE_WIDTH
print_newline

for ((iter=5; iter>0; iter--)); do
  [ $iter -gt $ITERS ]
  tree $iter $?
done


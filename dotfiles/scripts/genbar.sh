#!/bin/bash
percentage=$1
#block lookup

blocks=("░" "▒" "▓" "█")

#write full blocks

full_blocks=$((percentage / 10))
remainder=$((percentage % 10))

#define if remainder is more or less than five and choose the appropriate 
#block from lookup

partial_index=$(( (remainder > 0) * (1 + (remainder >= 5)) ))

#initialize string

bar=""

#write full blocks into string

printf -v bar '%*s' $full_blocks ""; bar=${bar// /${blocks[3]}}

#write partial 

(( remainder > 0 )) && bar+="${blocks[partial_index]}"

#fill bar with empty

printf -v empty '%*s' $((10 - ${#bar})) ""; bar+="${empty// /${blocks[0]}}"
echo "$bar"

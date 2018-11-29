#!/bin/bash
declare -a results
results=()
# We will run the script for a maximum of 15 seconds (between 10 and 20)
end=$((SECONDS+8))
# We will make sure we don't enter if we have already passed 15
while [ $SECONDS -lt $end ]; do
# We will use this to timeout our execution

    ((time_left=$end-$SECONDS))

# The most important command here is timeout
# We must stop execution after 15 seconds and we will keep running the simulation in a loop
# Every iteration reduces the available time left
# This way it is impossible to go over the time limit

#dd does the read test of imaginary file 1000 times
# after that sed removes all lines that have the word record in them
# after that tr removes parentheses from the output
# after that we have space separated values and the eighth is the one we want
# it is in GB/s so we convert that to bytes/s
    result=$(timeout $time_left dd if=/dev/zero of=test.img bs=1000 count=10 2>&1 | sed -r '/.*records /d' | tr -d '()' | awk '{printf "%.0f\n", ($8*1024)*1024*1024 }')
# If we had to ttimeout our execution than we will only add the result if it is not empty

    if ! [ -z ${result} ] ; then
#echo $result
    results+=($result)
    fi
done

# This function sorts our array in ascending order and creates a new array from that
IFS=$'\n' sorted_array=($(sort <<<"${results[*]}"))
unset IFS
#for i in ${sorted_array[@]}; do echo $i; done

# We need the length of our array to find the median
length=${#results[@]}

if (( $length % 2 == 0 )) ; then
# We need complicated echo to work with floating point numbers

awk "BEGIN {printf \"%.1f\", (${sorted_array[($length-1)/2]}+${sorted_array[($length-1)/2 + 1]}) / 2}"
else
# If its odd we just output the middle value
echo ${sorted_array[$length / 2]}
fi

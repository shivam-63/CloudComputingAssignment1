#!/bin/bash
BASEDIR=$(dirname "$0")
EXECUTABLE="memsweep"

if [ ! -e $EXECUTABLE ] ; then
	gcc -O -o memsweep memsweep.c -lm
fi

chmod +x memsweep
declare -a results
results=()

# We will run the script for a maximum of 15 seconds (between 10s and 20s)
end=$((SECONDS+15))
# We will make sure we don't enter if we have already passed 15
while [ $SECONDS -lt $end ]; do 

    # We will use this to timeout our execution
    ((time_left=$end-$SECONDS))
       
    # The most important command here is timeout
    # We must stop execution after 15 seconds and we will keep running the simulation in a loop
    # Every iteration reduces the available time left
    # This way it is impossible to go over the time limit   
   	if [ "$SYSTEMROOT" = "C:\Windows" ] ; then
        result=$(timeout $time_left ./memsweep.exe | sed "s/[[:blank:]]\+/ /g" | cut -d " " -f 7) 
    else
        result=$(timeout $time_left ./${EXECUTABLE} | sed "s/[[:blank:]]\+/ /g" | cut -d " " -f 7)
    fi

    # If we had to timeout our execution than we will only add the result if it is not empty	
    if ! [ -z "$result" ] ; then
		results+=($result)
    fi

done

# This function sorts our array in ascending order and creates a new array from that
IFS=$'\n' sorted_array=($(sort <<<"${results[*]}"))
unset IFS

# We need the length of our array to find the median
length=${#results[@]}

if (( $length % 2 == 0 )) ; then
    # We need complicated echo to work with floating point numbers
	awk "BEGIN {printf \"%.1f\", (${sorted_array[($length-1)/2]}+${sorted_array[($length-1)/2 + 1]}) / 2}" 
else 
    # If its odd we just output the middle value
    echo ${sorted_array[$length / 2]}
fi

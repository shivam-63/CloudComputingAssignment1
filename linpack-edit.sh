#!/bin/bash 
EXECUTABLE="linpack"
if [ ! -e $EXECUTABLE ] ; then
        echo "Compiling linpack.c (requires GNU compiler collection)"
        gcc -O -o linpack linpack.c -lm
fi

echo "Running linpack benchmark"

median=0
declare -a results
results=()
end=$((SECONDS+21))
while [ $SECONDS -lt $end ]; do 
        
        ((time_left=$end-$SECONDS))
        
        if [ "$SYSTEMROOT" = "C:\Windows" ] ; then
                result= $(timeout $time_left ./linpack.exe | tail -1 | sed "s/[[:blank:]]\+/ /g" | cut -d " " -f 7) 
        else
                result=$(timeout $time_left ./${EXECUTABLE} | tail -1 | sed "s/[[:blank:]]\+/ /g" | cut -d " " -f 7)
        fi
                
        if ! [ -z ${result} ] ; then
               # echo $result    
                results+=($result)
        fi
done

#sorted_array=($(echo ${results[*]} | sort -g))
IFS=$'\n' sorted_array=($(sort <<<"${results[*]}"))
unset IFS
#for i in ${sorted_array[@]}; do echo $i; done

length=${#results[@]}

if (( $length % 2 == 0 )) ; then

        echo $(echo "scale=3; (${sorted_array[($length-1)/2]}+${sorted_array[($length-1)/2 + 1]}) / 2" | bc -l)
else 

      echo ${sorted_array[$length / 2]}
fi
#echo "Benchmark result: $result KFLOPS"